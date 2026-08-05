/**
 * OffersSections — rendu pur d'une liste d'offres, groupées par destinations.
 *
 * Composant purement présentationnel : ni Modal, ni fetch, ni navigation.
 * - 1 seule section → pas d'en-tête de section (juste le libellé générique
 *   "Forfaits disponibles"), comme l'ancien OfferDrawer.
 * - Plusieurs sections → un en-tête par destinations (flag + nom + nombre de pays),
 *   comme l'ancien GroupOfferDrawer/WorldOffersSection.
 *
 * Utilisé à la fois dans OffersDrawerModal (bottom sheet) et
 * WorldOffersSection (affichage inline sur l'onglet Monde).
 */
import { apiError } from '@/i18n/i18n';
import { Colors, ErrorCode, getDisplayName } from '@ilotel/shared';
import React from 'react';
import { useTranslation } from 'react-i18next';
import { ActivityIndicator, Text, TouchableOpacity, View } from 'react-native';
import CountryCoverageModal from '../../CountryCoverageModal/CountryCoverageModal';
import { drawerStyles, sectionStyles } from './OffersDrawer.styles';
import { OfferSection } from './useOffersDrawer';

interface OffersSectionsProps {
  sections: OfferSection[];
  onOfferPress: (destinationsId: string, offerIdx: number) => void;
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
        <View key={section.destinations.id}>
          {showSectionHeaders && (
            <View style={sectionStyles.sectionHeader}>
              <Text style={sectionStyles.sectionFlag}>{section.destinations.flag}</Text>
              <Text style={sectionStyles.sectionName} numberOfLines={1}>
                {getDisplayName(section.destinations.code, i18n.resolvedLanguage)}
              </Text>
              <CountryCoverageModal destinations={section.destinations} inline showLabel />
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
              {apiError(section.loadError, ErrorCode.OFFER_NOT_FOUND)}
            </Text>
          ) : (
            <View style={sectionStyles.offersWrap}>
              {section.offers.map((offer, i) => {
                const isPromo = offer.discount && offer.discount.value !== null;
                return (
                  <TouchableOpacity
                    key={offer.id}
                    style={[drawerStyles.offerCard]}
                    onPress={() => onOfferPress(section.destinations.id, i)}
                    activeOpacity={0.75}
                  >
                    <View style={drawerStyles.offerLeft}>
                      <Text style={drawerStyles.offerData}>
                        {offer.dataQuantity} {getDataUnitDisplay(offer.dataUnit, t)}
                      </Text>
                      <Text style={drawerStyles.offerDays}>
                        {offer.durationQuantity} {t(`offerDrawer.${offer.durationUnit}`)}
                      </Text>
                    </View>
                    <View style={drawerStyles.offerRight}>
                      {isPromo && (
                        <View style={drawerStyles.promoBadge}>
                          <Text style={drawerStyles.promoBadgeText}>
                            {t('countryCard.promo').toUpperCase()}
                          </Text>
                        </View>
                      )}
                      {isPromo && (
                        <Text style={drawerStyles.oldPrice}>{offer.basePrice.toFixed(2)}€</Text>
                      )}
                      <Text
                        style={[drawerStyles.finalPrice]}
                      >
                        {`${offer.finalPrice.toFixed(2)}€`}
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
