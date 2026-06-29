/**
 * FeaturedCard — bannière horizontale
 * ✅ MODIFIÉ : wrapper rcbStyles.wrapper pour ancrer RegionCountriesButton
 */
import { Ionicons } from '@expo/vector-icons';
import { EsimSummary, getDisplayName } from '@ilotel/shared';
import React from 'react';
import { useTranslation } from 'react-i18next';
import { Text, TouchableOpacity, View } from 'react-native';
import RegionCountriesButton from '../RegionCountryButton/RegionCountryButton';
import { rcbStyles } from '../RegionCountryButton/RegionCountryButton.styles';
import { featuredStyles as s } from './FeaturedCard.styles';
import OfferDrawer from './OfferDrawer';
import { useOfferDrawer } from './useOfferDrawer';

interface FeaturedCardProps {
  esim: EsimSummary;
}

export default function FeaturedCard({ esim }: FeaturedCardProps) {
  const drawer = useOfferDrawer(esim);
  const { t, i18n } = useTranslation();

  const hasCountries =
    (esim.type === 'region' || esim.type === 'custom') &&
    Array.isArray(esim.regionCountries) &&
    esim.regionCountries.length > 0;

  return (
    <>
      <View style={rcbStyles.wrapper}>
        <TouchableOpacity
          style={[s.card, !esim.hasStock && s.exhausted]}
          onPress={drawer.openDrawer}
          activeOpacity={0.78}
        >
          <View style={s.iconBox}>
            <Text style={s.iconFlag}>{esim.flag}</Text>
          </View>

          <View style={s.info}>
            <Text style={s.name} numberOfLines={1}>
              {getDisplayName(esim.code, i18n.resolvedLanguage)}
            </Text>
            <Text style={s.desc} numberOfLines={1}>
              {hasCountries
                ? `${esim.regionCountries!.length} ${t('regionTooltip.title').toLowerCase()}`
                : t('featuredCard.desc')}
            </Text>
            {esim.minPrice != null ? (
              <View style={s.priceTag}>
                <Text style={s.priceTagText}>
                  {t('countryCard.from')} {esim.minPrice.toFixed(2)}€
                </Text>
              </View>
            ) : (
              <View style={s.priceTag}>
                <Text style={s.priceTagText}>{t('countryCard.exhausted')}</Text>
              </View>
            )}
          </View>

          <View style={s.arrowBtn}>
            <Ionicons name="arrow-forward" size={18} color="white" />
          </View>
        </TouchableOpacity>

        {/* Frère du TouchableOpacity → visible sur Android */}
        <RegionCountriesButton esim={esim} />
      </View>

      <OfferDrawer
        esim={esim}
        visible={drawer.drawerOpen}
        offers={drawer.offers}
        loading={drawer.loading}
        loadError={drawer.loadError}
        selectedIdx={drawer.selectedIdx}
        onSelectIdx={drawer.setSelectedIdx}
        onClose={drawer.closeDrawer}
        onOrder={drawer.handleOrder}
      />
    </>
  );
}