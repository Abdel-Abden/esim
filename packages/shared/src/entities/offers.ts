/**
 * Entités liées aux offres — tables `offers` et `discounts`
 */

/** Table `offers` — forfait lié à une destination */
export interface Offer {
  id: string;
  esimId: string;
  dataGb: number;
  durationDays: number;
  basePrice: number;
  stripePriceId: string;
  createdAt: string;
}

export type DiscountType = 'percentage' | 'fixed';

/** Table `discounts` — réduction applicable sur une offre */
export interface Discount {
  id: string;
  offerId: string;
  type: DiscountType;
  value: number;
  active: boolean;
  startsAt: string | null;
  endsAt: string | null;
}
