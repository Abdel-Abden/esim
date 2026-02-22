import { useCartStore } from '@/store/useCartStore';
import { Country, Offer } from '@ilotel/shared';
import { useRouter } from 'expo-router';
import React, { useState } from 'react';
import {
  LayoutAnimation,
  Platform,
  Text,
  TouchableOpacity,
  UIManager,
  View
} from 'react-native';
import OfferRow from '../OfferRow/OfferRow';
import PrimaryButton from '../PrimaryButton/PrimaryButton';
import { styles } from './CountryCard.styles';

// Active LayoutAnimation sur Android
if (Platform.OS === 'android' && UIManager.setLayoutAnimationEnabledExperimental) {
  UIManager.setLayoutAnimationEnabledExperimental(true);
}

interface CountryCardProps {
  country: Country;
}

export default function CountryCard({ country }: CountryCardProps) {
  const router = useRouter();
  const setCart = useCartStore((s) => s.setCart);

  const [isOpen, setIsOpen] = useState(false);
  const [selectedOffer, setSelectedOffer] = useState<Offer>(country.offers[0]);

  const minPrice = Math.min(...country.offers.map((o) => o.price));

  const toggleOpen = () => {
    LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut);
    setIsOpen((prev) => !prev);
  };

  const handleOrder = () => {
    setCart({
      country: country.name,
      flag: country.flag,
      offer: `${selectedOffer.data} / ${selectedOffer.duration}`,
      price: selectedOffer.price,
    });
    router.push('/payment');
  };

  return (
    <View style={styles.container}>
      {/* En-tête cliquable */}
      <TouchableOpacity style={styles.header} onPress={toggleOpen} activeOpacity={0.7}>
        <View style={styles.left}>
          <Text style={styles.flag}>{country.flag}</Text>
          <Text style={styles.name}>{country.name}</Text>
          {country.isPromo && (
            <View style={styles.promoBadge}>
              <Text style={styles.promoText}>Promo</Text>
            </View>
          )}
        </View>

        <Text style={styles.startingPrice}>Dès {minPrice.toFixed(2)}€</Text>
        <Text style={styles.chevron}>{isOpen ? '▲' : '▼'}</Text>
      </TouchableOpacity>

      {/* Offres dépliables */}
      {isOpen && (
        <View style={styles.offersContainer}>
          <View style={styles.divider} />

          {country.offers.map((offer) => (
            <OfferRow
              key={offer.id}
              offer={offer}
              selected={selectedOffer.id === offer.id}
              onSelect={setSelectedOffer}
            />
          ))}

          <PrimaryButton label="Commander" onPress={handleOrder} style={{ marginTop: 4 }} />
        </View>
      )}
    </View>
  );
}
