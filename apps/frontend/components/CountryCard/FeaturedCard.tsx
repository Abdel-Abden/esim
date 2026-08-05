/**
 * FeaturedCard — bannière horizontale "Monde entier"
 */
import { Destination, getDisplayName } from '@ilotel/shared';
import React from 'react';
import { useTranslation } from 'react-i18next';
import { Text, TouchableOpacity, View } from 'react-native';
import CountryCoverageModal from '../CountryCoverageModal/CountryCoverageModal';
import { rcbStyles } from '../CountryCoverageModal/CountryCoverageModal.styles';
import { featuredStyles as styles } from './FeaturedCard.styles';
import OffersDrawerModal from './OffersDrawer/OffersDrawerModal';
import { useOffersDrawer } from './OffersDrawer/useOffersDrawer';

interface FeaturedCardProps {
  destination: Destination;
}

export default function FeaturedCard({ destination }: FeaturedCardProps) {
  const drawer = useOffersDrawer([destination]);
  const { t, i18n } = useTranslation();

  const regionCountryCount = destination.coverage ? Object.keys(destination.coverage).length : 0;
  const hasCountries = destination.type !== 'local' && regionCountryCount > 0;

  return (
    <>
      <View style={rcbStyles.wrapper}>
        <TouchableOpacity
          style={[styles.card]}
          onPress={drawer.openDrawer}
          activeOpacity={0.78}
        >
          <View style={styles.iconBox}>
            <Text style={styles.iconFlag}>{destination.flag}</Text>
          </View>

          <View style={styles.info}>
            <Text style={styles.name} numberOfLines={1}>
              {getDisplayName(destination.code, i18n.resolvedLanguage)}
            </Text>
            <Text style={styles.desc} numberOfLines={1}>
              {hasCountries
                ? `${regionCountryCount} ${t('home.regionTooltip.title').toLowerCase()}`
                : t('featuredCard.desc')}
            </Text>
            {destination.minPrice != null ? (
              <View style={styles.priceTag}>
                <Text style={styles.priceTagText}>
                  {t('countryCard.from')} {destination.minPrice.toFixed(2)}€
                </Text>
              </View>
            ) : (
              <View style={styles.priceTag}>
                <Text style={styles.priceTagText}>{t('countryCard.exhausted')}</Text>
              </View>
            )}
          </View>
        </TouchableOpacity>

        {/* Frère du TouchableOpacity → visible sur Android */}
        <CountryCoverageModal destinations={destination} showLabel={true}/>
      </View>

      <OffersDrawerModal
        destination={destination}
        visible={drawer.drawerOpen}
        sections={drawer.sections}
        onOfferPress={drawer.selectOffer}
        onClose={drawer.closeDrawer}
      />
    </>
  );
}
