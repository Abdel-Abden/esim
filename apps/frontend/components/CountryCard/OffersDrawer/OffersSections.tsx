/**
 * OffersSections — rendu pur d'une liste d'offres, groupées par eSIM.
 *
 * Composant purement présentationnel : ni Modal, ni fetch, ni navigation.
 * - 1 seule section → pas d'en-tête de section (juste le libellé générique
 *   "Forfaits disponibles"), comme l'ancien OfferDrawer.
 * - Plusieurs sections → un en-tête par eSIM (flag + nom + nombre de pays),
 *   comme l'ancien GroupOfferDrawer/WorldOffersSection.
 *
 * Utilisé à la fois dans OffersDrawerModal (bottom sheet) et
 * WorldOffersSection (affichage inline sur l'onglet Monde).
 */
import { Colors, getDisplayName } from '@ilotel/shared';
import React from 'react';
import { useTranslation } from 'react-i18next';
import { ActivityIndicator, Text, TouchableOpacity, View } from 'react-native';
import RegionCountriesButton from '../../RegionCountryButton/RegionCountryButton';
import { drawerStyles, sectionStyles } from './OffersDrawer.styles';
import { OfferSection } from './useOffersDrawer';

interface OffersSectionsProps {
  sections: OfferSection[];
  onOfferPress: (esimId: string, offerIdx: number) => void;
  /** Par défaut : true dès qu'il y a plus d'une section */
  showSectionHeaders?: boolean;
}

function getDataUnitDisplay(unit: string, t: (key: string) => string): string {
  if (unit === 'UNLI') return `Go ${t('home.data.unlimited')}`;
  return unit;
}

export default function OffersSections({
  sections,
  onOfferPress,
  showSectionHeaders = sections.length > 1,
}: OffersSectionsProps) {
  const { t, i18n } = useTranslation();

  return (
    <>
      {!showSectionHeaders && (
        <Text style={drawerStyles.offersLabel}>{t('offerDrawer.availablePlans')}</Text>
      )}

      {sections.map((section, sIdx) => (
        <View key={section.esim.id}>
          {showSectionHeaders && (
            <View style={sectionStyles.sectionHeader}>
              <Text style={sectionStyles.sectionFlag}>{section.esim.flag}</Text>
              <Text style={sectionStyles.sectionName} numberOfLines={1}>
                {getDisplayName(section.esim.code, i18n.resolvedLanguage)}
              </Text>
              <RegionCountriesButton esim={section.esim} inline showLabel />
            </View>
          )}

          {section.loading ? (
            <ActivityIndicator
              size="large"
              color={Colors.primary}
              style={showSectionHeaders ? sectionStyles.sectionLoading : drawerStyles.loadingIndicator}
            />
          ) : section.loadError ? (
            <Text
              style={showSectionHeaders ? sectionStyles.sectionErrorText : drawerStyles.errorText}
            >
              {t(`errors.${section.loadError}`)}
            </Text>
          ) : (
            <View style={sectionStyles.offersWrap}>
              {section.offers.map((offer, i) => {
                const isPromo = offer.activeDiscount !== null;
                const isExhausted = offer.availableCount === 0;
                return (
                  <TouchableOpacity
                    key={offer.id}
                    style={[drawerStyles.offerCard, isExhausted && drawerStyles.offerCardExhausted]}
                    onPress={() => !isExhausted && onOfferPress(section.esim.id, i)}
                    activeOpacity={0.75}
                  >
                    <View style={drawerStyles.offerLeft}>
                      <Text style={drawerStyles.offerData}>
                        {offer.dataGb} {getDataUnitDisplay(offer.unit, t)}
                      </Text>
                      <Text style={drawerStyles.offerDays}>
                        {offer.durationDays} {t('offerDrawer.days')}
                      </Text>
                    </View>
                    <View style={drawerStyles.offerRight}>
                      {isPromo && !isExhausted && (
                        <View style={drawerStyles.promoBadge}>
                          <Text style={drawerStyles.promoBadgeText}>
                            {t('countryCard.promo').toUpperCase()}
                          </Text>
                        </View>
                      )}
                      {isPromo && !isExhausted && (
                        <Text style={drawerStyles.oldPrice}>{offer.basePrice.toFixed(2)}€</Text>
                      )}
                      <Text
                        style={[drawerStyles.finalPrice, isExhausted && drawerStyles.finalPriceExhausted]}
                      >
                        {isExhausted ? t('offerDrawer.exhausted') : `${offer.finalPrice.toFixed(2)}€`}
                      </Text>
                    </View>
                  </TouchableOpacity>
                );
              })}
            </View>
          )}

          {showSectionHeaders && sIdx < sections.length - 1 && (
            <View style={sectionStyles.sectionDivider} />
          )}
        </View>
      ))}
    </>
  );
}
