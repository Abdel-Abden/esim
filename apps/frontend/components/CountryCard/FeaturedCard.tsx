/**
 * FeaturedCard — bannière horizontale pour l'offre recommandée
 *
 * Layout : [icône flag] [nom · description · prix] [→]
 * Correspond exactement au bloc ".fz-card" de la démo demoD.
 *
 * Partage useOfferDrawer et OfferDrawer avec CountryCard
 * sans dupliquer la logique métier.
 */
import { Ionicons } from '@expo/vector-icons';
import { EsimSummary } from '@ilotel/shared';
import React from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import { featuredStyles as s } from './FeaturedCard.styles';
import OfferDrawer from './OfferDrawer';
import { useOfferDrawer } from './useOfferDrawer';

interface FeaturedCardProps {
  esim: EsimSummary;
}

export default function FeaturedCard({ esim }: FeaturedCardProps) {
  const drawer = useOfferDrawer(esim);

  return (
    <>
      <TouchableOpacity
        style={[s.card, !esim.hasStock && s.exhausted]}
        onPress={drawer.openDrawer}
        activeOpacity={0.78}
      >
        {/* Icône flag */}
        <View style={s.iconBox}>
          <Text style={s.iconFlag}>{esim.flag}</Text>
        </View>

        {/* Infos */}
        <View style={s.info}>
          <Text style={s.name} numberOfLines={1}>{esim.name}</Text>
          <Text style={s.desc} numberOfLines={1}>
            190+ pays · 4G/5G partout
          </Text>
          {esim.minPrice != null ? (
            <View style={s.priceTag}>
              <Text style={s.priceTagText}>dès {esim.minPrice.toFixed(2)}€</Text>
            </View>
          ) : (
            <View style={s.priceTag}>
              <Text style={s.priceTagText}>Épuisé</Text>
            </View>
          )}
        </View>

        {/* Bouton flèche */}
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
