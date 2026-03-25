import { Hono } from 'hono';
import { isLocal, resolveEmailRecipient } from '../../constants/env.js';
import { confirmEsim } from '../../db/queries/esims.js';
import {
  getOrderById,
  getOrderByPaymentIntentId,
  updateOrderStatus
} from '../../db/queries/orders.js';
import { sendEsimEmail } from '../../lib/email.js';
import { stripe } from '../../lib/stripe.js';

export const stripeWebhook = new Hono();

// ─────────────────────────────────────────────────────────────────────────────
// POST /webhooks/stripe
//
// Stripe envoie les événements ici après chaque action de paiement.
// ⚠️  Cette route doit recevoir le body RAW (non parsé) pour vérifier la signature.
//
// Événements gérés :
//   • payment_intent.succeeded  → commande payée + assignation eSIM + email
//   • payment_intent.payment_failed → commande échouée
// ─────────────────────────────────────────────────────────────────────────────
stripeWebhook.post('/', async (c) => {
  const signature = c.req.header('stripe-signature');
  const rawBody = await c.req.text(); // body brut requis pour la vérification

  if (!signature || !process.env.STRIPE_WEBHOOK_SECRET) {
    return c.json({ message: 'Configuration webhook manquante' }, 400);
  }

  // Vérification cryptographique — rejette toute requête non signée par Stripe
  let event;
  try {
    event = stripe.webhooks.constructEvent(
      rawBody,
      signature,
      process.env.STRIPE_WEBHOOK_SECRET
    );
  } catch {
    return c.json({ message: 'Signature webhook invalide' }, 400);
  }

  // ── Routage des événements ────────────────────────────────────────────────

  switch (event.type) {

    case 'payment_intent.succeeded': {
      const paymentIntent = event.data.object;

      const order = await getOrderByPaymentIntentId(paymentIntent.id);
      if (!order) {
        console.error(`[webhook] Commande introuvable pour PI ${paymentIntent.id}`);
        break;
      }

      // 1. Confirmer l'eSIM (reserved → sold)
      await confirmEsim(order.id);
      // 2. Passer la commande en provisioned
      await updateOrderStatus(order.id, 'provisioned');

      // 3. Envoyer l'email de confirmation avec le code d'activation
      if (order.email) {
        try {
          const fullOrder = await getOrderById(order.id);
          if (fullOrder?.esimInventory) {
            const recipient = resolveEmailRecipient(order.email);
            await sendEsimEmail({
              to: recipient,
              orderId: order.id,
              country: fullOrder.offer.esim.name,
              flag: fullOrder.offer.esim.flag,
              dataGb: fullOrder.offer.dataGb,
              durationDays: fullOrder.offer.durationDays,
              finalPrice: order.finalPrice,
              activationCode: fullOrder.esimInventory.activationCode,
              iccid: fullOrder.esimInventory.iccid,
              purchasedAt: order.createdAt,
            });
            if (isLocal()) {
              console.log(`[webhook] 🧪 Mode local — email redirigé vers ${recipient} (destinataire réel : ${order.email})`);
            } else {
              console.log(`[webhook] ✉️ Email envoyé à ${recipient} — commande: ${order.id}`);
            }
          }
        } catch (emailError) {
          // L'email est best-effort : on ne bloque pas le provisioning si ça échoue
          console.error(`[webhook] ⚠️ Échec envoi email pour commande ${order.id}:`, emailError);
        }
      }

      console.log(`[webhook] ✅ Paiement confirmé — commande: ${order.id}`);
      break;
    }

    case 'payment_intent.payment_failed': {
      const paymentIntent = event.data.object;

      const order = await getOrderByPaymentIntentId(paymentIntent.id);
      if (order) {
        await updateOrderStatus(order.id, 'failed');
        console.log(`[webhook] ❌ Paiement échoué — commande: ${order.id}`);
      }

      break;
    }

    default:
      // Événements non gérés ignorés silencieusement
      break;
  }

  // Stripe attend toujours un 200 pour confirmer la réception
  return c.json({ received: true });
});