/**
 * Contrats API — Request / Response pour chaque endpoint
 */
import type { Destination } from './models/destinations.js';
import type { Offer } from './models/offers.js';
import type { Order } from './models/orders.js';

// ─── GET /esims ───────────────────────────────────────────────────────────────
/** Liste des destinations avec prix min et état promo/stock agrégés */
export type GetDestinationResponse = Destination[];

// ─── GET /esims/:id/offers ────────────────────────────────────────────────────
export type GetOffersResponse = Offer[];
/** @deprecated Utiliser GetOffersResponse */
export type GetOffersWithStockResponse = Offer[];

// ─── GET /orders/:id ─────────────────────────────────────────────────────────
export type GetOrderResponse = Order;

// ─── POST /orders/reserve ────────────────────────────────────────────────────
export interface ReserveOrderRequest {
  offerId: string;
}

export interface ReserveOrderResponse {
  orderId: string;
  expiresAt: string; // ISO — réservation valide RESERVATION_DURATION_MINUTES
}

// ─── POST /orders/:id/checkout ────────────────────────────────────────────────
export interface CheckoutOrderRequest {
  email: string;
}

export interface CheckoutOrderResponse {
  orderId: string;
  customerId: string;
  ephemeralKey: string;
  clientSecret: string;
  finalPrice: number;
}

// ─── POST /orders (legacy) ────────────────────────────────────────────────────
export interface CreateOrderRequest {
  offerId: string;
  email: string;
}

export interface CreateOrderResponse {
  orderId: string;
  customerId: string;
  ephemeralKey: string;
  clientSecret: string;
  finalPrice: number;
}

// ─── POST /orders/:id/cancel ─────────────────────────────────────────────────
export interface CancelOrderResponse {
  success: boolean;
}
