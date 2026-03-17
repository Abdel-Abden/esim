import type { Offer } from './entities/offers.js';
import type { Discount } from './entities/offers.js';

/** Formate une offre en label lisible — ex: "5 Go / 7 jours" */
export function formatOfferLabel(
  offer: Pick<Offer, 'dataGb' | 'durationDays'>
): string {
  return `${offer.dataGb} Go / ${offer.durationDays} jours`;
}

/** Calcule le prix final après réduction */
export function applyDiscount(
  basePrice: number,
  discount: Discount | null
): number {
  if (!discount || !discount.active) return basePrice;
  if (discount.type === 'percentage') {
    return Math.round(basePrice * (1 - discount.value / 100) * 100) / 100;
  }
  return Math.max(0, Math.round((basePrice - discount.value) * 100) / 100);
}
