import {
  CancelOrderResponse,
  CheckoutOrderRequest,
  CheckoutOrderResponse,
  ErrorCode,
  GetOrderResponse,
  RESERVATION_DURATION_MINUTES,
  ReserveOrderRequest,
  ReserveOrderResponse,
} from '@ilotel/shared';
import { Hono } from 'hono';
import { BRAND } from '../constants/env.js';
import { releaseEsim, reserveEsim } from '../db/queries/esims.js';
import { getOfferById } from '../db/queries/offers.js';
import {
  createOrder,
  deleteOrder,
  getOrderById,
  updateOrderCheckout,
  updateOrderStatus
} from '../db/queries/orders.js';
import { stripe } from '../lib/stripe.js';
import { resolveLang } from '../translation/index.js';

export const orders = new Hono();

// ─────────────────────────────────────────────────────────────────────────────
// POST /orders/reserve
// Étape 1 : réserve une eSIM dès l'arrivée sur la page payment
// Pas d'email requis à ce stade — la réservation expire après 5 min
// ─────────────────────────────────────────────────────────────────────────────
orders.post('/reserve', async (c) => {
  const body = await c.req.json<ReserveOrderRequest>();
  const { offerId } = body;

  if (!offerId) {
    return c.json({ data: null, errorCode: ErrorCode.OFFER_ID_REQUIRED }, 400);
  }

  const offer = await getOfferById(offerId);
  if (!offer) {
    return c.json({ data: null, errorCode: ErrorCode.OFFER_NOT_FOUND }, 404);
  }
  if (!offer.stripePriceId) {
    return c.json({ data: null, errorCode: ErrorCode.OFFER_NOT_FOR_SALE }, 422);
  }
  if (offer.availableCount === 0) {
    return c.json({ data: null, errorCode: ErrorCode.STOCK_EXHAUSTED }, 409);
  }

  const reservedUntil = new Date(
    Date.now() + RESERVATION_DURATION_MINUTES * 60 * 1000
  ).toISOString();

  const lang = resolveLang(c.req.header('accept-language'));

  const order = await createOrder({
    lang,
    offerId,
    finalPrice: offer.finalPrice,
    discountId: offer.activeDiscount?.id ?? null,
    reservedUntil,
  });

  const reserved = await reserveEsim(offer.id, order.id);
  if (!reserved) {
    await deleteOrder(order.id);
    return c.json({ data: null, code: ErrorCode.STOCK_EXHAUSTED }, 409);
  }

  const response: ReserveOrderResponse = {
    orderId: order.id,
    expiresAt: reservedUntil,
  };

  return c.json(response, 201);
});

// ─────────────────────────────────────────────────────────────────────────────
// POST /orders/:id/checkout
// Étape 2 : l'utilisateur saisit son email et lance le paiement
// ─────────────────────────────────────────────────────────────────────────────
orders.post('/:id/checkout', async (c) => {
  const orderId = c.req.param('id');
  const body = await c.req.json<CheckoutOrderRequest>();
  const { email } = body;

  const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  if (!email || !EMAIL_REGEX.test(email)) {
    return c.json({ data: null, errorCode: ErrorCode.EMAIL_REQUIRED }, 400);
  }

  const order = await getOrderById(orderId);
  if (!order) {
    return c.json({ data: null, errorCode: ErrorCode.ORDER_NOT_FOUND }, 404);
  }
  if (order.status !== 'pending') {
    return c.json({ data: null, errorCode: ErrorCode.RESERVATION_EXPIRED }, 409);
  }

  const existingCustomers = await stripe.customers.list({ email, limit: 1 });
  const customer =
    existingCustomers.data[0] ??
    (await stripe.customers.create({ email }));

  const ephemeralKey = await stripe.ephemeralKeys.create(
    { customer: customer.id },
    { apiVersion: '2025-01-27.acacia' }
  );

  const amountCents = Math.round(order.finalPrice * 100);
  const paymentIntent = await stripe.paymentIntents.create({
    amount: amountCents,
    currency: 'eur',
    customer: customer.id,
    automatic_payment_methods: { enabled: true },
    metadata: { orderId, email },
  });

  await updateOrderCheckout(orderId, email, paymentIntent.id);

  const response: CheckoutOrderResponse = {
    orderId,
    customerId: customer.id,
    ephemeralKey: ephemeralKey.secret!,
    clientSecret: paymentIntent.client_secret!,
    finalPrice: order.finalPrice,
  };

  return c.json(response);
});

// ─────────────────────────────────────────────────────────────────────────────
// GET /orders/:id
// ─────────────────────────────────────────────────────────────────────────────
orders.get('/:id', async (c) => {
  const id = c.req.param('id');
  const order = await getOrderById(id);

  if (!order) {
    return c.json({ data: null, errorCode: ErrorCode.ORDER_NOT_FOUND }, 404);
  }

  // Si la commande est en cours de remboursement ou remboursée,
  // on retourne un code explicite plutôt que de laisser le mobile
  // afficher "unknown error"
  if (order.status === 'refunding' || order.status === 'refunded') {
    return c.json(
      {
        data: null,
        errorCode: ErrorCode.REFUND_IN_PROGRESS,
        meta: { supportEmail: BRAND.support },
      },
      402
    );
  }

  return c.json<GetOrderResponse>(order);
});

// ─────────────────────────────────────────────────────────────────────────────
// POST /orders/:id/cancel
// ─────────────────────────────────────────────────────────────────────────────
orders.post('/:id/cancel', async (c) => {
  const id = c.req.param('id');
  const order = await getOrderById(id);

  if (!order) {
    return c.json({ data: null, errorCode: ErrorCode.ORDER_NOT_FOUND }, 404);
  }
  if (order.status !== 'pending') {
    return c.json({ data: null, errorCode: ErrorCode.CANCEL_INVALID_STATUS }, 409);
  }

  await releaseEsim(id);

  if (order.stripePaymentIntentId) {
    try {
      await stripe.paymentIntents.cancel(order.stripePaymentIntentId);
    } catch {
      // PI déjà annulé ou expiré
    }
  }

  await updateOrderStatus(id, 'failed');

  return c.json<CancelOrderResponse>({ success: true });
});
