/**
 * useOffersDrawer — logique partagée par tous les drawers d'offres
 * (CountryCard/FeaturedCard : 1 destinations · RegionGroupCard/WorldOffersSection : N destinations).
 *
 * Remplace useOfferDrawer.ts + useGroupOfferDrawer.ts : les deux faisaient
 * exactement la même chose (fetch des offres + remplissage du panier +
 * navigation), avec juste une forme de state différente pour 1 vs N destinations.
 * Ici on travaille toujours sur un tableau — 1 destinations n'est qu'un cas
 * particulier (tableau à un seul élément).
 *
 * Pas de state de "sélection" : depuis que taper une offre déclenche la
 * commande immédiatement (fermeture + navigation dans la foulée), garder un
 * state "selected" pour un radio-bouton qui ne sera jamais visible n'a plus
 * de sens.
 */
import i18n, { apiError } from '@/i18n/i18n';
import { fetchOffers } from '@/service/destination';
import { useCartStore } from '@/store/useCartStore';
import { Destination, Offer, formatOfferLabel, getDisplayName } from '@ilotel/shared';
import { useRouter } from 'expo-router';
import { useState } from 'react';

export interface OfferSection {
  destinations: Destination;
  offers: Offer[];
  loading: boolean;
  loadError: string | null;
}

export interface UseOffersDrawerReturn {
  drawerOpen: boolean;
  sections: OfferSection[];
  openDrawer: () => Promise<void>;
  closeDrawer: () => void;
  /** Sélectionne l'offre `offerIdx` de l'destinations `destinationsId` ET commande immédiatement */
  selectOffer: (destinationsId: string, offerIdx: number) => void;
}

export function useOffersDrawer(destinations: Destination[]): UseOffersDrawerReturn {
  const router = useRouter();
  const setCart = useCartStore((s) => s.setCart);

  const [drawerOpen, setDrawerOpen] = useState(false);
  const [sections, setSections] = useState<OfferSection[]>(
    destinations.map((destinations) => ({ destinations, offers: [], loading: false, loadError: null })),
  );

  const openDrawer = async () => {
    setDrawerOpen(true);
    setSections(destinations.map((destinations) => ({ destinations, offers: [], loading: true, loadError: null })));

    const results = await Promise.all(
      destinations.map(async (destinations): Promise<OfferSection> => {
        const { data, errorCode } = await fetchOffers(destinations.id);
        if (data && data.length > 0) {
          return { destinations, offers: data, loading: false, loadError: null };
        }
        return {
          destinations,
          offers: [],
          loading: false,
          loadError: apiError(errorCode, 'errors.OFFER_NOT_FOR_SALE'),
        };
      }),
    );
    setSections(results);
  };

  const closeDrawer = () => setDrawerOpen(false);

  const selectOffer = (destinationsId: string, offerIdx: number) => {
    const section = sections.find((s) => s.destinations.id === destinationsId);
    const offer = section?.offers[offerIdx];
    if (!section || !offer) return;

    setCart({
      offerId: offer.id,
      destinationsId: section.destinations.id,
      country: getDisplayName(section.destinations.code, i18n.resolvedLanguage),
      flag: section.destinations.flag,
      offer: formatOfferLabel(offer),
      basePrice: offer.basePrice,
      finalPrice: offer.finalPrice,
      isPromo: offer.discount?.value !== null,
    });
    closeDrawer();
    router.push('/payment');
  };

  return { drawerOpen, sections, openDrawer, closeDrawer, selectOffer };
}
