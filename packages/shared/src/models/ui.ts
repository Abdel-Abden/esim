/**
 * Modèles UI — utilisés uniquement côté frontend (Zustand, affichage)
 */

/** Panier Zustand — sélection en cours avant paiement */
export interface CartItem {
  offerId: string;
  destinationsId: string;
  country: string;
  flag: string;
  offer: string;       // ex: "5 Go / 7 jours"
  basePrice: number;
  finalPrice: number;
  isPromo: boolean;
}