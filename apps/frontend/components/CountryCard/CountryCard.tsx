/**
 * CountryCard — carte Masonry pour un esim unique OU un groupe de régions
 * fusionnées (ex: "Asie" + "Asie étendue" → une seule carte).
 *
 * Remplace CountryCard.tsx + RegionGroupCard.tsx : les deux affichaient une
 * carte quasi identique (flag/nom/prix/promo) et ouvraient un drawer au tap
 * — seule différence réelle : le badge RegionCountriesButton n'a de sens
 * que sur une carte à eSIM unique (sur un groupe, il apparaît dans le
 * drawer, une fois par section — cf. OffersSections).
 */
import { EsimSummary, getDisplayName } from '@ilotel/shared';
import React from 'react';
import { useTranslation } from 'react-i18next';
import { Text, TouchableOpacity, View } from 'react-native';
import RegionCountriesButton from '../RegionCountryButton/RegionCountryButton';
import { rcbStyles } from '../RegionCountryButton/RegionCountryButton.styles';
import { cardStyles } from './CountryCard.styles';
import OffersDrawerModal from './OffersDrawer/OffersDrawerModal';
import { useOffersDrawer } from './OffersDrawer/useOffersDrawer';

interface CountryCardProps {
  /** 1 élément = eSIM unique (pays/monde) · plusieurs = groupe de régions fusionnées */
  esims: EsimSummary[];
  /** Requis quand esims.length > 1 : sert à résoudre le nom affiché du groupe */
  region?: string;
  accent?: boolean;
}

/** Prix mini parmi les eSIMs du groupe qui ont du stock (undefined/null ignorés) */
function computeGroupMinPrice(esims: EsimSummary[]): number | null {
  const prices = esims
    .filter((e) => e.hasStock && e.minPrice != null)
    .map((e) => e.minPrice as number);
  return prices.length ? Math.min(...prices) : null;
}

function CountryCard({ esims, region, accent = false }: CountryCardProps) {
  const drawer = useOffersDrawer(esims);
  const { t, i18n } = useTranslation();

  const isGroup = esims.length > 1;
  const primary = esims[0];

  const hasStock = isGroup ? esims.some((e) => e.hasStock) : primary.hasStock;
  const hasPromo = isGroup ? esims.some((e) => e.hasPromo) : primary.hasPromo;
  const minPrice = isGroup ? computeGroupMinPrice(esims) : primary.minPrice;
  const name = isGroup && region
    ? getDisplayName(region, i18n.resolvedLanguage)
    : getDisplayName(primary.code, i18n.resolvedLanguage);

  const card = (
    <TouchableOpacity
      style={[
        cardStyles.card,
        accent && cardStyles.cardAccent,
        !hasStock && cardStyles.cardExhausted,
      ]}
      onPress={drawer.openDrawer}
      activeOpacity={0.78}
    >
      {!isGroup && <RegionCountriesButton esim={primary} showLabel />}

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
          ancrer le badge RegionCountriesButton en absolu — inutile pour
          un groupe qui ne l'affiche pas sur la carte */}
      {isGroup ? card : <View style={rcbStyles.wrapper}>{card}</View>}

      <OffersDrawerModal
        esim={primary}
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
 * renderItem (index.tsx) recrée `[item.esim]` à chaque appel — une
 * comparaison shallow par défaut ne bloquerait donc jamais rien. On compare
 * plutôt le contenu réellement affiché par la carte.
 */
function esimsFingerprint(esims: EsimSummary[]): string {
  return esims.map((e) => `${e.id}:${e.hasStock}:${e.minPrice}:${e.hasPromo}`).join('|');
}

export default React.memo(
  CountryCard,
  (prev, next) =>
    prev.region === next.region &&
    prev.accent === next.accent &&
    esimsFingerprint(prev.esims) === esimsFingerprint(next.esims),
);
