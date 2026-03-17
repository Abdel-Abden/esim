import { EsimSummary, GetEsimsResponse, GetOffersResponse } from '@ilotel/shared';
import { apiFetch } from './api';

/**
 * Liste toutes les destinations avec prix min et état promo/stock.
 * 1 seul appel réseau — remplace fetchEsims() + N×fetchOffers().
 */
export async function fetchEsims() {
  return apiFetch<GetEsimsResponse>('/esims');
}

/** Récupère une destination par son id */
export async function fetchEsim(id: string) {
  return apiFetch<EsimSummary>(`/esims/${id}`);
}

/**
 * Récupère les offres complètes d'une destination.
 * Appelé uniquement au tap sur une carte (chargement à la demande).
 */
export async function fetchOffers(esimId: string) {
  return apiFetch<GetOffersResponse>(`/esims/${esimId}/offers`);
}
