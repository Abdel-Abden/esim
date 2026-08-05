/**
 * Modèles d'offres enrichis — jointures avec destination + discount
 */
import type { DiscountType, OfferEntity } from '../entities/offers.js';

export interface Discount {
  value: number;
  type: DiscountType;
}

/** Offre avec destination + réduction active → GET /esims/:id/offers */
export interface Offer extends Omit<OfferEntity, "destinationId" | "createdAt"> {
  discount?: Discount;
  finalPrice: number;
}