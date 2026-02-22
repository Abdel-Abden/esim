import { EsimInventory, Order, OrderStatus, OrderWithDetails } from '@ilotel/shared';
import { sql } from '../client.js';
import { mapInventory, mapOrder } from "../mappers.js";
import { getOfferById } from './offers.js';

// ─── Création ─────────────────────────────────────────────────────────────────

export interface CreateOrderParams {
  email: string;
  offerId: string;
  stripePaymentIntentId: string;
  finalPrice: number;
  discountId: string | null;
}

export async function createOrder(params: CreateOrderParams): Promise<Order> {
  const rows = await sql`
    INSERT INTO orders (
      email,
      offer_id,
      stripe_payment_intent_id,
      final_price,
      discount_id,
      status
    )
    VALUES (
      ${params.email},
      ${params.offerId},
      ${params.stripePaymentIntentId},
      ${params.finalPrice},
      ${params.discountId},
      'pending'
    )
    RETURNING *
  `;

  return mapOrder(rows[0]);
}

// ─── Lecture ──────────────────────────────────────────────────────────────────

export async function getOrderById(id: string): Promise<OrderWithDetails | null> {
  const rows = await sql`
    SELECT * FROM orders WHERE id = ${id} LIMIT 1
  `;

  if (!rows[0]) return null;

  const order = mapOrder(rows[0]);

  // Jointures manuelles pour typer correctement
  const offer = await getOfferById(order.offerId);
  if (!offer) return null;

  const inventoryRows = await sql`
    SELECT * FROM esim_inventory
    WHERE order_id = ${id}
    LIMIT 1
  `;

  const esimInventory: EsimInventory | null = inventoryRows[0]
    ? mapInventory(inventoryRows[0])
    : null;

  return { ...order, offer, esimInventory };
}

export async function getOrderByPaymentIntentId(
  paymentIntentId: string
): Promise<Order | null> {
  const rows = await sql`
    SELECT * FROM orders
    WHERE stripe_payment_intent_id = ${paymentIntentId}
    LIMIT 1
  `;

  return rows[0] ? mapOrder(rows[0]) : null;
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

/**
 * Assigne une carte eSIM disponible à une commande payée.
 * Choisit automatiquement la première carte disponible pour la destination.
 */
export async function assignEsimToOrder(
  orderId: string,
  esimId: string
): Promise<EsimInventory | null> {
  // Transaction : réserver + assigner atomiquement
  const rows = await sql`
    UPDATE esim_inventory
    SET
      status      = 'sold',
      order_id    = ${orderId},
      reserved_at = NOW(),
      sold_at     = NOW()
    WHERE id = (
      SELECT id FROM esim_inventory
      WHERE esim_id = ${esimId}
        AND status  = 'available'
      LIMIT 1
      FOR UPDATE SKIP LOCKED
    )
    RETURNING *
  `;

  return rows[0] ? mapInventory(rows[0]) : null;
}


// ─── Suppresion ───────────────────────────────────────────────────────────────

/**
 * Supprime l'order si il n'y a pas eSIM de disponible
 */
export async function deleteOrder(orderId: string): Promise<void> {
  await sql`DELETE FROM orders WHERE id = ${orderId}`;
}