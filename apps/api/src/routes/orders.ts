import {
  CreateOrderRequest,
  CreateOrderResponse,
  GetOrderResponse,
} from '@ilotel/shared';
import { Hono } from 'hono';
import { reserveEsim } from '../db/queries/esims.js';
import { getOfferById } from '../db/queries/offers.js';
import { createOrder, deleteOrder, getOrderById } from '../db/queries/orders.js';
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

  // 1. Validation basique
  if (!offerId || !email || !email.includes('@')) {
    return c.json({ message: 'offerId et email valide sont requis' }, 400);
  }

  // 2. Récupérer l'offre — le prix est toujours lu en BDD, jamais fourni par le client
  const offer = await getOfferById(offerId);
  if (!offer) {
    return c.json({ message: 'Offre introuvable' }, 404);
  }
  if (!offer.stripePriceId) {
    return c.json({ message: 'Offre non disponible à la vente (stripe_price_id manquant)' }, 422);
  }

  const finalPrice = offer.finalPrice;
  const discountId = offer.activeDiscount?.id ?? null;

  // 3. Customer Stripe — réutilise si le mail existe déjà
  const existingCustomers = await stripe.customers.list({ email, limit: 1 });
  const customer =
    existingCustomers.data[0] ??
    (await stripe.customers.create({ email }));

  // 4. EphemeralKey — permet à la PaymentSheet d'afficher les méthodes sauvegardées
  const ephemeralKey = await stripe.ephemeralKeys.create(
    { customer: customer.id },
    { apiVersion: '2025-01-27.acacia' }
  );

  // 5. PaymentIntent — montant en centimes, calculé côté serveur
  const amountCents = Math.round(finalPrice * 100);
  const paymentIntent = await stripe.paymentIntents.create({
    amount: amountCents,
    currency: 'eur',
    customer: customer.id,
    automatic_payment_methods: { enabled: true },
    metadata: {
      offerId,
      email,
      discountId: discountId ?? '',
    },
  });

  // 6. Commande en BDD
  const order = await createOrder({
    email,
    offerId,
    stripePaymentIntentId: paymentIntent.id,
    finalPrice,
    discountId,
  });

  // 7. Réserver une eSIM — si plus de stock on annule tout de suite
  const reserved = await reserveEsim(offer.esimId, order.id);
  if (!reserved) {
    // Annuler le PaymentIntent Stripe pour ne pas laisser de PI orphelin
    await stripe.paymentIntents.cancel(paymentIntent.id);
    // Supprimer la commande créée
    await deleteOrder(order.id);
    return c.json({ message: 'Stock épuisé pour cette offre' }, 409);
  }

  // 8. Réponse
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