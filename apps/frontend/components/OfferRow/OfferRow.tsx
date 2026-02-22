import { OfferWithStock } from '@ilotel/shared';
import React from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import { styles } from './OfferRow.styles';

interface OfferRowProps {
  offer: OfferWithStock;
  selected: boolean;
  onSelect: (offer: OfferWithStock) => void;
}

export default function OfferRow({ offer, selected, onSelect }: OfferRowProps) {
  const isPromo = offer.activeDiscount !== null;
  const isExhausted = offer.availableCount === 0;

  return (
    <TouchableOpacity
      style={[
        styles.row,
        selected && !isExhausted && styles.rowSelected,
        isExhausted && { opacity: 0.4 },
      ]}
      onPress={() => !isExhausted && onSelect(offer)}
      activeOpacity={isExhausted ? 1 : 0.8}
    >
      <View style={[styles.radio, selected && !isExhausted && styles.radioSelected]}>
        {selected && !isExhausted && <View style={styles.radioDot} />}
      </View>

      <Text style={styles.label}>
        {offer.dataGb} Go / {offer.durationDays}j
        {isExhausted && '  · Épuisé'}
      </Text>

      <View style={{ alignItems: 'flex-end' }}>
        {isPromo && !isExhausted && (
          <Text style={styles.originalPrice}>
            {offer.basePrice.toFixed(2)}€
          </Text>
        )}
        <Text style={[styles.price, isPromo && !isExhausted && styles.promoPrice]}>
          {offer.finalPrice.toFixed(2)}€
        </Text>
      </View>
    </TouchableOpacity>
  );
}