import { Offer } from '@ilotel/shared';
import React from 'react';
import { useTranslation } from 'react-i18next';
import { Text, TouchableOpacity, View } from 'react-native';
import { styles } from './OfferRow.styles';

interface OfferRowProps {
  offer: Offer;
  selected: boolean;
  onSelect: (offer: Offer) => void;
}

export default function OfferRow({ offer, selected, onSelect }: OfferRowProps) {
  const { t } = useTranslation();
  const isPromo = offer.discount !== null;

  return (
    <TouchableOpacity
      style={[
        styles.row,
        selected && styles.rowSelected,
      ]}
      onPress={() => onSelect(offer)}
      activeOpacity={0.8}
    >
      <View style={[styles.radio, selected && styles.radioSelected]}>
        {selected && <View style={styles.radioDot} />}
      </View>

      <Text style={styles.label}>
        {offer.dataQuantity} {offer.dataUnit} / {offer.durationQuantity}{t(`offerDrawer.${offer.durationUnit}`).charAt(0)}
      </Text>

      <View style={{ alignItems: 'flex-end' }}>
        {isPromo && (
          <Text style={styles.originalPrice}>{offer.basePrice.toFixed(2)}€</Text>
        )}
        <Text style={[styles.price, isPromo && styles.promoPrice]}>
          {offer.finalPrice.toFixed(2)}€
        </Text>
      </View>
    </TouchableOpacity>
  );
}
