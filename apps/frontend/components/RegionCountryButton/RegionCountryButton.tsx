/**
 * RegionCountriesButton
 * ─────────────────────
 * Badge affichant soit le nombre de pays couverts (esims région/monde),
 * soit le nombre d'opérateurs disponibles (esims pays), remplaçant
 * l'ancien "ⓘ". Au tap, ouvre un tableau détaillant, pour chaque
 * pays et chaque opérateur, la disponibilité des réseaux 3G / 4G / 5G.
 *
 * Modèle de données (@ilotel/shared → EsimSummary) :
 *   regionCountries: Record<codeISO, Record<nomOperateur, {
 *     '3G': boolean; '4G': boolean; '5G': boolean;
 *   }>>
 *
 * Deux modes d'affichage, selon `esim.type` :
 *   - "country"            → un seul pays dans regionCountries. Le tableau
 *                             liste directement les opérateurs (pas de
 *                             regroupement par pays, ce serait redondant).
 *   - "region" / "global"  → plusieurs pays. Le tableau groupe les
 *                             opérateurs sous un en-tête par pays.
 *
 * ⚠️  Android : zIndex inside TouchableOpacity est ignoré.
 * Solution : le bouton ET la card sont frères dans un View wrapper,
 * le bouton est en absolu sur ce wrapper (pas dans le TouchableOpacity).
 *
 * Pattern d'usage "flottant" dans CountryCard / FeaturedCard :
 *
 *   <View style={rcbStyles.wrapper}>
 *     <TouchableOpacity onPress={...}>...</TouchableOpacity>
 *     <RegionCountriesButton esim={esim} />
 *   </View>
 *
 * Pattern d'usage "en ligne" (ex: en-tête de section dans GroupOfferDrawer) :
 *
 *   <RegionCountriesButton esim={esim} inline showLabel />
 */
import { Ionicons } from '@expo/vector-icons';
import { Colors, CountryNetworkInfo, EsimSummary, getDisplayName } from '@ilotel/shared';
import React, { useEffect, useRef, useState } from 'react';
import { useTranslation } from 'react-i18next';
import {
  ActivityIndicator,
  Animated,
  Dimensions,
  FlatList,
  InteractionManager,
  Modal,
  Text,
  TouchableOpacity,
  View
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { btnStyles, sheetStyles } from './RegionCountryButton.styles';

interface Props {
  esim: EsimSummary;
  /** true = affichage en ligne (dans un en-tête de section), false = badge flottant sur une carte */
  inline?: boolean;
  /** affiche un libellé à côté du nombre — utile en mode inline */
  showLabel?: boolean;
}

type TableRow =
  | { kind: 'countryHeader'; label: string }
  | { kind: 'operatorRow'; operator: string; networks: CountryNetworkInfo; indented: boolean };

/** Construit les lignes du tableau, groupées par pays uniquement en mode multi-pays */
function buildRows(
  countries: Record<string, Record<string, CountryNetworkInfo>>,
  isCountryEsim: boolean,
  lang?: string,
): TableRow[] {
  const codes = [...Object.keys(countries)].sort((a, b) =>
    getDisplayName(a, lang).localeCompare(getDisplayName(b, lang))
  );

  const rows: TableRow[] = [];
  for (const code of codes) {
    const operators = countries[code] ?? {};
    const operatorNames = [...Object.keys(operators)].sort((a, b) => a.localeCompare(b));

    if (!isCountryEsim) {
      rows.push({ kind: 'countryHeader', label: getDisplayName(code, lang) });
    }
    for (const operator of operatorNames) {
      rows.push({ kind: 'operatorRow', operator, networks: operators[operator], indented: !isCountryEsim });
    }
  }
  return rows;
}

function RegionCountriesButton({ esim, inline = false, showLabel = false }: Props) {
  const { t, i18n } = useTranslation();
  const [open, setOpen] = useState(false);

  const isCountryEsim = esim.type === 'local';
  const regionCountriesData = esim.regionCountries;
  const countryCodes = regionCountriesData ? Object.keys(regionCountriesData) : [];

  const SHEET_HEIGHT = Dimensions.get('window').height;
  const backdropOpacity = useRef(new Animated.Value(0)).current;
  const sheetTranslateY = useRef(new Animated.Value(SHEET_HEIGHT)).current;

  useEffect(() => {
    if (open) {
      backdropOpacity.setValue(0);
      sheetTranslateY.setValue(SHEET_HEIGHT);
      Animated.timing(backdropOpacity, { toValue: 1, duration: 180, useNativeDriver: true }).start();
      Animated.spring(sheetTranslateY, { toValue: 0, damping: 28, stiffness: 280, mass: 0.8, useNativeDriver: true }).start();
    } else {
      Animated.parallel([
        Animated.timing(backdropOpacity, { toValue: 0, duration: 220, useNativeDriver: true }),
        Animated.timing(sheetTranslateY, { toValue: SHEET_HEIGHT, duration: 220, useNativeDriver: true }),
      ]).start();
    }
  }, [open]);

  // Ne construit le tableau (tri + getDisplayName sur potentiellement des
  // centaines de pays/opérateurs) qu'une fois la modal déjà affichée à
  // l'écran (InteractionManager.runAfterInteractions), pour que le tap
  // se traduise par une ouverture instantanée + un spinner, plutôt que
  // par un blocage avant même que la sheet n'apparaisse.
  const [rows, setRows] = useState<TableRow[]>([]);
  const [rowsLoading, setRowsLoading] = useState(false);

  useEffect(() => {
    if (!open || !regionCountriesData) {
      setRows([]);
      return;
    }
    setRowsLoading(true);
    const task = InteractionManager.runAfterInteractions(() => {
      setRows(buildRows(regionCountriesData, isCountryEsim, i18n.resolvedLanguage));
      setRowsLoading(false);
    });
    return () => task.cancel();
  }, [open, regionCountriesData, isCountryEsim, i18n.resolvedLanguage]);

  if (countryCodes.length === 0) return null;

  // Badge : nb de pays (région/monde) ou nb d'opérateurs (pays unique)
  const badgeCount = isCountryEsim
    ? Object.keys(regionCountriesData?.[countryCodes[0]] ?? {}).length
    : countryCodes.length;

  if (badgeCount === 0) return null;

  const regionLabel = getDisplayName(esim.code, i18n.resolvedLanguage);

  const unitLabel = isCountryEsim
    ? t('home.regionTooltip.network')
    : t('home.regionTooltip.country');

  const headerCellLabel = isCountryEsim
    ? t('home.regionTooltip.network')
    : t('home.regionTooltip.country');

  return (
    <>
      <TouchableOpacity
        style={[btnStyles.btn, inline && btnStyles.btnInline]}
        onPress={() => setOpen(true)}
        activeOpacity={0.7}
        hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
      >
        <Text style={[btnStyles.label, inline && btnStyles.labelInline]}>
          {badgeCount}
        </Text>
        {showLabel && (
          <Text style={btnStyles.labelSuffix}>{unitLabel}</Text>
        )}
      </TouchableOpacity>

      {/* Bottom sheet — tableau des pays / opérateurs et réseaux disponibles */}
      <Modal
        visible={open}
        transparent
        animationType="none"
        onRequestClose={() => setOpen(false)}
      >
        <SafeAreaView style={{ flex: 1 }} edges={["top", "bottom"]}>

          <Animated.View style={[sheetStyles.backdrop, { opacity: backdropOpacity }]}>
            <Animated.View style={[sheetStyles.sheet, { transform: [{ translateY: sheetTranslateY }] }]}>
              {/* View simple — ne capte pas les touch, les laisse passer au ScrollView */}

              <View style={sheetStyles.header}>
                <View style={sheetStyles.headerLeft}>
                  <Text style={sheetStyles.flag}>{esim.flag}</Text>
                  <View>
                    <Text style={sheetStyles.title}>{regionLabel}</Text>
                    <Text style={sheetStyles.subtitle}>
                      {badgeCount} {unitLabel.toLowerCase()}
                    </Text>
                  </View>
                </View>
                <TouchableOpacity
                  style={sheetStyles.closeBtn}
                  onPress={() => setOpen(false)}
                >
                  <Text style={sheetStyles.closeTxt}>✕</Text>
                </TouchableOpacity>
              </View>

              <View style={sheetStyles.divider} />

              <View style={sheetStyles.list}>
                <View style={sheetStyles.tableHeader}>
                  <Text style={[sheetStyles.headerCell, sheetStyles.headerCountryCell]}>
                    {headerCellLabel}
                  </Text>
                  <Text style={sheetStyles.headerCell}>3G</Text>
                  <Text style={sheetStyles.headerCell}>4G</Text>
                  <Text style={sheetStyles.headerCell}>5G</Text>
                </View>
              </View>

              {rowsLoading ? (
                <ActivityIndicator
                  size="large"
                  color={Colors.primary}
                  style={sheetStyles.loadingIndicator}
                />
              ) : (
                <FlatList
                  style={sheetStyles.list}
                  contentContainerStyle={sheetStyles.listContent}
                  showsVerticalScrollIndicator={false}
                  data={rows}
                  keyExtractor={(row, idx) =>
                    row.kind === 'countryHeader' ? `country-${row.label}-${idx}` : `op-${row.operator}-${idx}`
                  }
                  initialNumToRender={16}
                  windowSize={7}
                  removeClippedSubviews
                  renderItem={({ item: row }) => {
                    if (row.kind === 'countryHeader') {
                      return (
                        <View style={sheetStyles.countryHeaderRow}>
                          <Text style={sheetStyles.countryHeaderText}>{row.label}</Text>
                        </View>
                      );
                    }
                    return (
                      <View style={[sheetStyles.row, row.indented && sheetStyles.rowIndented]}>
                        <Text
                          style={[sheetStyles.countryName, row.indented && sheetStyles.operatorNameIndented]}
                          numberOfLines={1}
                        >
                          {row.operator}
                        </Text>
                        {(['3G', '4G', '5G'] as const).map((gen) => (
                          <View key={gen} style={sheetStyles.checkCell}>
                            {row.networks?.[gen] ? (
                              <Ionicons name="checkmark" size={16} color="#2E9E5B" />
                            ) : (
                              <View style={sheetStyles.checkDash} />
                            )}
                          </View>
                        ))}
                      </View>
                    );
                  }}
                />
              )}
            </Animated.View>
          </Animated.View>
        </SafeAreaView>
      </Modal>
    </>
  );
}

// Beaucoup d'instances de ce composant peuvent coexister (une par section
// dans GroupOfferDrawer / WorldOffersSection) — memo évite de les re-render
// toutes à chaque fois que le parent change d'état pour une autre raison
// (ex: chargement des offres d'une autre section).
export default React.memo(RegionCountriesButton);