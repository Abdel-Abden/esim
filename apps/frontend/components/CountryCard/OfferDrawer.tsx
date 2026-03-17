/**
 * OfferDrawer — bottom sheet partagé entre CountryCard et FeaturedCard
 *
 * Reçoit toutes les props de useOfferDrawer + les infos de l'eSIM.
 * Ne contient aucune logique : c'est un composant purement visuel.
 */
import { Colors } from '@/constants/theme';
import { EsimSummary, OfferWithStock } from '@ilotel/shared';
import React, { useEffect, useRef } from 'react';
import {
  ActivityIndicator,
  Animated,
  Dimensions,
  Modal,
  ScrollView,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import { drawerStyles } from './CountryCard.styles';

interface OfferDrawerProps {
  esim: EsimSummary;
  visible: boolean;
  offers: OfferWithStock[];
  loading: boolean;
  loadError: string | null;
  selectedIdx: number;
  onSelectIdx: (i: number) => void;
  onClose: () => void;
  onOrder: () => void;
}

const SHEET_HEIGHT = Dimensions.get('window').height; // ← hauteur réelle

export default function OfferDrawer({
  esim,
  visible,
  offers,
  loading,
  loadError,
  selectedIdx,
  onSelectIdx,
  onClose,
  onOrder,
}: OfferDrawerProps) {
  const backdropOpacity = useRef(new Animated.Value(0)).current;
  const sheetTranslateY = useRef(new Animated.Value(SHEET_HEIGHT)).current;

  useEffect(() => {
    if (visible) {
      backdropOpacity.setValue(0);
      sheetTranslateY.setValue(SHEET_HEIGHT);
      Animated.timing(backdropOpacity, {
        toValue: 1,
        duration: 180,
        useNativeDriver: true,
      }).start();
      Animated.spring(sheetTranslateY, {
        toValue: 0,
        damping: 28,
        stiffness: 280,
        mass: 0.8,
        useNativeDriver: true,
      }).start();
    } else {
      Animated.parallel([
        Animated.timing(backdropOpacity, { toValue: 0, duration: 220, useNativeDriver: true }),
        Animated.timing(sheetTranslateY, { toValue: SHEET_HEIGHT, duration: 220, useNativeDriver: true }),
      ]).start();
    }
  }, [visible]);

  return (
    <Modal visible={visible} transparent animationType="none" onRequestClose={onClose}>
      <Animated.View style={[drawerStyles.backdrop, { opacity: backdropOpacity }]}>

        <TouchableOpacity style={{ flex: 1 }} activeOpacity={1} onPress={onClose} />

        {/* ← PAS de TouchableOpacity imbriqué ici, juste l'Animated.View */}
        <Animated.View style={[drawerStyles.sheet, { transform: [{ translateY: sheetTranslateY }] }]}>
          <View style={drawerStyles.handle} />

          <View style={drawerStyles.header}>
            <View style={drawerStyles.countryRow}>
              <Text style={drawerStyles.flag}>{esim.flag}</Text>
              <View>
                <Text style={drawerStyles.countryName}>{esim.name}</Text>
                <Text style={drawerStyles.countrySub}>Choisissez votre forfait</Text>
              </View>
            </View>
            <TouchableOpacity style={drawerStyles.closeBtn} onPress={onClose}>
              <Text style={drawerStyles.closeTxt}>✕</Text>
            </TouchableOpacity>
          </View>

          <View style={drawerStyles.divider} />

          <Text style={drawerStyles.offersLabel}>Forfaits disponibles</Text>

          {loading ? (
            <ActivityIndicator size="large" color={Colors.primary} style={{ marginVertical: 32 }} />
          ) : loadError ? (
            <Text style={drawerStyles.errorText}>{loadError}</Text>
          ) : (
            <ScrollView style={drawerStyles.offersList} showsVerticalScrollIndicator={false}>
              {offers.map((offer, i) => {
                const isPromo = offer.activeDiscount !== null;
                const isExhausted = offer.availableCount === 0;
                const isSelected = selectedIdx === i;
                return (
                  <TouchableOpacity
                    key={offer.id}
                    style={[
                      drawerStyles.offerCard,
                      isSelected && drawerStyles.offerCardSelected,
                      isExhausted && drawerStyles.offerCardExhausted,
                    ]}
                    onPress={() => !isExhausted && onSelectIdx(i)}
                    activeOpacity={0.75}
                  >
                    <View style={drawerStyles.offerLeft}>
                      <Text style={drawerStyles.offerData}>{offer.dataGb} Go</Text>
                      <Text style={drawerStyles.offerDays}>{offer.durationDays} jours</Text>
                    </View>
                    <View style={drawerStyles.offerRight}>
                      {isPromo && !isExhausted && (
                        <View style={drawerStyles.promoBadge}>
                          <Text style={drawerStyles.promoBadgeText}>PROMO</Text>
                        </View>
                      )}
                      {isPromo && !isExhausted && (
                        <Text style={drawerStyles.oldPrice}>{offer.basePrice.toFixed(2)}€</Text>
                      )}
                      <Text
                        style={[
                          drawerStyles.finalPrice,
                          isExhausted && drawerStyles.finalPriceExhausted,
                        ]}
                      >
                        {isExhausted ? 'Épuisé' : `${offer.finalPrice.toFixed(2)}€`}
                      </Text>
                    </View>
                    <View style={[drawerStyles.radio, isSelected && drawerStyles.radioSelected]}>
                      {isSelected && <View style={drawerStyles.radioDot} />}
                    </View>
                  </TouchableOpacity>
                );
              })}
            </ScrollView>
          )}

          <View style={drawerStyles.cta}>
            <TouchableOpacity
              style={[
                drawerStyles.ctaBtn,
                (loading || offers[selectedIdx]?.availableCount === 0) &&
                  drawerStyles.ctaBtnDisabled,
              ]}
              onPress={onOrder}
              activeOpacity={0.85}
              disabled={loading || !offers[selectedIdx] || offers[selectedIdx].availableCount === 0}
            >
              <Text style={drawerStyles.ctaBtnText}>Commander →</Text>
            </TouchableOpacity>
          </View>

        </Animated.View>

      </Animated.View>
    </Modal>
  );
}
