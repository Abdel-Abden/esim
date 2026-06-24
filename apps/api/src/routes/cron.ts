import { Hono } from 'hono';
import { getOrdersPendingRefund, markOrderRefunded, releaseExpiredReservations } from '../db/queries/orders.js';
import { stripe } from '../lib/stripe.js';

export const cron = new Hono();

// ─────────────────────────────────────────────────────────────────────────────
// GET /cron/release-expired
// Libère les réservations expirées — appelé par Vercel Cron toutes les 5 min
// Protégé par un secret pour éviter les appels non autorisés
// ─────────────────────────────────────────────────────────────────────────────
cron.get('/release-expired', async (c) => {
  const secret = c.req.header('x-cron-secret');

  if (secret !== process.env.CRON_SECRET) {
    return c.json({ message: 'Non autorisé' }, 401);
  }

  const released = await releaseExpiredReservations();

  console.log(`[cron] ${released.length} réservation(s) expirée(s) libérée(s)`);

  return c.json({ released: released.length, ids: released });
});

// ─────────────────────────────────────────────────────────────────────────────
// GET /cron/retry-refunds
// Reprend les remboursements Stripe en échec (status = 'refunding')
// Appelé par Vercel Cron toutes les 10 min
// ─────────────────────────────────────────────────────────────────────────────
cron.get('/retry-refunds', async (c) => {
  const secret = c.req.header('x-cron-secret');

  if (secret !== process.env.CRON_SECRET) {
    return c.json({ message: 'Non autorisé' }, 401);
  }

  const orders = await getOrdersPendingRefund();
  const results = { success: 0, failed: 0 };

  for (const order of orders) {
    try {
      await stripe.refunds.create({ payment_intent: order.stripePaymentIntentId });
      await markOrderRefunded(order.id);
      results.success++;
      console.log(`[cron] 💸 Remboursement récupéré — commande: ${order.id}`);
    } catch (err) {
      results.failed++;
      console.error(`[cron] ❌ Échec retry remboursement pour ${order.id}:`, err);
    }
  }

  console.log(`[cron] retry-refunds — ${results.success} ok, ${results.failed} échecs sur ${orders.length}`);

  return c.json({ ...results, total: orders.length });
});
