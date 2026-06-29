/**
 * CountryCard — carte masonry
 * ✅ MODIFIÉ : wrapper rcbStyles.wrapper pour ancrer RegionCountriesButton
 */
import { EsimSummary, getDisplayName } from '@ilotel/shared';
import React from 'react';
import { useTranslation } from 'react-i18next';
import { Text, TouchableOpacity, View } from 'react-native';
import RegionCountriesButton from '../RegionCountryButton/RegionCountryButton';
import { rcbStyles } from '../RegionCountryButton/RegionCountryButton.styles';
import { cardStyles } from './CountryCard.styles';
import OfferDrawer from './OfferDrawer';
import { useOfferDrawer } from './useOfferDrawer';

interface CountryCardProps {
  esim: EsimSummary;
  accent?: boolean;
}

export default function CountryCard({ esim, accent = false }: CountryCardProps) {
  const drawer = useOfferDrawer(esim);
  const { t, i18n } = useTranslation();

  return (
    <>
      <View style={rcbStyles.wrapper}>
        <TouchableOpacity
          style={[
            cardStyles.card,
            accent && cardStyles.cardAccent,
            !esim.hasStock && cardStyles.cardExhausted,
          ]}
          onPress={drawer.openDrawer}
          activeOpacity={0.78}
        >
          <Text style={cardStyles.flag}>{esim.flag}</Text>
          <Text style={cardStyles.name} numberOfLines={1}>
            {getDisplayName(esim.code, i18n.resolvedLanguage)}
          </Text>

          <View style={cardStyles.footer}>
            <View>
              {esim.minPrice != null ? (
                <>
                  <Text style={cardStyles.from}>{t('countryCard.from')}</Text>
                  <Text style={[cardStyles.price, accent && cardStyles.priceDark]}>
                    {esim.minPrice.toFixed(2)}€
                  </Text>
                </>
              ) : (
                <>
                  <Text style={cardStyles.from}> </Text>
                  <Text style={cardStyles.exhausted}>{t('countryCard.exhausted')}</Text>
                </>
              )}
            </View>
            {esim.hasPromo && (
              <View style={cardStyles.promoBadge}>
                <Text style={cardStyles.promoText}>{t('countryCard.promo')}</Text>
              </View>
            )}
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