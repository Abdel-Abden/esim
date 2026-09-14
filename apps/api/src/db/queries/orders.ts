import { DEFAULT_LANG, Order, OrderEntity, OrderStatus } from '@ilotel/shared';
import { sql } from '../client.js';
import { mapOrder, mapOrderDetails } from '../mappers.js';

// ─── Création ─────────────────────────────────────────────────────────────────

export interface CreateOrderParams {
  offerId: string;
  lang: string;
  stripePaymentIntentId?: string;
  finalPrice: number;
  basePrice: number;
  email?: string;
  reservedUntil: string;
}

export async function createOrder(params: CreateOrderParams): Promise<OrderEntity> {
  const rows = await sql`
    INSERT INTO orders (
      email,
      lang,
      offer_id,
      status,
      stripe_payment_intent_id,
      final_price,
      base_price,
      reserved_until
    )
    VALUES (
      ${params.email ?? null},
      ${params.lang ?? DEFAULT_LANG},
      ${params.offerId},
      'pending',
      ${params.stripePaymentIntentId ?? null},
      ${params.finalPrice},
      ${params.basePrice},
      ${params.reservedUntil}
    )
    RETURNING *
  `;
  return mapOrder(rows[0]);
}

// ─── Lecture ──────────────────────────────────────────────────────────────────

export async function getOrderById(id: string): Promise<Order | null> {
  const row = await sql`
  SELECT
    -- Order
    ord.id                           AS order_id,
    ord.email,
    ord.lang,
    ord.status,
    ord.stripe_payment_intent_id,
    ord.final_price,
    ord.created_at,

    -- Offer
    o.id                             AS offer_id,
    o.data_quantity,
    o.data_unit,
    o.duration_quantity,
    o.duration_unit,
    o.base_price,
    o.stripe_price_id,
    o.available,
    o.provider_product_id,

    -- Discount
    v.discount_id,
    v.discount_type,
    v.discount_value,

    -- Destination
    d.id                             AS destination_id,
    d.code,
    d.type,
    d.flag,
    d.featured,
    d.region,
    d.coverage,

    -- eSIM associée (peut être NULL si pas encore assignée)
    e.id                              AS esim_id,
    e.iccid,
    e.msisdn,
    e.activation_code,
    e.reserved_at,
    e.sold_at,
    e.status                          AS esim_status,

    -- Agrégats destination
    MIN(COALESCE(v2.final_price, o2.base_price)) AS destination_min_price,
    BOOL_OR(v2.discount_id IS NOT NULL)          AS destination_has_promo

  FROM orders ord

  JOIN offers o
    ON o.id = ord.offer_id

  JOIN destinations d
    ON d.id = o.destination_id

  LEFT JOIN offers_with_active_discount v
    ON v.id = o.id

  LEFT JOIN offers o2
    ON o2.destination_id = d.id

  LEFT JOIN offers_with_active_discount v2
    ON v2.id = o2.id

  -- LATERAL + LIMIT 1 : garantit au plus une ligne d'historique par order,
  -- même si esim_history venait à contenir plusieurs entrées pour un même
  -- order_id (remplacement d'eSIM, retry...). Sans ça, un simple LEFT JOIN
  -- dupliquerait les lignes du résultat, faussant row[0] et les agrégats.
  LEFT JOIN LATERAL (
    SELECT eh.esim_id
    FROM esim_history eh
    WHERE eh.order_id = ord.id
    ORDER BY eh.created_at DESC
    LIMIT 1
  ) eh ON true

  LEFT JOIN esims e
    ON e.id = eh.esim_id

  WHERE ord.id = ${id}

  GROUP BY
    ord.id,
    o.id,
    d.id,
    v.discount_id,
    v.discount_type,
    v.discount_value,
    e.id,
    e.iccid,
    e.msisdn,
    e.activation_code,
    e.reserved_at,
    e.sold_at,
    e.status;
  `;

  return row[0] ? mapOrderDetails(row[0]) : null;
}

export async function getOrderByPaymentIntentId(
  paymentIntentId: string
): Promise<Order | null> {
  const rows = await sql`
    SELECT
    -- Order
    ord.id                           AS order_id,
    ord.email,
    ord.lang,
    ord.status,
    ord.stripe_payment_intent_id,
    ord.final_price,
    ord.created_at,

    -- Offer
    o.id                             AS offer_id,
    o.data_quantity,
    o.data_unit,
    o.duration_quantity,
    o.duration_unit,
    o.base_price,
    o.stripe_price_id,
    o.available,

    -- Discount
    v.discount_id,
    v.discount_type,
    v.discount_value,

    -- Destination
    d.id                             AS destination_id,
    d.code,
    d.type,
    d.flag,
    d.featured,
    d.region,
    d.coverage,

    -- Agrégats destination
    MIN(COALESCE(v2.final_price, o2.base_price)) AS destination_min_price,
    BOOL_OR(v2.discount_id IS NOT NULL)          AS destination_has_promo

  FROM orders ord

  JOIN offers o
    ON o.id = ord.offer_id

  JOIN destinations d
    ON d.id = o.destination_id

  LEFT JOIN offers_with_active_discount v
    ON v.id = o.id

  LEFT JOIN offers o2
    ON o2.destination_id = d.id

  LEFT JOIN offers_with_active_discount v2
    ON v2.id = o2.id

  WHERE ord.stripe_payment_intent_id = ${paymentIntentId}

  GROUP BY
    ord.id,
    o.id,
    d.id,
    v.discount_id,
    v.discount_type,
    v.discount_value;
  `;
  return rows[0] ? mapOrderDetails(rows[0]) : null;
}

/**
 * Récupère toutes les commandes en statut 'refunding' — pour le cron de recovery.
 */
export async function getOrdersPendingRefund(): Promise<OrderEntity[]> {
  const rows = await sql`
    SELECT * FROM orders
    WHERE status = 'refunding'
      AND stripe_payment_intent_id IS NOT NULL
  `;
  return rows.map(mapOrder);
}

// ─── Mise à jour ──────────────────────────────────────────────────────────────

export async function updateOrderStatus(
  orderId: string,
  status: OrderStatus
): Promise<void> {
  await sql`
    UPDATE orders
    SET status = ${status}
    WHERE id = ${orderId}
  `;
}

export async function markOrderPaid(orderId: string): Promise<void> {
  await sql`
    UPDATE orders
    SET status = 'paid'
    WHERE id = ${orderId}
  `;
}

export async function markOrderRefunding(orderId: string): Promise<void> {
  await sql`
    UPDATE orders
    SET status = 'refunding'
    WHERE id = ${orderId}
  `;
}

export async function markOrderRefunded(orderId: string): Promise<void> {
  await sql`
    UPDATE orders
    SET status = 'refunded'
    WHERE id = ${orderId}
  `;
}

/**
 * Libère toutes les réservations expirées (reserved_until dépassé).
 * Appelé par le cron job.
 */
export async function releaseExpiredReservations(): Promise<string[]> {
  const rows = await sql`
    SELECT id FROM orders
    WHERE status = 'pending'
      AND stripe_payment_intent_id IS NULL
      AND reserved_until < NOW()
  `;

  const expiredIds = rows.map((r) => r.id as string);

  if (expiredIds.length > 0) {
    await sql`
      UPDATE orders SET status = 'failed'
      WHERE id = ANY(${expiredIds})
    `;
    await sql`
      UPDATE esim_inventory
      SET status = 'available', order_id = NULL, reserved_at = NULL
      WHERE order_id = ANY(${expiredIds})
        AND status = 'reserved'
    `;
  }

  return expiredIds;
}

export async function updateOrderCheckout(
  orderId: string,
  email: string,
  stripePaymentIntentId: string
): Promise<void> {
  await sql`
    UPDATE orders
    SET email = ${email},
        stripe_payment_intent_id = ${stripePaymentIntentId}
    WHERE id = ${orderId}
  `;
}

// ─── Suppression ──────────────────────────────────────────────────────────────

export async function deleteOrder(orderId: string): Promise<void> {
  await sql`DELETE FROM orders WHERE id = ${orderId}`;
}
