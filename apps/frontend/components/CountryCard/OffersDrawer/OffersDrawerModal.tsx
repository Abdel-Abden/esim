/**
 * OffersDrawerModal — bottom sheet modal générique pour choisir une offre.
 *
 * Remplace OfferDrawer.tsx (1 destination) et GroupOfferDrawer.tsx (N destinations) :
 * les deux étaient un chrome de modal identique autour d'un rendu d'offres
 * quasi identique. Ici le chrome est unique, et le contenu délégué à
 * <OffersSections/> qui gère seule la différence 1 vs N via
 * `sections.length`.
 */
import { Destination, getDisplayName } from '@ilotel/shared';
import React, { useEffect, useRef } from 'react';
import { useTranslation } from 'react-i18next';
import { Animated, Dimensions, Modal, ScrollView, Text, TouchableOpacity, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { drawerStyles } from './OffersDrawer.styles';
import OffersSections from './OffersSections';
import { OfferSection } from './useOffersDrawer';

interface OffersDrawerModalProps {
  /** destination "principal" affiché dans l'en-tête (flag + nom) — le premier de la liste */
  destination: Destination;
  /** Titre affiché à la place du nom de l'destination (ex: nom de la région groupée) */
  title?: string;
  visible: boolean;
  sections: OfferSection[];
  onOfferPress: (destinationId: string, offerIdx: number) => void;
  onClose: () => void;
}

const SHEET_HEIGHT = Dimensions.get('window').height;

export default function OffersDrawerModal({
  destination,
  title,
  visible,
  sections,
  onOfferPress,
  onClose,
}: OffersDrawerModalProps) {
  const { t, i18n } = useTranslation();
  const backdropOpacity = useRef(new Animated.Value(0)).current;
  const sheetTranslateY = useRef(new Animated.Value(SHEET_HEIGHT)).current;

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
      <SafeAreaView style={{ flex: 1 }} edges={['top', 'bottom']}>
        <Animated.View style={[drawerStyles.backdrop, { opacity: backdropOpacity }]}>

          <TouchableOpacity style={{ flex: 1 }} activeOpacity={1} onPress={onClose} />

          <Animated.View style={[drawerStyles.sheet, { transform: [{ translateY: sheetTranslateY }] }]}>
            <View style={drawerStyles.handle} />

            <View style={drawerStyles.header}>
              <View style={drawerStyles.countryRow}>
                <Text style={drawerStyles.flag}>{destination.flag}</Text>
                <View>
                  <Text style={drawerStyles.countryName}>
                    {title ?? getDisplayName(destination.code, i18n.resolvedLanguage)}
                  </Text>
                  <Text style={drawerStyles.countrySub}>{t('offerDrawer.choosePlan')}</Text>
                </View>
              </View>
              <TouchableOpacity style={drawerStyles.closeBtn} onPress={onClose}>
                <Text style={drawerStyles.closeTxt}>{t('tutorial.close')}</Text>
              </TouchableOpacity>
            </View>

            <View style={drawerStyles.divider} />

            <ScrollView showsVerticalScrollIndicator={false}>
              <OffersSections sections={sections} onOfferPress={onOfferPress} />
            </ScrollView>

          </Animated.View>

        </Animated.View>
      </SafeAreaView>
    </Modal>
  );
}
