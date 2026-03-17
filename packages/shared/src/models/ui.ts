/**
 * Modèles UI — utilisés uniquement côté frontend (Zustand, affichage)
 */

/** Panier Zustand — sélection en cours avant paiement */
export interface CartItem {
  offerId: string;
  esimId: string;
  country: string;
  flag: string;
  offer: string;       // ex: "5 Go / 7 jours"
  basePrice: number;
  finalPrice: number;
  isPromo: boolean;
}

/** eSIM activée affichée dans l'espace client après achat */
export interface ActiveEsim {
  orderId: string;
  country: string;
  flag: string;
  offer: string;
  price: number;
  iccid: string;
  activatedAt: string;
}
