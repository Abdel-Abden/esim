// components/CountryCard/CountryCard.tsx
import { fetchOffers } from '@/service/esims';
import { useCartStore } from '@/store/useCartStore';
import { Esim, OfferWithDetails, formatOfferLabel } from '@ilotel/shared';
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
  preloadedOffers?: OfferWithDetails[]; // fournies par le home screen
}

export default function CountryCard({ esim, preloadedOffers }: CountryCardProps) {
  const router = useRouter();
  const setCart = useCartStore((s) => s.setCart);

  const [isOpen, setIsOpen] = useState(false);
  const [offers, setOffers] = useState<OfferWithDetails[]>(preloadedOffers ?? []);
  const [selectedOffer, setSelectedOffer] = useState<OfferWithDetails | null>(
    preloadedOffers?.[0] ?? null
  );
  const [offersError, setOffersError] = useState<string | null>(null);

  // Si les offres arrivent en retard via preloadedOffers
  useEffect(() => {
    if (preloadedOffers && preloadedOffers.length > 0 && offers.length === 0) {
      setOffers(preloadedOffers);
      setSelectedOffer(preloadedOffers[0]);
    }
  }, [preloadedOffers]);

  const hasPromo = offers.some((o) => o.activeDiscount !== null);
  const minPrice = offers.length > 0
    ? Math.min(...offers.map((o) => o.finalPrice))
    : null;

  const toggleOpen = async () => {
    LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut);

    // Fallback : si les offres ne sont pas encore chargées (ne devrait pas arriver)
    if (!isOpen && offers.length === 0) {
      setOffersError(null);
      const { data, error } = await fetchOffers(esim.id);
      if (data && data.length > 0) {
        setOffers(data);
        setSelectedOffer(data[0]);
      } else {
        setOffersError(error ?? 'Aucune offre disponible.');
      }
    }

    setIsOpen((prev) => !prev);
  };

  const handleOrder = () => {
    if (!selectedOffer) return;
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
        </View>

        {minPrice !== null
          ? <Text style={styles.startingPrice}>Dès {minPrice.toFixed(2)}€</Text>
          : <Text style={styles.startingPrice}>—</Text>
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
              onSelect={setSelectedOffer}
            />
          ))}

          {offers.length > 0 && (
            <PrimaryButton
              label="Commander"
              onPress={handleOrder}
              style={{ marginTop: 4 }}
            />
          )}
        </View>
      )}
    </View>
  );
}
