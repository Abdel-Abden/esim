import { fetchOffers } from '@/service/esims';
import { useCartStore } from '@/store/useCartStore';
import { Esim, OfferWithStock, formatOfferLabel } from '@ilotel/shared';
import { useRouter } from 'expo-router';
import React, { useEffect, useState } from 'react';
import {
  LayoutAnimation,
  Platform,
  Text,
  TouchableOpacity,
  UIManager,
  View,
} from 'react-native';
import OfferRow from '../OfferRow/OfferRow';
import PrimaryButton from '../PrimaryButton/PrimaryButton';
import { styles } from './CountryCard.styles';

if (Platform.OS === 'android' && UIManager.setLayoutAnimationEnabledExperimental) {
  UIManager.setLayoutAnimationEnabledExperimental(true);
}

interface CountryCardProps {
  esim: Esim;
  preloadedOffers?: OfferWithStock[];
  onStockExhausted?: (esimId: string) => void; // callback vers le home pour refresh
}

export default function CountryCard({ esim, preloadedOffers, onStockExhausted }: CountryCardProps) {
  const router = useRouter();
  const setCart = useCartStore((s) => s.setCart);

  const [isOpen, setIsOpen] = useState(false);
  const [offers, setOffers] = useState<OfferWithStock[]>(preloadedOffers ?? []);
  const [selectedOffer, setSelectedOffer] = useState<OfferWithStock | null>(
    preloadedOffers?.find((o) => o.availableCount > 0) ?? null
  );
  const [offersError, setOffersError] = useState<string | null>(null);

  useEffect(() => {
    if (preloadedOffers && preloadedOffers.length > 0 && offers.length === 0) {
      setOffers(preloadedOffers);
      setSelectedOffer(preloadedOffers.find((o) => o.availableCount > 0) ?? null);
    }
  }, [preloadedOffers]);

  const hasPromo = offers.some((o) => o.activeDiscount !== null && o.availableCount > 0);
  const availableOffers = offers.filter((o) => o.availableCount > 0);
  const minPrice = availableOffers.length > 0
    ? Math.min(...availableOffers.map((o) => o.finalPrice))
    : null;

  const toggleOpen = async () => {
    LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut);

    if (!isOpen && offers.length === 0) {
      setOffersError(null);
      const { data, error } = await fetchOffers(esim.id);
      if (data && data.length > 0) {
        setOffers(data);
        setSelectedOffer(data.find((o) => o.availableCount > 0) ?? null);
      } else {
        setOffersError(error ?? 'Aucune offre disponible.');
      }
    }

    setIsOpen((prev) => !prev);
  };

  const handleOrder = () => {
    if (!selectedOffer) return;

    // Vérification stock au moment de commander
    if (selectedOffer.availableCount === 0) {
      // Rafraîchit le stock via le home
      onStockExhausted?.(esim.id);
      // Met à jour localement aussi
      fetchOffers(esim.id).then(({ data }) => {
        if (data) {
          setOffers(data);
          setSelectedOffer(data.find((o) => o.availableCount > 0) ?? null);
        }
      });
      return;
    }

    setCart({
      offerId: selectedOffer.id,
      esimId: esim.id,
      country: esim.name,
      flag: esim.flag,
      offer: formatOfferLabel(selectedOffer),
      basePrice: selectedOffer.basePrice,
      finalPrice: selectedOffer.finalPrice,
      isPromo: selectedOffer.activeDiscount !== null,
    });

    router.push('/payment');
  };

  const allExhausted = offers.length > 0 && availableOffers.length === 0;

  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.header} onPress={toggleOpen} activeOpacity={0.7}>
        <View style={styles.left}>
          <Text style={styles.flag}>{esim.flag}</Text>
          <Text style={styles.name}>{esim.name}</Text>
          {hasPromo && (
            <View style={styles.promoBadge}>
              <Text style={styles.promoText}>Promo</Text>
            </View>
          )}
          {allExhausted && (
            <View style={[styles.promoBadge, { backgroundColor: '#ccc' }]}>
              <Text style={styles.promoText}>Épuisé</Text>
            </View>
          )}
        </View>

        {minPrice !== null
          ? <Text style={styles.startingPrice}>Dès {minPrice.toFixed(2)}€</Text>
          : <Text style={styles.startingPrice}>Épuisé</Text>
        }
        <Text style={styles.chevron}>{isOpen ? '▲' : '▼'}</Text>
      </TouchableOpacity>

      {isOpen && (
        <View style={styles.offersContainer}>
          <View style={styles.divider} />

          {offersError && (
            <Text style={{ color: 'red', padding: 8 }}>{offersError}</Text>
          )}

          {offers.map((offer) => (
            <OfferRow
              key={offer.id}
              offer={offer}
              selected={selectedOffer?.id === offer.id}
              onSelect={(o) => o.availableCount > 0 && setSelectedOffer(o)}
            />
          ))}

          {offers.length > 0 && (
            <PrimaryButton
              label={
                !selectedOffer || selectedOffer.availableCount === 0
                  ? 'Stock épuisé'
                  : 'Commander'
              }
              onPress={handleOrder}
              disabled={!selectedOffer || selectedOffer.availableCount === 0}
              style={{ marginTop: 4 }}
            />
          )}
        </View>
      )}
    </View>
  );
}