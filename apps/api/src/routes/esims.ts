import { GetEsimsResponse, GetOffersResponse } from '@ilotel/shared';
import { Hono } from 'hono';
import { getAllEsims, getEsimById } from '../db/queries/esims.js';
import { getOffersByEsimId } from '../db/queries/offers.js';

export const esims = new Hono();

// ─────────────────────────────────────────────────────────────────────────────
// GET /esims
// Liste toutes les destinations disponibles
// ─────────────────────────────────────────────────────────────────────────────
esims.get('/', async (c) => {
  const destinations = await getAllEsims();
  return c.json<GetEsimsResponse>(destinations);
});

// ─────────────────────────────────────────────────────────────────────────────
// GET /esims/:id
// Détail d'une destination
// ─────────────────────────────────────────────────────────────────────────────
esims.get('/:id', async (c) => {
  const id = c.req.param('id');
  const esim = await getEsimById(id);

  if (!esim) {
    return c.json({ message: 'Destination introuvable' }, 404);
  }

  return c.json(esim);
});

// ─────────────────────────────────────────────────────────────────────────────
// GET /esims/:id/offers
// Offres disponibles pour une destination, avec réduction active si existante
// ─────────────────────────────────────────────────────────────────────────────
esims.get('/:id/offers', async (c) => {
  const esimId = c.req.param('id');

  const uuidRegex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;
  if (!uuidRegex.test(esimId)) {
    return c.json({ message: 'Identifiant invalide' }, 400);
  }

  const esim = await getEsimById(esimId);
  if (!esim) {
    return c.json({ message: 'Destination introuvable' }, 404);
  }

  const offers = await getOffersByEsimId(esimId);
  return c.json<GetOffersResponse>(offers);
});