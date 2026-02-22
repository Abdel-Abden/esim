// service/esims.ts
import { Esim, GetEsimsResponse, GetOffersResponse } from '@ilotel/shared';
import { apiFetch } from './api';

/** Liste toutes les destinations disponibles */
export async function fetchEsims() {
  return apiFetch<GetEsimsResponse>('/esims');
}

/** Récupère une destination par son id */
export async function fetchEsim(id: string) {
  return apiFetch<Esim>(`/esims/${id}`);
}

/** Récupère les offres d'une destination avec réductions actives */
export async function fetchOffers(esimId: string) {
  return apiFetch<GetOffersResponse>(`/esims/${esimId}/offers`);
}