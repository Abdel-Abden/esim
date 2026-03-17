/**
 * CountryCard — carte masonry (grille principale)
 *
 * Refactorisé : délègue la logique à useOfferDrawer
 * et le rendu du drawer à OfferDrawer.
 */
import { EsimSummary } from '@ilotel/shared';
import React from 'react';
import { Text, TouchableOpacity, View } from 'react-native';
import { cardStyles } from './CountryCard.styles';
import OfferDrawer from './OfferDrawer';
import { useOfferDrawer } from './useOfferDrawer';

interface CountryCardProps {
  esim: EsimSummary;
  accent?: boolean;
}

export default function CountryCard({ esim, accent = false }: CountryCardProps) {
  const drawer = useOfferDrawer(esim);

  return (
    <>
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
        <Text style={cardStyles.name} numberOfLines={1}>{esim.name}</Text>

        <View style={cardStyles.footer}>
          <View>
            {esim.minPrice != null ? (
              <>
                <Text style={cardStyles.from}>dès</Text>
                <Text style={[cardStyles.price, accent && cardStyles.priceDark]}>
                  {esim.minPrice.toFixed(2)}€
                </Text>
              </>
            ) : (
              <>
                <Text style={cardStyles.from}> </Text>
                <Text style={cardStyles.exhausted}>Épuisé</Text>
              </>
            )}
          </View>
          {esim.hasPromo && (
            <View style={cardStyles.promoBadge}>
              <Text style={cardStyles.promoText}>Promo</Text>
            </View>
          )}
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
