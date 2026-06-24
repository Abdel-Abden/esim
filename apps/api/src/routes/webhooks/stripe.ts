import { Hono } from 'hono';
import { isLocal, resolveEmailRecipient } from '../../constants/env.js';
import { confirmEsim, getInventoryByOrderId, releaseEsim } from '../../db/queries/esims.js';
import {
  getOrderById,
  getOrderByPaymentIntentId,
  markOrderPaid,
  markOrderRefunded,
  markOrderRefunding,
  updateOrderStatus
} from '../../db/queries/orders.js';
import { sendEsimEmail } from '../../lib/email/index.js';
import { stripe } from '../../lib/stripe.js';
import { assignOfferToEsim } from '../../lib/transatel.js';

export const stripeWebhook = new Hono();

// ─────────────────────────────────────────────────────────────────────────────
// POST /webhooks/stripe
//
// Événements gérés :
//   • payment_intent.succeeded      → assignation forfait Transatel + email
//   • payment_intent.payment_failed → commande échouée
// ─────────────────────────────────────────────────────────────────────────────

// ─── Helper remboursement ─────────────────────────────────────────────────────

/**
 * Remet l'eSIM en stock, passe la commande en 'refunding' et émet le
 * remboursement Stripe. Si Stripe échoue, la commande reste en 'refunding'
 * et le cron /cron/retry-refunds la reprendra automatiquement.
 */
async function refundOrder(orderId: string, paymentIntentId: string): Promise<void> {
  await releaseEsim(orderId);
  await markOrderRefunding(orderId);

  try {
    await stripe.refunds.create({ payment_intent: paymentIntentId });
    await markOrderRefunded(orderId);
    console.log(`[webhook] 💸 Remboursement Stripe émis — commande: ${orderId}`);
  } catch (stripeError) {
    console.error(
      `[webhook] ❌ Échec remboursement Stripe pour commande ${orderId} — sera retenté par le cron:`,
      stripeError
    );
  }
}

// ─── Route principale ─────────────────────────────────────────────────────────

stripeWebhook.post('/', async (c) => {
  const signature = c.req.header('stripe-signature');
  const rawBody = await c.req.text();

  if (!signature || !process.env.STRIPE_WEBHOOK_SECRET) {
    return c.json({ message: 'Configuration webhook manquante' }, 400);
  }

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

  switch (event.type) {

    case 'payment_intent.succeeded': {
      const paymentIntent = event.data.object;

      const order = await getOrderByPaymentIntentId(paymentIntent.id);
      if (!order) {
        console.error(`[webhook] Commande introuvable pour PI ${paymentIntent.id}`);
        break;
      }

      // Idempotence : déjà traité
      if (order.status !== 'pending') {
        console.log(`[webhook] Commande ${order.id} déjà en statut '${order.status}', ignoré`);
        break;
      }

      // 1. Paiement reçu
      await markOrderPaid(order.id);

      // 2. Récupérer l'inventaire (ICCID + MSISDN)
      const inventory = await getInventoryByOrderId(order.id);
      if (!inventory) {
        console.error(`[webhook] Inventaire introuvable pour commande ${order.id} — remboursement`);
        await refundOrder(order.id, paymentIntent.id);
        break;
      }

      // 3. Récupérer l'offre pour obtenir le transatel_product_id
      const fullOrder = await getOrderById(order.id);
      if (!fullOrder?.offer.transatelProductId) {
        console.error(
          `[webhook] transatelProductId manquant sur l'offre ${order.offerId} — remboursement`
        );
        await refundOrder(order.id, paymentIntent.id);
        break;
      }

      // 4. Assigner le forfait à la SIM via l'API OCS Transatel
      try {
        const result = await assignOfferToEsim(
          inventory.msisdn,
          fullOrder.offer.transatelProductId
        );
        console.log(
          `[webhook] 📦 Forfait assigné — MSISDN: ${inventory.msisdn}, subscriptionId: ${result.subscriptionId}`
        );
      } catch (ocsError) {
        console.error(`[webhook] ❌ Échec OCS pour commande ${order.id}:`, ocsError);
        await refundOrder(order.id, paymentIntent.id);
        break;
      }

      // 5. Confirmer l'eSIM en BDD (reserved → sold) + provisioned
      await confirmEsim(order.id);
      await updateOrderStatus(order.id, 'provisioned');

      // 6. Email de confirmation avec le code d'activation du CSV
      if (order.email) {
        try {
          if (fullOrder.esimInventory) {
            const recipient = resolveEmailRecipient(order.email);
            await sendEsimEmail({
              to: recipient,
              orderId: order.id,
              lang: order.lang,
              code: fullOrder.offer.esim.code,
              flag: fullOrder.offer.esim.flag,
              dataGb: fullOrder.offer.dataGb,
              durationDays: fullOrder.offer.durationDays,
              finalPrice: order.finalPrice,
              activationCode: fullOrder.esimInventory.activationCode,
              iccid: fullOrder.esimInventory.iccid,
              purchasedAt: order.createdAt,
            });
            if (isLocal()) {
              console.log(
                `[webhook] 🧪 Mode local — email redirigé vers ${recipient} (réel: ${order.email})`
              );
            } else {
              console.log(`[webhook] ✉️ Email envoyé à ${recipient} — commande: ${order.id}`);
            }
          }
        } catch (emailError) {
          console.error(`[webhook] ⚠️ Échec email pour commande ${order.id}:`, emailError);
        }
      }

      console.log(`[webhook] ✅ Commande provisionnée: ${order.id}`);
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
      break;
  }

  return c.json({ received: true });
});

export { refundOrder };
