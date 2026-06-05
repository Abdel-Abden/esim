/**
 * OfferDrawer — bottom sheet partagé entre CountryCard et FeaturedCard
 * Composant purement visuel — toute la logique est dans useOfferDrawer.
 */
import { Colors } from '@/constants/theme';
import { Ionicons } from '@expo/vector-icons';
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
import { useTranslation } from 'react-i18next';
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

const SHEET_HEIGHT = Dimensions.get('window').height;

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
  const { t } = useTranslation();
  const backdropOpacity = useRef(new Animated.Value(0)).current;
  const sheetTranslateY = useRef(new Animated.Value(SHEET_HEIGHT)).current;
  const isOutOfStock = offers[selectedIdx]?.availableCount === 0;
  const isDisabled = loading || !offers[selectedIdx] || isOutOfStock;

  useEffect(() => {
    if (visible) {
      backdropOpacity.setValue(0);
      sheetTranslateY.setValue(SHEET_HEIGHT);
      Animated.timing(backdropOpacity, { toValue: 1, duration: 180, useNativeDriver: true }).start();
      Animated.spring(sheetTranslateY, { toValue: 0, damping: 28, stiffness: 280, mass: 0.8, useNativeDriver: true }).start();
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

        <Animated.View style={[drawerStyles.sheet, { transform: [{ translateY: sheetTranslateY }] }]}>
          <View style={drawerStyles.handle} />

          <View style={drawerStyles.header}>
            <View style={drawerStyles.countryRow}>
              <Text style={drawerStyles.flag}>{esim.flag}</Text>
              <View>
                <Text style={drawerStyles.countryName}>{esim.name}</Text>
                <Text style={drawerStyles.countrySub}>{t('offerDrawer.choosePlan')}</Text>
              </View>
            </View>
            <TouchableOpacity style={drawerStyles.closeBtn} onPress={onClose}>
              <Text style={drawerStyles.closeTxt}>{t('tutorial.close')}</Text>
            </TouchableOpacity>
          </View>

          <View style={drawerStyles.divider} />

          <Text style={drawerStyles.offersLabel}>{t('offerDrawer.availablePlans')}</Text>

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
                      <Text style={drawerStyles.offerDays}>{offer.durationDays} {t('offerDrawer.days')}</Text>
                    </View>
                    <View style={drawerStyles.offerRight}>
                      {isPromo && !isExhausted && (
                        <View style={drawerStyles.promoBadge}>
                          <Text style={drawerStyles.promoBadgeText}>{t('countryCard.promo').toUpperCase()}</Text>
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
                        {isExhausted ? t('offerDrawer.exhausted') : `${offer.finalPrice.toFixed(2)}€`}
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
              style={[drawerStyles.ctaBtn, isDisabled && drawerStyles.ctaBtnDisabled]}
              onPress={onOrder}
              activeOpacity={0.85}
              disabled={isDisabled}
            >
              {loading ? (
                <Text style={drawerStyles.ctaBtnText}>{t('payment.button.loading')}</Text>
              ) : isOutOfStock ? (
                <Text style={drawerStyles.ctaBtnText}>{t('offerDrawer.exhausted')}</Text>
              ) : (
                <View style={drawerStyles.ctaBtnContent}>
                  <Text style={drawerStyles.ctaBtnText}>{t('offerDrawer.order')}</Text>
                  <Ionicons name="arrow-forward" size={18} color="white" />
                </View>
              )}
            </TouchableOpacity>
          </View>

        </Animated.View>

      </Animated.View>
    </Modal>
  );
}
