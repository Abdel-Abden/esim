import { ErrorCode, GetDestinationResponse, GetOffersResponse } from '@ilotel/shared';
import { Hono } from 'hono';
import { getAllDestinations, getDestinationById } from '../db/queries/destinations.js';
import { getOffersByDestinationId } from '../db/queries/offers.js';

export const destinations = new Hono();

// ─────────────────────────────────────────────────────────────────────────────
// GET /destinations
// Toutes les destinations avec prix min + état promo/stock agrégés
// → 1 seul appel réseau pour afficher toute la liste côté client
// ─────────────────────────────────────────────────────────────────────────────
destinations.get('/', async (c) => {
  const destinations = await getAllDestinations();
  return c.json<GetDestinationResponse>(destinations);
});

// ─────────────────────────────────────────────────────────────────────────────
// GET /destinations/:id
// Détail d'une destination (utilisé pour la page détail si besoin)
// ─────────────────────────────────────────────────────────────────────────────
destinations.get('/:id', async (c) => {
  const id = c.req.param('id');
  const esim = await getDestinationById(id);
  if (!esim) return c.json({ data: null, errorCode: ErrorCode.DESTINATION_NOT_FOUND }, 404);
  return c.json(esim);
});

// ─────────────────────────────────────────────────────────────────────────────
// GET /destinations/:id/offers
// Offres complètes d'une destination (chargées au tap, pas au démarrage)
// ─────────────────────────────────────────────────────────────────────────────
destinations.get('/:id/offers', async (c) => {
  const esimId = c.req.param('id');

  const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
  if (!uuidRegex.test(esimId)) {
    return c.json({data: null, errorCode: ErrorCode.INVALID_ID }, 400);
  }
  console.log("test")
  const esim = await getDestinationById(esimId);
  if (!esim) return c.json({ data: null, errorCode: ErrorCode.DESTINATION_NOT_FOUND }, 404);

  const offers = await getOffersByDestinationId(esimId);
  return c.json<GetOffersResponse>(offers);
});
