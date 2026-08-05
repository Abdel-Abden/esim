import AsyncStorage from '@react-native-async-storage/async-storage';
import { LinearGradient } from 'expo-linear-gradient';
import { useRouter } from 'expo-router';
import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import { useTranslation } from 'react-i18next';
import {
  ActivityIndicator,
  AppState, AppStateStatus,
  FlatList,
  Image,
  Keyboard,
  LayoutChangeEvent,
  StatusBar,
  Text, TouchableOpacity, View,
} from 'react-native';
import Svg, { Path } from 'react-native-svg';

import CountryCard from '@/components/CountryCard/CountryCard';
import FeaturedCarousel from '@/components/CountryCard/Featuredcarousel.styles';
import WorldOffersSection from '@/components/CountryCard/OffersDrawer/WorldOffersSection';
import DebugPanel from '@/components/DebugPanel/DebugPanel';
import PrimaryButton from '@/components/PrimaryButton/PrimaryButton';
import SearchBar from '@/components/SearchBar/SearchBar';
import { SkeletonList } from '@/components/SkeletonCard/SkeletonCard';
import TutorialModal from '@/components/TutorialModal/TutorialModal';
import i18n, { apiError } from '@/i18n/i18n';
import { fetchDestinations } from '@/service/destination';
import { Colors, Destination, DestinationType, getDisplayName } from '@ilotel/shared';
import { styles } from './index.styles';

const MIN_RELOAD_MS = 30_000;
const TUTORIAL_DONE_KEY = '@ilotel_tutorial_done';

/**
 * Élément affiché dans la grille : soit un destination seul (pays/monde), soit un
 * groupe d'destinations "région" partageant le même champ `region` (ex: "Asie" +
 * "Asie étendue" → une seule carte). N'est utilisé que par cet écran, donc
 * défini ici plutôt que dans un fichier séparé.
 */
type DisplayItem =
  | { kind: 'single'; destination: Destination }
  | { kind: 'group'; region: string; members: Destination[] };

/** Regroupe les destinations "region" partageant le même champ `region` en une seule entrée d'affichage */
function buildDisplayItems(destinations: Destination[]): DisplayItem[] {
  const groupOrder: string[] = [];
  const groups = new Map<string, Destination[]>();
  const items: DisplayItem[] = [];

  for (const destination of destinations) {
    if (destination.type === 'region') {
      const key = destination.region ?? destination.code;
      if (!groups.has(key)) {
        groups.set(key, []);
        groupOrder.push(key);
      }
      groups.get(key)!.push(destination);
    } else {
      items.push({ kind: 'single', destination });
    }
  }

  for (const key of groupOrder) {
    const members = groups.get(key)!;
    items.push(members.length === 1 ? { kind: 'single', destination: members[0] } : { kind: 'group', region: key, members });
  }

  return items;
}

function fallbackRegionLabel(region: string): string {
  return region
    .split(/[-_ ]+/)
    .filter(Boolean)
    .map((w) => w.charAt(0).toUpperCase() + w.slice(1))
    .join(' ');
}

/** Nom affiché pour un item (destination seul ou groupe) — sert au tri et à la recherche */
function getItemDisplayName(item: DisplayItem, t: (key: string, opts?: any) => string, lang?: string): string {
  if (item.kind === 'single') return getDisplayName(item.destination.code, lang);
  return t(`home.regionGroups.${item.region}`, { defaultValue: fallbackRegionLabel(item.region) });
}

function itemMatchesSearch(
  item: DisplayItem,
  query: string,
  t: (key: string, opts?: any) => string,
  lang?: string,
): boolean {
  const q = query.toLowerCase();
  if (item.kind === 'single') {
    return getDisplayName(item.destination.code, lang).toLowerCase().includes(q);
  }
  if (getItemDisplayName(item, t, lang).toLowerCase().includes(q)) return true;
  return item.members.some((m) => getDisplayName(m.code, lang).toLowerCase().includes(q));
}

export default function HomeScreen() {
  const router = useRouter();
  const { t } = useTranslation();

  const [destinations, setEsims] = useState<Destination[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const [activeFilter, setActiveFilter] = useState<DestinationType>(DestinationType.LOCAL);
  // true entre le tap sur un filtre et le moment où la nouvelle grille a
  // fini de se (re)monter — sert uniquement à afficher un spinner pendant
  // ce court instant, pour que l'utilisateur voie que ça travaille au lieu
  // d'un écran figé.
  const [filterLoading, setFilterLoading] = useState(false);
  const lastLoadRef = useRef(0);

  const flatListRef = useRef<FlatList<DisplayItem>>(null);
  const segmentOffsetRef = useRef(0);

  const handleSegmentLayout = useCallback((e: LayoutChangeEvent) => {
    segmentOffsetRef.current = e.nativeEvent.layout.y;
  }, []);

  useEffect(() => {
    const sub = Keyboard.addListener('keyboardDidShow', () => {
      flatListRef.current?.scrollToOffset({
        offset: segmentOffsetRef.current,
        animated: true,
      });
    });
    return () => sub.remove();
  }, []);

  /* ── Tutoriel ── */
  const [tutorialVisible, setTutorialVisible] = useState(false);

  useEffect(() => {
    (async () => {
      try {
        const done = await AsyncStorage.getItem(TUTORIAL_DONE_KEY);
        if (done === null) {
          setTimeout(() => setTutorialVisible(true), 600);
        }
      } catch (_) {}
    })();
  }, []);

  const handleCloseTutorial = useCallback(async () => {
    setTutorialVisible(false);
    try {
      await AsyncStorage.setItem(TUTORIAL_DONE_KEY, '1');
    } catch (_) {}
  }, []);

  /* ── Données ── */
  const load = useCallback(async (force = false) => {
    const now = Date.now();
    if (!force && now - lastLoadRef.current < MIN_RELOAD_MS) return;
    lastLoadRef.current = now;
    setLoading(true);
    setError(null);

    const { data, errorCode } = await fetchDestinations();
    if (errorCode || !data) {
      console.debug(errorCode);
      setError(apiError(errorCode, 'home.error.retry'));
      setLoading(false);
      return;
    }

    setEsims(data);
    setLoading(false);
  }, [t]);

  useEffect(() => { load(true); }, []);
  useEffect(() => {
    const sub = AppState.addEventListener('change', (s: AppStateStatus) => {
      if (s === 'active') load();
    });
    return () => sub.remove();
  }, [load]);

  // Tap sur un filtre : on affiche le spinner tout de suite, puis on
  // laisse une frame s'écouler (le temps qu'il se peigne réellement)
  // avant de déclencher le changement de filtre — qui, lui, provoque
  // le (re)montage lourd de la grille.
  const handleFilterPress = useCallback((key: DestinationType) => {
    if (key === activeFilter) return;
    setFilterLoading(true);
    requestAnimationFrame(() => {
      setActiveFilter(key);
    });
  }, [activeFilter]);

  // destinations "à la une" affichées dans le carrousel du haut
  const featuredEsims = useMemo(() => destinations.filter((e) => e.featured), [destinations]);

  // destinations "monde" : affichées directement (pas de sélection de carte, cf. WorldOffersSection)
  const worldEsims = useMemo(() => destinations.filter((e) => e.type === 'global'), [destinations]);

  const filteredEsims: DisplayItem[] = useMemo(() => {
    if (activeFilter === 'global') return []; // géré par WorldOffersSection

    let list = destinations;

    if (activeFilter === 'region') {
      // Filtre promos
      list = list.filter((e) => e.type == 'region');
    } else if (activeFilter === 'local') {
      list = list.filter((e) => e.type === 'local');
    }

    // Regroupe les destinations "region" partageant le même champ `region`
    // en une seule carte (cf. buildDisplayItems ci-dessus)
    let items = buildDisplayItems(list);

    if (search.trim()) {
      items = items.filter((item) =>
        itemMatchesSearch(item, search, t, i18n.resolvedLanguage)
      );
    }

    return [...items].sort((a, b) => {
      return getItemDisplayName(a, t, i18n.resolvedLanguage).localeCompare(
        getItemDisplayName(b, t, i18n.resolvedLanguage)
      );
    });
  }, [search, destinations, activeFilter, t, i18n.resolvedLanguage]);

  // Données réellement passées à la FlatList : liste vide si loading ou onglet
  // "monde" (ces deux cas sont gérés à part, cf. ListHeaderComponent plus bas)
  const listData = loading || filterLoading || activeFilter === 'global' ? [] : filteredEsims;

  // Le calcul lourd (filteredEsims / FlatList) vient de se terminer pour ce
  // filtre — on attend encore une frame avant de retirer le spinner, pour
  // laisser le temps au rendu de réellement s'afficher à l'écran.
  useEffect(() => {
    if (!filterLoading) return;
    const id = requestAnimationFrame(() => setFilterLoading(false));
    return () => cancelAnimationFrame(id);
  }, [activeFilter, filteredEsims, worldEsims]);

  const keyExtractor = useCallback(
    (item: DisplayItem) => (item.kind === 'single' ? item.destination.id : `group-${item.region}`),
    []
  );

  const renderItem = useCallback(
    ({ item }: { item: DisplayItem }) => (
      <View style={styles.masonryItem}>
        {item.kind === 'single' ? (
          <CountryCard destinations={[item.destination]} />
        ) : (
          <CountryCard destinations={item.members} region={item.region} />
        )}
      </View>
    ),
    []
  );

  if (error) {
    return (
      <View style={styles.errorContainer}>
        <Text style={styles.errorText}>{error}</Text>
        <PrimaryButton label={t('home.error.retry')} onPress={() => load(true)} />
      </View>
    );
  }

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <View style={styles.root}>

        {/* ── Topbar ─────────────────────────────────────────────────── */}
        <View style={styles.topbar}>
          <View style={styles.logoArea}>
            <View style={styles.logoBadgeWrap}>
              <Image
                source={require('@/assets/images/logo_left_writing.png')}
                style={styles.logoBadge}
                resizeMode="contain"
              />
            </View>
          </View>
          <View style={{ flexDirection: 'row', alignItems: 'center', gap: 8 }}>
            <TouchableOpacity
              onPress={() => setTutorialVisible(true)}
              activeOpacity={0.75}
              style={styles.helpBtn}
            >
              <Text style={styles.helpBtnText}>?</Text>
            </TouchableOpacity>
          </View>
        </View>

        <FlatList
          ref={flatListRef}
          style={styles.scroll}
          contentContainerStyle={styles.content}
          keyboardShouldPersistTaps="handled"
          showsVerticalScrollIndicator={false}
          data={listData}
          numColumns={2}
          keyExtractor={keyExtractor}
          renderItem={renderItem}
          columnWrapperStyle={styles.masonryRow}
          initialNumToRender={10}
          maxToRenderPerBatch={10}
          windowSize={9}
          removeClippedSubviews
          ListHeaderComponent={
            <>
              {/* ── Hero wave ─────────────────────────────────────────────── */}
              <LinearGradient
                colors={[Colors.primary, Colors.primaryMid, '#C8813A']}
                start={{ x: 0.1, y: 0 }}
                end={{ x: 0.9, y: 1 }}
                style={styles.hero}
              >
                <View style={styles.heroBgCircle} />
                <Text style={styles.heroKicker}>{t('home.hero.kicker')}</Text>
                <Text style={styles.heroTitle}>
                  {t('home.hero.title')},{'\n'}
                  <Text style={styles.heroTitleItalic}>{t('home.hero.italic')}</Text>
                </Text>
                <Text style={styles.heroBody}>{t('home.hero.body')}</Text>
                <View style={styles.heroPills}>
                  <View style={styles.heroPill}><Text style={styles.heroPillText}>{t('home.hero.pills.countries')}</Text></View>
                  <View style={styles.heroPill}><Text style={styles.heroPillText}>{t('home.hero.pills.speed')}</Text></View>
                  <View style={styles.heroPill}><Text style={styles.heroPillText}>{t('home.hero.pills.security')}</Text></View>
                </View>
                <Svg
                  width="120%"
                  height={30}
                  viewBox="0 0 430 30"
                  preserveAspectRatio="none"
                  style={{ position: 'absolute', bottom: -1, left: 0, right: 0 }}
                >
                  <Path d="M0 30 Q107 0 215 20 Q323 40 430 10 L430 30 Z" fill={Colors.bg} />
                </Svg>
              </LinearGradient>

              {/* ── Featured "Monde entier" ───────────────────────────────── */}
              {!loading && featuredEsims.length > 0 && activeFilter !== 'global' && (
                <View style={styles.featuredZone}>
                  <Text style={styles.featLabel}>{t('home.featured.label')}</Text>
                  <FeaturedCarousel destinations={featuredEsims} />
                </View>
              )}

              {/* ── Segmented filter ─────────────────────────────────────── */}
              <View style={styles.segmentWrap} onLayout={handleSegmentLayout}>
                <View style={styles.segmentContent}>
                  {Object.values(DestinationType).map((type) => (
                    <TouchableOpacity
                      key={type}
                      style={[styles.segBtn, activeFilter === type && styles.segBtnActive]}
                      onPress={() => handleFilterPress(type)}
                      activeOpacity={0.8}
                    >
                      <Text style={[styles.segBtnText, activeFilter === type && styles.segBtnTextActive]}>
                        {t(`home.filters.${type}`)}
                      </Text>
                    </TouchableOpacity>
                  ))}
                </View>
              </View>

              {/* ── Search ───────────────────────────────────────────────── */}
              {!loading && activeFilter !== 'global' && (
                <View style={styles.searchZone}>
                  <SearchBar
                    value={search}
                    onChangeText={setSearch}
                    placeholder={t('home.search.placeholder')}
                  />
                </View>
              )}

              {/* ── États alternatifs à la grille : chargement initial, ── */}
              {/* changement de filtre en cours, ou onglet Monde ─────────── */}
              {loading ? (
                <View style={styles.masonrySection}>
                  <Text style={styles.loadingText}>{t('home.loading')}</Text>
                  <SkeletonList count={6} />
                </View>
              ) : filterLoading ? (
                <View style={[styles.masonrySection, styles.filterLoadingWrap]}>
                  <ActivityIndicator size="large" color={Colors.primary} />
                </View>
              ) : activeFilter === 'global' ? (
                <View style={styles.masonrySection}>
                  {worldEsims.length === 0 ? (
                    <Text style={styles.emptyText}>{t('home.empty')}</Text>
                  ) : (
                    <WorldOffersSection members={worldEsims} />
                  )}
                </View>
              ) : null}
            </>
          }
          ListEmptyComponent={
            !loading && !filterLoading && activeFilter !== 'global' ? (
              <View style={styles.masonrySection}>
                <Text style={styles.emptyText}>{t('home.empty')}</Text>
              </View>
            ) : null
          }
        />
      </View>

      <TutorialModal visible={tutorialVisible} onClose={handleCloseTutorial} />
      <DebugPanel />
    </>
  );
}