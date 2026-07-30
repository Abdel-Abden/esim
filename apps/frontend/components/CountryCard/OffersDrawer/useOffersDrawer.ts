/**
 * useOffersDrawer — logique partagée par tous les drawers d'offres
 * (CountryCard/FeaturedCard : 1 eSIM · RegionGroupCard/WorldOffersSection : N eSIMs).
 *
 * Remplace useOfferDrawer.ts + useGroupOfferDrawer.ts : les deux faisaient
 * exactement la même chose (fetch des offres + remplissage du panier +
 * navigation), avec juste une forme de state différente pour 1 vs N eSIMs.
 * Ici on travaille toujours sur un tableau — 1 eSIM n'est qu'un cas
 * particulier (tableau à un seul élément).
 *
 * Pas de state de "sélection" : depuis que taper une offre déclenche la
 * commande immédiatement (fermeture + navigation dans la foulée), garder un
 * state "selected" pour un radio-bouton qui ne sera jamais visible n'a plus
 * de sens.
 */
import i18n, { apiError } from '@/i18n/i18n';
import { fetchOffers } from '@/service/esims';
import { useCartStore } from '@/store/useCartStore';
import { EsimSummary, OfferWithStock, formatOfferLabel, getDisplayName } from '@ilotel/shared';
import { useRouter } from 'expo-router';
import { useState } from 'react';

export interface OfferSection {
  esim: EsimSummary;
  offers: OfferWithStock[];
  loading: boolean;
  loadError: string | null;
}

export interface UseOffersDrawerReturn {
  drawerOpen: boolean;
  sections: OfferSection[];
  openDrawer: () => Promise<void>;
  closeDrawer: () => void;
  /** Sélectionne l'offre `offerIdx` de l'eSIM `esimId` ET commande immédiatement */
  selectOffer: (esimId: string, offerIdx: number) => void;
}

export function useOffersDrawer(esims: EsimSummary[]): UseOffersDrawerReturn {
  const router = useRouter();
  const setCart = useCartStore((s) => s.setCart);

  const [drawerOpen, setDrawerOpen] = useState(false);
  const [sections, setSections] = useState<OfferSection[]>(
    esims.map((esim) => ({ esim, offers: [], loading: false, loadError: null })),
  );

  const openDrawer = async () => {
    setDrawerOpen(true);
    setSections(esims.map((esim) => ({ esim, offers: [], loading: true, loadError: null })));

    const results = await Promise.all(
      esims.map(async (esim): Promise<OfferSection> => {
        const { data, errorCode } = await fetchOffers(esim.id);
        if (data && data.length > 0) {
          return { esim, offers: data, loading: false, loadError: null };
        }
        return {
          esim,
          offers: [],
          loading: false,
          loadError: apiError(errorCode, 'errors.OFFER_NOT_FOR_SALE'),
        };
      }),
    );
    setSections(results);
  };

  const closeDrawer = () => setDrawerOpen(false);

  const selectOffer = (esimId: string, offerIdx: number) => {
    const section = sections.find((s) => s.esim.id === esimId);
    const offer = section?.offers[offerIdx];
    if (!section || !offer || offer.availableCount === 0) return;

    setCart({
      offerId: offer.id,
      esimId: section.esim.id,
      country: getDisplayName(section.esim.code, i18n.resolvedLanguage),
      flag: section.esim.flag,
      offer: formatOfferLabel(offer),
      basePrice: offer.basePrice,
      finalPrice: offer.finalPrice,
      isPromo: offer.activeDiscount !== null,
    });
    closeDrawer();
    router.push('/payment');
  };

  return { drawerOpen, sections, openDrawer, closeDrawer, selectOffer };
}
