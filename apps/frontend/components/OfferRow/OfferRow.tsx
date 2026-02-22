// components/OfferRow/OfferRow.tsx
import { OfferWithDetails } from '@ilotel/shared';
import React from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import { styles } from './OfferRow.styles';

interface OfferRowProps {
  offer: OfferWithDetails;
  selected: boolean;
  onSelect: (offer: OfferWithDetails) => void;
}

export default function OfferRow({ offer, selected, onSelect }: OfferRowProps) {
  const isPromo = offer.activeDiscount !== null;

  return (
    <TouchableOpacity
      style={[styles.row, selected && styles.rowSelected]}
      onPress={() => onSelect(offer)}
      activeOpacity={0.8}
    >
      <View style={[styles.radio, selected && styles.radioSelected]}>
        {selected && <View style={styles.radioDot} />}
      </View>

      <Text style={styles.label}>
        {offer.dataGb} Go / {offer.durationDays}j
      </Text>

      <View style={{ alignItems: 'flex-end' }}>
        {isPromo && (
          <Text style={styles.originalPrice}>
            {offer.basePrice.toFixed(2)}€
          </Text>
        )}
        <Text style={[styles.price, isPromo && styles.promoPrice]}>
          {offer.finalPrice.toFixed(2)}€
        </Text>
      </View>
    </TouchableOpacity>
  );
}
