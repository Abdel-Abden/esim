/**
 * Entités liées aux offres — tables `offers` et `discounts`
 */

export const OfferDataUnit = {
  GO: "Go",
  MO: "Mo",
  KO: "Ko" 
} as const;

export type OfferDataUnit =
  typeof OfferDataUnit[keyof typeof OfferDataUnit];

export const OfferDurationUnit = {
  DAYS: "days",
  MONTHS: "months",
  YEARS: "year"
} as const;

export type OfferDurationUnit =
  typeof OfferDurationUnit[keyof typeof OfferDurationUnit];

export const DiscountType = {
  PERCENTAGE: "percentage",
  FIXED: "fixed"
} as const;

export type DiscountType =
  typeof DiscountType[keyof typeof DiscountType];

/** Table `offers` — forfait lié à une destination */
export interface OfferEntity {
  id: string;
  destinationId: string;
  dataQuantity: number;
  dataUnit: OfferDataUnit;
  durationQuantity: number;
  durationUnit: OfferDurationUnit;
  basePrice: number;
  stripePriceId: string | null;
  providerProductId: string;
  available: boolean;
  createdAt: string;
}

/** Table `discounts` — réduction applicable sur une offre */
export interface DiscountEntity {
  id: string;
  offerId: string;
  type: DiscountType;
  value: number;
  active: boolean;
  startsAt: string | null;
  endsAt: string | null;
}
