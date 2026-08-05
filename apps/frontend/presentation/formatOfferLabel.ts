import type { OfferEntity } from '@ilotel/shared';
import type { TFunction } from 'i18next';

export function formatOfferLabel(
  offer: Pick<OfferEntity, 
    'dataQuantity' |
    'dataUnit' | 
    'durationQuantity' |
    'durationUnit'
  >,
  t: TFunction
): string {
  return `${offer.dataQuantity} ${offer.dataUnit} / ${offer.durationQuantity} ${t(`home.offerDrawer.${offer.durationUnit}`)}`;
}