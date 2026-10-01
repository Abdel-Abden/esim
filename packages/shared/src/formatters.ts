import type { OfferEntity } from './entities/offers.js';

/** Formate une offre en label lisible — ex: "5 Go / 7 jours" */
export function formatOfferLabel(
  offer: Pick<OfferEntity, 
    'dataQuantity' |
    'dataUnit' | 
    'durationQuantity' |
    'durationUnit'
  >
): string {
  return `${offer.dataQuantity} ${offer.dataUnit} / ${offer.durationQuantity} ${offer.durationUnit}`;
}