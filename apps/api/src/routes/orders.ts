import {
  CancelOrderResponse,
  CreateOrderRequest,
  CreateOrderResponse,
  GetOrderResponse,
} from '@ilotel/shared';
import { Hono } from 'hono';
import { releaseEsim, reserveEsim } from '../db/queries/esims.js';
import { getOfferById } from '../db/queries/offers.js';
import { createOrder, deleteOrder, getOrderById, updateOrderStatus } from '../db/queries/orders.js';
import { stripe } from '../lib/stripe.js';

export const orders = new Hono();

// ─────────────────────────────────────────────────────────────────────────────
// POST /orders
// Crée une commande et initialise la PaymentSheet Stripe
//
// Flux :
//   1. Valider la requête
//   2. Récupérer l'offre en BDD (le prix vient toujours du serveur, jamais du client)
//   3. Créer ou retrouver le Customer Stripe
//   4. Créer l'EphemeralKey (nécessaire pour la PaymentSheet mobile)
//   5. Créer le PaymentIntent avec le montant issu de la BDD
//   6. Persister la commande en statut "pending"
//   7. Retourner les clés au client
// ─────────────────────────────────────────────────────────────────────────────
orders.post('/', async (c) => {
  const body = await c.req.json<CreateOrderRequest>();
  const { offerId, email } = body;

  if (!offerId || !email || !email.includes('@')) {
    return c.json({ message: 'offerId et email valide sont requis' }, 400);
  }

  const offer = await getOfferById(offerId);
  if (!offer) {
    return c.json({ message: 'Offre introuvable' }, 404);
  }
  if (!offer.stripePriceId) {
    return c.json({ message: 'Offre non disponible à la vente (stripe_price_id manquant)' }, 422);
  }

  const finalPrice = offer.finalPrice;
  const discountId = offer.activeDiscount?.id ?? null;

  const existingCustomers = await stripe.customers.list({ email, limit: 1 });
  const customer =
    existingCustomers.data[0] ??
    (await stripe.customers.create({ email }));

  const ephemeralKey = await stripe.ephemeralKeys.create(
    { customer: customer.id },
    { apiVersion: '2025-01-27.acacia' }
  );

  const amountCents = Math.round(finalPrice * 100);
  const paymentIntent = await stripe.paymentIntents.create({
    amount: amountCents,
    currency: 'eur',
    customer: customer.id,
    automatic_payment_methods: { enabled: true },
    metadata: { offerId, email, discountId: discountId ?? '' },
  });

  const order = await createOrder({
    email,
    offerId,
    stripePaymentIntentId: paymentIntent.id,
    finalPrice,
    discountId,
  });

  // Réserver une eSIM — si plus de stock on annule tout
  const reserved = await reserveEsim(offer.esimId, order.id);
  if (!reserved) {
    await stripe.paymentIntents.cancel(paymentIntent.id);
    await deleteOrder(order.id);
    return c.json({ message: 'Stock épuisé pour cette offre' }, 409);
  }

  const response: CreateOrderResponse = {
    orderId: order.id,
    customerId: customer.id,
    ephemeralKey: ephemeralKey.secret!,
    clientSecret: paymentIntent.client_secret!,
    finalPrice,
  };

  return c.json(response, 201);
});

// ─────────────────────────────────────────────────────────────────────────────
// GET /orders/:id
// Récupère une commande avec ses détails (offre + eSIM assignée)
// ─────────────────────────────────────────────────────────────────────────────
orders.get('/:id', async (c) => {
  const id = c.req.param('id');
  const order = await getOrderById(id);

  if (!order) {
    return c.json({ message: 'Commande introuvable' }, 404);
  }

  return c.json<GetOrderResponse>(order);
});

// ─────────────────────────────────────────────────────────────────────────────
// POST /orders/:id/cancel
// Annule une commande pending — libère l'eSIM réservée et annule le PaymentIntent
// Appelé par le frontend si l'utilisateur abandonne le paiement
// ─────────────────────────────────────────────────────────────────────────────
orders.post('/:id/cancel', async (c) => {
  const id = c.req.param('id');
  const order = await getOrderById(id);

  if (!order) {
    return c.json({ message: 'Commande introuvable' }, 404);
  }

  // On ne peut annuler qu'une commande pending
  if (order.status !== 'pending') {
    return c.json({ message: `Impossible d'annuler une commande en statut ${order.status}` }, 409);
  }

  // Libérer l'eSIM réservée
  await releaseEsim(id);

  // Annuler le PaymentIntent Stripe
  try {
    await stripe.paymentIntents.cancel(order.stripePaymentIntentId);
  } catch {
    // Le PI peut déjà être annulé ou expiré — on continue quand même
  }

  await updateOrderStatus(id, 'failed');

  return c.json<CancelOrderResponse>({ success: true });
});