import { Hono } from 'hono';
import { releaseExpiredReservations } from '../db/queries/orders.js';

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