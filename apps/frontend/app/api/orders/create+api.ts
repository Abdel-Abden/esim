// app/api/orders/create+api.ts
// POST — Réserve un ICCID + crée un PaymentIntent Stripe

import { sql } from '@/db/client';
import { stripe } from '@/db/stripe-server';

export async function POST(request: Request) {
  try {
    const { offerId, email, discountCode } = await request.json();

    if (!offerId || !email) {
      return Response.json(
        { error: 'offerId et email sont requis.' },
        { status: 400 }
      );
    }

    // 1. Récupérer l'offre + l'eSIM produit
    const [offer] = await sql`
      SELECT o.*, e.name AS esim_name, e.flag
      FROM offers o
      JOIN esims e ON e.id = o.esim_id
      WHERE o.id = ${offerId}
    `;

    if (!offer) {
      return Response.json({ error: 'Offre introuvable.' }, { status: 404 });
    }

    // 2. Calculer le prix final (discount éventuel)
    let finalPrice = Number(offer.base_price);
    let discountId: string | null = null;

    if (discountCode) {
      const [discount] = await sql`
        SELECT * FROM discounts
        WHERE code = ${discountCode}
          AND active = TRUE
          AND (offer_id IS NULL OR offer_id = ${offerId})
          AND (starts_at IS NULL OR starts_at <= NOW())
          AND (ends_at IS NULL OR ends_at >= NOW())
      `;

      if (discount) {
        discountId = discount.id;
        if (discount.type === 'percent') {
          finalPrice = finalPrice * (1 - Number(discount.value) / 100);
        } else {
          finalPrice = Math.max(0, finalPrice - Number(discount.value));
        }
        finalPrice = Math.round(finalPrice * 100) / 100;
      }
    }

    // 3. Réserver un ICCID disponible (FOR UPDATE SKIP LOCKED = anti race-condition)
    const [inventory] = await sql`
      SELECT id, iccid FROM esim_inventory
      WHERE esim_id = ${offer.esim_id}
        AND status = 'available'
      LIMIT 1
      FOR UPDATE SKIP LOCKED
    `;

    if (!inventory) {
      return Response.json(
        { error: 'Stock épuisé pour cette offre.' },
        { status: 409 }
      );
    }

    // 4. Créer le PaymentIntent Stripe
    const paymentIntent = await stripe.paymentIntents.create({
      amount: Math.round(finalPrice * 100), // en centimes
      currency: 'eur',
      receipt_email: email,
      metadata: {
        offerId,
        inventoryId: inventory.id,
        esimName: offer.esim_name,
        flag: offer.flag,
      },
    });

    const customer = await stripe.customers.create({ email });

    const ephemeralKey = await stripe.ephemeralKeys.create(
      { customer: customer.id },
      { apiVersion: '2024-12-18.acacia' }
    );

    // 5. Créer la commande en BDD + réserver l'ICCID (transaction)
    const [order] = await sql`
      WITH new_order AS (
        INSERT INTO orders (offer_id, inventory_id, email, stripe_payment_intent, amount, discount_id)
        VALUES (${offerId}, ${inventory.id}, ${email}, ${paymentIntent.id}, ${finalPrice}, ${discountId})
        RETURNING id
      )
      UPDATE esim_inventory
      SET status = 'reserved',
          reserved_at = NOW(),
          order_id = (SELECT id FROM new_order)
      WHERE id = ${inventory.id}
      RETURNING order_id AS id
    `;

    return Response.json({
      orderId: order.id,
      clientSecret: paymentIntent.client_secret,
      amount: finalPrice,
      currency: 'eur',
      offer: {
        name: offer.esim_name,
        flag: offer.flag,
        dataGb: offer.data_gb,
        durationDays: offer.duration_days,
      },
      customerId: customer.id,
      ephemeralKey: ephemeralKey.secret,
    });
  } catch (err) {
    console.error('[POST /api/orders/create]', err);
    return Response.json({ error: 'Erreur serveur.' }, { status: 500 });
  }
}
