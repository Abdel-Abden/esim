import { LinearGradient } from 'expo-linear-gradient';
import { useRouter } from 'expo-router';
import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import {
  AppState, AppStateStatus,
  ScrollView, StatusBar,
  Text, TouchableOpacity, View,
} from 'react-native';
import Svg, { Path } from 'react-native-svg';

import CountryCard from '@/components/CountryCard/CountryCard';
import FeaturedCard from '@/components/CountryCard/FeaturedCard';
import PrimaryButton from '@/components/PrimaryButton/PrimaryButton';
import SearchBar from '@/components/SearchBar/SearchBar';
import { SkeletonList } from '@/components/SkeletonCard/SkeletonCard';
import { Colors } from '@/constants/theme';
import { fetchEsims } from '@/service/esims';
import { EsimSummary } from '@ilotel/shared';
import { styles } from './index.styles';

const MIN_RELOAD_MS = 30_000;

type SegFilter = 'all' | 'europe' | 'asia' | 'americas' | 'africa' | 'promo';
const SEGS: { key: SegFilter; label: string }[] = [
  { key: 'all',      label: '🌐 Tous' },
  { key: 'europe',   label: '🇪🇺 Europe' },
  { key: 'asia',     label: '🌏 Asie' },
  { key: 'americas', label: '🌎 Amériques' },
  { key: 'africa',   label: '🌍 Afrique' },
  { key: 'promo',    label: '🔥 Promos' },
];

function LogoBadge() {
  return (
    <Svg width={40} height={40} viewBox="0 0 40 40" fill="none">
      <Path d="M0 12 Q0 0 12 0 L28 0 Q40 0 40 12 L40 28 Q40 40 28 40 L12 40 Q0 40 0 28 Z" fill={Colors.surface} />
      <Path d="M20 20 m-13 0 a13 13 0 1 1 26 0 a13 13 0 1 1 -26 0" stroke={Colors.border} strokeWidth={1} fill="none" />
      <Path d="M9 12 Q20 6 31 12 Q25 18 20 19 Q15 18 9 12Z" fill="rgba(232,98,42,0.12)" stroke={Colors.primaryDark} strokeWidth={2} strokeLinecap="round" />
      <Path d="M7 22 Q14 18 20 20 Q26 22 33 18 Q31 27 20 32 Q9 27 7 22Z" fill="rgba(240,122,68,0.1)" stroke={Colors.primary} strokeWidth={1.8} strokeLinecap="round" />
      <Path d="M11 29 Q15 33 20 34 Q25 33 29 29" fill="none" stroke={Colors.primaryMid} strokeWidth={1.5} strokeLinecap="round" />
      <Path d="M20 19 m-2.5 0 a2.5 2.5 0 1 1 5 0 a2.5 2.5 0 1 1 -5 0" fill={Colors.accent} />
    </Svg>
  );
}

export default function HomeScreen() {
  const router = useRouter();

  const [esims, setEsims] = useState<EsimSummary[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [search, setSearch] = useState('');
  const [activeFilter, setActiveFilter] = useState<SegFilter>('all');
  const lastLoadRef = useRef(0);

  const load = useCallback(async (force = false) => {
    const now = Date.now();
    if (!force && now - lastLoadRef.current < MIN_RELOAD_MS) return;
    lastLoadRef.current = now;
    setLoading(true);
    setError(null);

    const { data, error } = await fetchEsims();
    if (error || !data) {
      setError(error ?? 'Erreur de chargement.');
      setLoading(false);
      return;
    }

    setEsims(data);
    setLoading(false);
  }, []);

  useEffect(() => { load(true); }, []);
  useEffect(() => {
    const sub = AppState.addEventListener('change', (s: AppStateStatus) => {
      if (s === 'active') load();
    });
    return () => sub.remove();
  }, [load]);

  // "Monde entier" — première eSIM de type global/region
  const monde = esims.find((e) => e.type === 'region' || e.type === 'global');

  const filteredEsims = useMemo(() => {
    let list = esims;
    if (activeFilter === 'promo') {
      list = list.filter((e) => e.hasPromo);
    } else if (activeFilter !== 'all') {
      list = list.filter((e) => e.region === activeFilter);
    }
    if (search.trim()) {
      list = list.filter((e) => e.name.toLowerCase().includes(search.toLowerCase()));
    }
    return list;
  }, [search, esims, activeFilter]);

  // Masonry : colonnes paires/impaires
  const col1 = filteredEsims.filter((_, i) => i % 2 === 0);
  const col2 = filteredEsims.filter((_, i) => i % 2 === 1);

  if (error) {
    return (
      <View style={styles.errorContainer}>
        <Text style={styles.errorText}>{error}</Text>
        <PrimaryButton label="Réessayer" onPress={() => load(true)} />
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
            <LogoBadge />
            <View>
              <Text style={styles.logoName}>
                ilo<Text style={styles.logoNameAccent}>tel</Text>
              </Text>
              <Text style={styles.logoTagline}>One eSIM · EveryWhere.</Text>
            </View>
          </View>
          <Text style={styles.esimTag}>eSIM</Text>
        </View>

        <ScrollView
          style={styles.scroll}
          contentContainerStyle={styles.content}
          keyboardShouldPersistTaps="handled"
          showsVerticalScrollIndicator={false}
        >
          {/* ── Hero wave ─────────────────────────────────────────────── */}
          <LinearGradient
            colors={[Colors.primary, Colors.primaryMid, '#C8813A']}
            start={{ x: 0.1, y: 0 }}
            end={{ x: 0.9, y: 1 }}
            style={styles.hero}
          >
            <View style={styles.heroBgCircle} />
            <Text style={styles.heroKicker}>📡 Connexion instantanée</Text>
            <Text style={styles.heroTitle}>
              Voyagez connecté,{'\n'}
              <Text style={styles.heroTitleItalic}>sans carte physique</Text>
            </Text>
            <Text style={styles.heroBody}>
              Achetez votre eSIM en ligne. Activez en 2 minutes, voyagez immédiatement dans 190+ pays.
            </Text>
            <View style={styles.heroPills}>
              <View style={styles.heroPill}><Text style={styles.heroPillText}>✓ 190+ pays</Text></View>
              <View style={styles.heroPill}><Text style={styles.heroPillText}>⚡ 2min</Text></View>
              <View style={styles.heroPill}><Text style={styles.heroPillText}>🔒 Stripe</Text></View>
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
          {!loading && monde && (
            <View style={styles.featuredZone}>
              <Text style={styles.featLabel}>⭐ Offre recommandée</Text>
                <FeaturedCard esim={monde} />
            </View>
          )}

          {/* ── Segmented filter ─────────────────────────────────────── */}
          <View style={styles.segmentWrap}>
            <ScrollView
              horizontal
              showsHorizontalScrollIndicator={false}
              contentContainerStyle={styles.segmentContent}
            >
              {SEGS.map((s) => (
                <TouchableOpacity
                  key={s.key}
                  style={[styles.segBtn, activeFilter === s.key && styles.segBtnActive]}
                  onPress={() => setActiveFilter(s.key)}
                  activeOpacity={0.75}
                >
                  <Text style={[styles.segBtnText, activeFilter === s.key && styles.segBtnTextActive]}>
                    {s.label}
                  </Text>
                </TouchableOpacity>
              ))}
            </ScrollView>
          </View>

          {/* ── Search ───────────────────────────────────────────────── */}
          {!loading && (
            <View style={styles.searchZone}>
              <SearchBar value={search} onChangeText={setSearch} />
            </View>
          )}

          {/* ── Masonry 2 colonnes ────────────────────────────────────── */}
          <View style={styles.masonrySection}>
            {loading ? (
              <>
                <Text style={styles.loadingText}>Chargement des destinations…</Text>
                <SkeletonList count={6} />
              </>
            ) : filteredEsims.length === 0 ? (
              <Text style={styles.emptyText}>Aucune destination trouvée.</Text>
            ) : (
              <View style={styles.masonryRow}>
                <View style={styles.masonryCol}>
                  {col1.map((esim, i) => (
                    <CountryCard key={esim.id} esim={esim} accent={i === 0} />
                  ))}
                </View>
                <View style={styles.masonryCol}>
                  {col2.map((esim) => (
                    <CountryCard key={esim.id} esim={esim} />
                  ))}
                </View>
              </View>
            )}
          </View>
        </ScrollView>
      </View>
    </>
  );
}
