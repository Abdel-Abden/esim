/**
 * FeaturedCard — bannière horizontale "Monde entier"
 */
import { EsimSummary, getDisplayName } from '@ilotel/shared';
import React from 'react';
import { useTranslation } from 'react-i18next';
import { Text, TouchableOpacity, View } from 'react-native';
import RegionCountriesButton from '../RegionCountryButton/RegionCountryButton';
import { rcbStyles } from '../RegionCountryButton/RegionCountryButton.styles';
import { featuredStyles as styles } from './FeaturedCard.styles';
import OffersDrawerModal from './OffersDrawer/OffersDrawerModal';
import { useOffersDrawer } from './OffersDrawer/useOffersDrawer';

interface FeaturedCardProps {
  esim: EsimSummary;
}

export default function FeaturedCard({ esim }: FeaturedCardProps) {
  const drawer = useOffersDrawer([esim]);
  const { t, i18n } = useTranslation();

  const regionCountryCount = esim.regionCountries ? Object.keys(esim.regionCountries).length : 0;
  const hasCountries = esim.type !== 'local' && regionCountryCount > 0;

  return (
    <>
      <View style={rcbStyles.wrapper}>
        <TouchableOpacity
          style={[styles.card, !esim.hasStock && styles.exhausted]}
          onPress={drawer.openDrawer}
          activeOpacity={0.78}
        >
          <View style={styles.iconBox}>
            <Text style={styles.iconFlag}>{esim.flag}</Text>
          </View>

          <View style={styles.info}>
            <Text style={styles.name} numberOfLines={1}>
              {getDisplayName(esim.code, i18n.resolvedLanguage)}
            </Text>
            <Text style={styles.desc} numberOfLines={1}>
              {hasCountries
                ? `${regionCountryCount} ${t('home.regionTooltip.title').toLowerCase()}`
                : t('featuredCard.desc')}
            </Text>
            {esim.minPrice != null ? (
              <View style={styles.priceTag}>
                <Text style={styles.priceTagText}>
                  {t('countryCard.from')} {esim.minPrice.toFixed(2)}€
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
        <RegionCountriesButton esim={esim} showLabel={true}/>
      </View>

      <OffersDrawerModal
        esim={esim}
        visible={drawer.drawerOpen}
        sections={drawer.sections}
        onOfferPress={drawer.selectOffer}
        onClose={drawer.closeDrawer}
      />
    </>
  );
}
