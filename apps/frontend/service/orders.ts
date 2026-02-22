// service/orders.ts
import { CancelOrderResponse, CreateOrderRequest, CreateOrderResponse, GetOrderResponse } from '@ilotel/shared';
import { apiFetch } from './api';

/**
 * Crée une commande et réserve une eSIM.
 * Retourne les clés Stripe nécessaires à la PaymentSheet.
 */
export async function createOrder(payload: CreateOrderRequest) {
  return apiFetch<CreateOrderResponse>('/orders', {
    method: 'POST',
    body: JSON.stringify(payload),
  });
}

/**
 * Récupère les détails d'une commande après paiement.
 * Appelé en polling depuis la page details jusqu'à avoir status = 'provisioned'.
 */
export async function fetchOrder(orderId: string) {
  return apiFetch<GetOrderResponse>(`/orders/${orderId}`);
}

/**
 * Annule une commande pending — libère l'eSIM réservée.
 * À appeler si l'utilisateur abandonne ou si le paiement échoue définitivement.
 */
export async function cancelOrder(orderId: string) {
  return apiFetch<CancelOrderResponse>(`/orders/${orderId}/cancel`, {
    method: 'POST',
  });
}