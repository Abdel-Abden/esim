import { Destination, GetDestinationResponse, GetOffersResponse } from '@ilotel/shared';
import { apiFetch } from './api';

/**
 * Liste toutes les destinations avec prix min et état promo/stock.
 * 1 seul appel réseau — remplace fetchDestinations() + N×fetchOffers().
 */
export async function fetchDestinations() {
  return apiFetch<GetDestinationResponse>('/destination');
}

/** Récupère une destination par son id */
export async function fetchDestination(id: string) {
  return apiFetch<Destination>(`/destination/${id}`);
}

/**
 * Récupère les offres complètes d'une destination.
 * Appelé uniquement au tap sur une carte (chargement à la demande).
 */
export async function fetchOffers(destinationId: string) {
  return apiFetch<GetOffersResponse>(`/destination/${destinationId}/offers`);
}
