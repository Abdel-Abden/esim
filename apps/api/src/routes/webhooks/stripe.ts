import { Hono } from 'hono';
import { confirmEsim, releaseEsim } from '../../db/queries/esims.js';
import {
  getOrderByPaymentIntentId,
  updateOrderStatus
} from '../../db/queries/orders.js';
import { stripe } from '../../lib/stripe.js';

export const stripeWebhook = new Hono();

// ─────────────────────────────────────────────────────────────────────────────
// POST /webhooks/stripe
//
// Stripe envoie les événements ici après chaque action de paiement.
// ⚠️  Cette route doit recevoir le body RAW (non parsé) pour vérifier la signature.
//
// Événements gérés :
//   • payment_intent.succeeded  → commande payée + assignation eSIM
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

      await confirmEsim(order.id);              // reserved → sold
      await updateOrderStatus(order.id, 'provisioned');
      break;
    }

    case 'payment_intent.payment_failed': {
      const paymentIntent = event.data.object;

      const order = await getOrderByPaymentIntentId(paymentIntent.id);
      if (order) {
        await releaseEsim(order.id); 
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