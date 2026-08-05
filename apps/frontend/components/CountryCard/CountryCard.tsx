/**
 * CountryCard — carte Masonry pour un destination unique OU un groupe de régions
 * fusionnées (ex: "Asie" + "Asie étendue" → une seule carte).
 *
 * Remplace CountryCard.tsx + RegionGroupCard.tsx : les deux affichaient une
 * carte quasi identique (flag/nom/prix/promo) et ouvraient un drawer au tap
 * — seule différence réelle : le badge CountryCoverageModal n'a de sens
 * que sur une carte à destination unique (sur un groupe, il apparaît dans le
 * drawer, une fois par section — cf. OffersSections).
 */
import { Destination, getDisplayName } from '@ilotel/shared';
import React from 'react';
import { useTranslation } from 'react-i18next';
import { Text, TouchableOpacity, View } from 'react-native';
import CountryCoverageModal from '../CountryCoverageModal/CountryCoverageModal';
import { rcbStyles } from '../CountryCoverageModal/CountryCoverageModal.styles';
import { cardStyles } from './CountryCard.styles';
import OffersDrawerModal from './OffersDrawer/OffersDrawerModal';
import { useOffersDrawer } from './OffersDrawer/useOffersDrawer';

interface CountryCardProps {
  /** 1 élément = destination unique (pays/monde) · plusieurs = groupe de régions fusionnées */
  destinations: Destination[];
  /** Requis quand destinations.length > 1 : sert à résoudre le nom affiché du groupe */
  region?: string;
  accent?: boolean;
}

/** Prix mini parmi les destinations du groupe qui ont du stock (undefined/null ignorés) */
function computeGroupMinPrice(destinations: Destination[]): number | null {
  const prices = destinations
    .filter((e) => e.minPrice != null)
    .map((e) => e.minPrice as number);
  return prices.length ? Math.min(...prices) : null;
}

function CountryCard({ destinations, region, accent = false }: CountryCardProps) {
  const drawer = useOffersDrawer(destinations);
  const { t, i18n } = useTranslation();

  const isGroup = destinations.length > 1;
  const primary = destinations[0];

  const hasPromo = isGroup ? destinations.some((e) => e.hasPromo) : primary.hasPromo;
  const minPrice = isGroup ? computeGroupMinPrice(destinations) : primary.minPrice;
  const name = isGroup && region
    ? getDisplayName(region, i18n.resolvedLanguage)
    : getDisplayName(primary.code, i18n.resolvedLanguage);

  const card = (
    <TouchableOpacity
      style={[
        cardStyles.card,
        accent && cardStyles.cardAccent,
      ]}
      onPress={drawer.openDrawer}
      activeOpacity={0.78}
    >
      {!isGroup && <CountryCoverageModal destinations={primary} showLabel />}

      <Text style={cardStyles.flag}>{primary.flag}</Text>
      <Text style={cardStyles.name} numberOfLines={1}>
        {name}
      </Text>

      <View style={cardStyles.footer}>
        <View>
          {minPrice != null ? (
            <>
              <Text style={cardStyles.from}>{t('countryCard.from')}</Text>
              <Text style={[cardStyles.price, accent && cardStyles.priceDark]}>
                {minPrice.toFixed(2)}€
              </Text>
            </>
          ) : (
            <>
              <Text style={cardStyles.from}> </Text>
              <Text style={cardStyles.exhausted}>{t('countryCard.exhausted')}</Text>
            </>
          )}
        </View>
        {hasPromo && (
          <View style={cardStyles.promoBadge}>
            <Text style={cardStyles.promoText}>{t('countryCard.promo')}</Text>
          </View>
        )}
      </View>
    </TouchableOpacity>
  );

  return (
    <>
      {/* rcbStyles.wrapper (position:relative) n'est nécessaire que pour
          ancrer le badge CountryCoverageModal en absolu — inutile pour
          un groupe qui ne l'affiche pas sur la carte */}
      {isGroup ? card : <View style={rcbStyles.wrapper}>{card}</View>}

      <OffersDrawerModal
        destination={primary}
        title={isGroup ? name : undefined}
        visible={drawer.drawerOpen}
        sections={drawer.sections}
        onOfferPress={drawer.selectOffer}
        onClose={drawer.closeDrawer}
      />
    </>
  );
}

/**
 * renderItem (index.tsx) recrée `[item.destination]` à chaque appel — une
 * comparaison shallow par défaut ne bloquerait donc jamais rien. On compare
 * plutôt le contenu réellement affiché par la carte.
 */
function destinationsFingerprint(destinations: Destination[]): string {
  return destinations.map((e) => `${e.id}:${e.minPrice}:${e.hasPromo}`).join('|');
}

export default React.memo(
  CountryCard,
  (prev, next) =>
    prev.region === next.region &&
    prev.accent === next.accent &&
    destinationsFingerprint(prev.destinations) === destinationsFingerprint(next.destinations),
);
