import { Offer } from '@/types';
import React from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import { styles } from './OfferRow.styles';

interface OfferRowProps {
  offer: Offer;
  selected: boolean;
  onSelect: (offer: Offer) => void;
}

export default function OfferRow({ offer, selected, onSelect }: OfferRowProps) {
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
        {offer.data} / {offer.duration}
      </Text>

      <Text style={[styles.price, offer.isPromo && styles.promoPrice]}>
        {offer.price.toFixed(2)}€
      </Text>
    </TouchableOpacity>
  );
}
