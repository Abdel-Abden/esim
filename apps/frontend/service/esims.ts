// service/esims.ts
// Client-side : récupère les eSIM produits avec leurs offres

import { apiFetch } from './api';

export interface ApiOffer {
  id: string;
  dataGb: number;
  durationDays: number;
  price: number;
  isPromo: boolean;
  inStock: boolean;
}

export interface ApiEsim {
  id: string;
  name: string;
  type: 'country' | 'region';
  flag: string;
  offers: ApiOffer[];
}

export async function fetchEsims() {
  return apiFetch<ApiEsim[]>('/api/esims');
}
