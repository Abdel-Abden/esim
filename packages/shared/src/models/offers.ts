/**
 * Modèles d'offres enrichis — jointures avec esim + discount
 */
import type { Discount, Offer } from '../entities/offers.js';

/** Offre avec destination + réduction active → GET /esims/:id/offers */
export interface OfferWithDetails extends Offer {
  activeDiscount: Discount | null;
  finalPrice: number;
}

/** OfferWithDetails + comptage du stock disponible */
export interface OfferWithStock extends OfferWithDetails {
  availableCount: number; // 0 = épuisé
}
