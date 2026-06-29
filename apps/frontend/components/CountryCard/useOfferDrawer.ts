/**
 * useOfferDrawer — logique partagée entre CountryCard et FeaturedCard
 *
 * Extrait tout l'état et les handlers du drawer pour éviter la duplication.
 * Chaque composant garde son propre rendu visuel mais délègue la logique ici.
 */
import i18n, { apiError } from '@/i18n/i18n';
import { fetchOffers } from '@/service/esims';
import { useCartStore } from '@/store/useCartStore';
import { EsimSummary, OfferWithStock, formatOfferLabel, getDisplayName } from '@ilotel/shared';
import { useRouter } from 'expo-router';
import { useState } from 'react';

export interface UseOfferDrawerReturn {
  drawerOpen: boolean;
  offers: OfferWithStock[];
  loading: boolean;
  loadError: string | null;
  selectedIdx: number;
  setSelectedIdx: (i: number) => void;
  openDrawer: () => Promise<void>;
  closeDrawer: () => void;
  handleOrder: () => void;
}

export function useOfferDrawer(esim: EsimSummary): UseOfferDrawerReturn {
  const router = useRouter();
  const setCart = useCartStore((s) => s.setCart);

  const [drawerOpen, setDrawerOpen] = useState(false);
  const [offers, setOffers] = useState<OfferWithStock[]>([]);
  const [loading, setLoading] = useState(false);
  const [loadError, setLoadError] = useState<string | null>(null);
  const [selectedIdx, setSelectedIdx] = useState(0);

  const openDrawer = async () => {
    setSelectedIdx(0);
    setLoadError(null);
    setOffers([]);
    setDrawerOpen(true);

    setLoading(true);
    const { data, errorCode } = await fetchOffers(esim.id);
    if (data && data.length > 0) {
      setOffers(data);
    } else {
      setLoadError(apiError(errorCode, 'errors.OFFER_NOT_FOR_SALE'));
    }
    setLoading(false);
  };

  const closeDrawer = () => setDrawerOpen(false);

  const handleOrder = () => {
    const offer = offers[selectedIdx];
    if (!offer || offer.availableCount === 0) return;
    setCart({
      offerId: offer.id,
      esimId: esim.id,
      country: getDisplayName(esim.code, i18n.resolvedLanguage) ,
      flag: esim.flag,
      offer: formatOfferLabel(offer),
      basePrice: offer.basePrice,
      finalPrice: offer.finalPrice,
      isPromo: offer.activeDiscount !== null,
    });
    closeDrawer();
    router.push('/payment');
  };

  return {
    drawerOpen,
    offers,
    loading,
    loadError,
    selectedIdx,
    setSelectedIdx,
    openDrawer,
    closeDrawer,
    handleOrder,
  };
}
