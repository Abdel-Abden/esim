/**
 * Contrats API — Request / Response pour chaque endpoint
 */
import type { EsimSummary } from './models/esims.js';
import type { OfferWithStock } from './models/offers.js';
import type { OrderWithDetails } from './models/orders.js';

// ─── GET /esims ───────────────────────────────────────────────────────────────
/** Liste des destinations avec prix min et état promo/stock agrégés */
export type GetEsimsResponse = EsimSummary[];

// ─── GET /esims/:id/offers ────────────────────────────────────────────────────
export type GetOffersResponse = OfferWithStock[];
/** @deprecated Utiliser GetOffersResponse */
export type GetOffersWithStockResponse = OfferWithStock[];

// ─── GET /orders/:id ─────────────────────────────────────────────────────────
export type GetOrderResponse = OrderWithDetails;

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
