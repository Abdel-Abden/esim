// service/orders.ts
// Client-side : interagit avec /api/orders/*

import { apiFetch } from './api';

// ---- Types ----

export interface CreateOrderPayload {
  offerId: string;
  email: string;
  discountCode?: string;
}

export interface CreateOrderResponse {
  orderId: string;
  clientSecret: string;  // PaymentIntent client secret → passe à Stripe
  amount: number;
  currency: string;
  offer: {
    name: string;
    flag: string;
    dataGb: number;
    durationDays: number;
  };
}

export interface OrderDetails {
  id: string;
  email: string;
  amount: number;
  paidAt: string;
  iccid: string;
  esim: {
    name: string;
    flag: string;
    dataGb: number;
    durationDays: number;
  };
}

// ---- Fonctions ----

/** Étape 1 : réserve un ICCID + obtient le clientSecret Stripe */
export async function createOrder(payload: CreateOrderPayload) {
  return apiFetch<CreateOrderResponse>('/api/orders/create', {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

/** Étape 3 : récupère les détails après confirmation du paiement */
export async function fetchOrder(orderId: string) {
  return apiFetch<OrderDetails>(`/api/orders/${orderId}`);
}
