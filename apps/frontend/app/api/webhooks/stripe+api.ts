// app/api/webhooks/stripe+api.ts
// POST — Webhook Stripe : confirme la commande après paiement réussi

import { sql } from '@/db/client';
import { stripe } from '@/db/stripe-server';

export async function POST(request: Request) {
  const body = await request.text();
  const signature = request.headers.get('stripe-signature');

  if (!signature) {
    return Response.json({ error: 'Signature manquante.' }, { status: 400 });
  }

  let event;

  try {
    event = stripe.webhooks.constructEvent(
      body,
      signature,
      process.env.STRIPE_WEBHOOK_SECRET!
    );
  } catch (err) {
    console.error('[Webhook] Signature invalide', err);
    return Response.json({ error: 'Webhook invalide.' }, { status: 400 });
  }

  // Paiement réussi
  if (event.type === 'payment_intent.succeeded') {
    const pi = event.data.object;

    try {
      // Passer la commande en "paid" + marquer l'ICCID "sold"
      await sql`
        WITH updated_order AS (
          UPDATE orders
          SET status = 'paid', paid_at = NOW()
          WHERE stripe_payment_intent = ${pi.id}
          RETURNING id, inventory_id
        )
        UPDATE esim_inventory
        SET status = 'sold', sold_at = NOW()
        WHERE id = (SELECT inventory_id FROM updated_order)
      `;

      console.log(`[Webhook] Commande confirmée pour PI ${pi.id}`);
    } catch (err) {
      console.error('[Webhook] Erreur BDD', err);
      return Response.json({ error: 'Erreur BDD.' }, { status: 500 });
    }
  }

  // Paiement échoué — libérer l'ICCID
  if (event.type === 'payment_intent.payment_failed') {
    const pi = event.data.object;

    await sql`
      WITH failed_order AS (
        UPDATE orders
        SET status = 'failed'
        WHERE stripe_payment_intent = ${pi.id}
        RETURNING inventory_id
      )
      UPDATE esim_inventory
      SET status = 'available', reserved_at = NULL, order_id = NULL
      WHERE id = (SELECT inventory_id FROM failed_order)
    `;

    console.log(`[Webhook] Paiement échoué pour PI ${pi.id}`);
  }

  return Response.json({ received: true });
}
