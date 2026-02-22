import {
  CancelOrderResponse,
  CheckoutOrderRequest,
  CheckoutOrderResponse,
  GetOrderResponse,
  ReserveOrderRequest,
  ReserveOrderResponse,
} from '@ilotel/shared';
import { apiFetch } from './api';

/** Étape 1 — réserve une eSIM dès l'arrivée sur la page payment */
export async function reserveOrder(payload: ReserveOrderRequest) {
  return apiFetch<ReserveOrderResponse>('/orders/reserve', {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

/** Étape 2 — lance le paiement Stripe avec l'email */
export async function checkoutOrder(orderId: string, payload: CheckoutOrderRequest) {
  return apiFetch<CheckoutOrderResponse>(`/orders/${orderId}/checkout`, {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

/** Récupère les détails d'une commande (polling post-paiement) */
export async function fetchOrder(orderId: string) {
  return apiFetch<GetOrderResponse>(`/orders/${orderId}`);
}

/** Annule une commande pending et libère l'eSIM */
export async function cancelOrder(orderId: string) {
  return apiFetch<CancelOrderResponse>(`/orders/${orderId}/cancel`, {
    method: 'POST',
  });
}