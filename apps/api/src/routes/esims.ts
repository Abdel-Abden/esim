import { GetEsimsResponse, GetOffersResponse } from '@ilotel/shared';
import { Hono } from 'hono';
import { getAllEsims, getEsimById } from '../db/queries/esims.js';
import { getOffersByEsimId } from '../db/queries/offers.js';

export const esims = new Hono();

// ─────────────────────────────────────────────────────────────────────────────
// GET /esims
// Toutes les destinations avec prix min + état promo/stock agrégés
// → 1 seul appel réseau pour afficher toute la liste côté client
// ─────────────────────────────────────────────────────────────────────────────
esims.get('/', async (c) => {
  const destinations = await getAllEsims();
  return c.json<GetEsimsResponse>(destinations);
});

// ─────────────────────────────────────────────────────────────────────────────
// GET /esims/:id
// Détail d'une destination (utilisé pour la page détail si besoin)
// ─────────────────────────────────────────────────────────────────────────────
esims.get('/:id', async (c) => {
  const id = c.req.param('id');
  const esim = await getEsimById(id);
  if (!esim) return c.json({ message: 'Destination introuvable' }, 404);
  return c.json(esim);
});

// ─────────────────────────────────────────────────────────────────────────────
// GET /esims/:id/offers
// Offres complètes d'une destination (chargées au tap, pas au démarrage)
// ─────────────────────────────────────────────────────────────────────────────
esims.get('/:id/offers', async (c) => {
  const esimId = c.req.param('id');

  const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
  if (!uuidRegex.test(esimId)) {
    return c.json({ message: 'Identifiant invalide' }, 400);
  }

  const esim = await getEsimById(esimId);
  if (!esim) return c.json({ message: 'Destination introuvable' }, 404);

  const offers = await getOffersByEsimId(esimId);
  return c.json<GetOffersResponse>(offers);
});
