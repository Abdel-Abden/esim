/**
 * RegionCountriesButton
 * ─────────────────────
 * Bouton ⓘ pour les esims région/custom.
 *
 * ⚠️  Android : zIndex inside TouchableOpacity est ignoré.
 * Solution : le bouton ET la card sont frères dans un View wrapper,
 * le bouton est en absolu sur ce wrapper (pas dans le TouchableOpacity).
 *
 * Pattern d'usage dans CountryCard / FeaturedCard :
 *
 *   <View style={rcbStyles.wrapper}>
 *     <TouchableOpacity onPress={...}>...</TouchableOpacity>
 *     <RegionCountriesButton esim={esim} />
 *   </View>
 */
import { EsimSummary, getDisplayName } from '@ilotel/shared';
import React, { useEffect, useRef, useState } from 'react';
import { useTranslation } from 'react-i18next';
import {
  Animated,
  Dimensions,
  Modal,
  Pressable,
  ScrollView,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import { btnStyles, sheetStyles } from './RegionCountryButton.styles';

interface Props {
  esim: EsimSummary;
}

export default function RegionCountriesButton({ esim }: Props) {
  const { t, i18n } = useTranslation();
  const [open, setOpen] = useState(false);

  const isRegion = esim.type === 'region' || esim.type === 'custom';
  const countries = esim.regionCountries ?? [];

  if (!isRegion || countries.length === 0) return null;

  const regionLabel = getDisplayName(esim.code, i18n.resolvedLanguage);
  
  const SHEET_HEIGHT = Dimensions.get('window').height;
  const backdropOpacity = useRef(new Animated.Value(0)).current;
  const sheetTranslateY = useRef(new Animated.Value(SHEET_HEIGHT)).current;

  useEffect(() => {
    if (open) {
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
  }, [open]);

  return (
    <>
      {/* Bouton positionné en absolu sur le wrapper parent */}
      <TouchableOpacity
        style={btnStyles.btn}
        onPress={() => setOpen(true)}
        activeOpacity={0.7}
        hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
      >
        <Text style={btnStyles.label}>ⓘ</Text>
      </TouchableOpacity>

      {/* Bottom sheet */}
      <Modal
        visible={open}
        transparent
        animationType="none"
        onRequestClose={() => setOpen(false)}
      >
        <Pressable style={sheetStyles.backdrop} onPress={() => setOpen(false)}>
          <Pressable style={sheetStyles.sheet} onPress={(e) => e.stopPropagation()}>
            <View style={sheetStyles.handle} />

            <View style={sheetStyles.header}>
              <View style={sheetStyles.headerLeft}>
                <Text style={sheetStyles.flag}>{esim.flag}</Text>
                <View>
                  <Text style={sheetStyles.title}>{regionLabel}</Text>
                  <Text style={sheetStyles.subtitle}>
                    {countries.length} {t('regionTooltip.title').toLowerCase()}
                  </Text>
                </View>
              </View>
              <TouchableOpacity
                style={sheetStyles.closeBtn}
                onPress={() => setOpen(false)}
              >
                <Text style={sheetStyles.closeTxt}>✕</Text>
              </TouchableOpacity>
            </View>

            <View style={sheetStyles.divider} />

            <ScrollView
              style={sheetStyles.list}
              contentContainerStyle={sheetStyles.listContent}
              showsVerticalScrollIndicator={false}
            >
              {[...countries]
                .sort((a, b) =>
                  getDisplayName(a, i18n.resolvedLanguage).localeCompare(
                    getDisplayName(b, i18n.resolvedLanguage),
                  )
                )
                .map((code) => (
                  <View key={code} style={sheetStyles.row}>
                    <Text style={sheetStyles.countryName}>
                      {getDisplayName(code, i18n.resolvedLanguage)}
                    </Text>
                  </View>
                ))}
            </ScrollView>
          </Pressable>
        </Pressable>
      </Modal>
    </>
  );
}