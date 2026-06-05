/**
 * FeaturedCard — bannière horizontale pour l'offre recommandée
 */
import { Ionicons } from '@expo/vector-icons';
import { EsimSummary } from '@ilotel/shared';
import React from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import { useTranslation } from 'react-i18next';
import { featuredStyles as s } from './FeaturedCard.styles';
import OfferDrawer from './OfferDrawer';
import { useOfferDrawer } from './useOfferDrawer';

interface FeaturedCardProps {
  esim: EsimSummary;
}

export default function FeaturedCard({ esim }: FeaturedCardProps) {
  const drawer = useOfferDrawer(esim);
  const { t } = useTranslation();

  return (
    <>
      <TouchableOpacity
        style={[s.card, !esim.hasStock && s.exhausted]}
        onPress={drawer.openDrawer}
        activeOpacity={0.78}
      >
        <View style={s.iconBox}>
          <Text style={s.iconFlag}>{esim.flag}</Text>
        </View>

        <View style={s.info}>
          <Text style={s.name} numberOfLines={1}>{esim.name}</Text>
          <Text style={s.desc} numberOfLines={1}>{t('featuredCard.desc')}</Text>
          {esim.minPrice != null ? (
            <View style={s.priceTag}>
              <Text style={s.priceTagText}>{t('countryCard.from')} {esim.minPrice.toFixed(2)}€</Text>
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
