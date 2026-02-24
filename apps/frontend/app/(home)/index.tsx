import { LinearGradient } from 'expo-linear-gradient';
import { useRouter } from 'expo-router';
import React, { useCallback, useEffect, useMemo, useRef, useState } from 'react';
import {
  ActivityIndicator,
  AppState,
  AppStateStatus,
  Image,
  ScrollView,
  StatusBar,
  Text,
  View,
} from 'react-native';

import CountryCard from '@/components/CountryCard/CountryCard';
import PrimaryButton from '@/components/PrimaryButton/PrimaryButton';
import SearchBar from '@/components/SearchBar/SearchBar';
import { Colors } from '@/constants/theme';
import { fetchEsims, fetchOffers } from '@/service/esims';
import { useCartStore } from '@/store/useCartStore';
import { Esim, OfferWithStock, formatOfferLabel } from '@ilotel/shared';
import { styles } from './index.styles';

type OffersMap = Record<string, OfferWithStock[]>;

const MIN_RELOAD_INTERVAL_MS = 30_000; // 30 secondes entre deux rechargements

export default function HomeScreen() {
  const router = useRouter();
  const setCart = useCartStore((s) => s.setCart);

  const [esims, setEsims] = useState<Esim[]>([]);
  const [offersMap, setOffersMap] = useState<OffersMap>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [search, setSearch] = useState('');

  const lastLoadRef = useRef<number>(0);

  const load = useCallback(async (force = false) => {
    const now = Date.now();

    // Évite les rechargements trop fréquents sauf si forcé (bouton réessayer)
    if (!force && now - lastLoadRef.current < MIN_RELOAD_INTERVAL_MS) return;
    lastLoadRef.current = now;

    setLoading(true);
    setError(null);

    const { data, error } = await fetchEsims();

    if (error || !data) {
      setError(error ?? 'Impossible de charger les destinations.');
      setLoading(false);
      return;
    }

    setEsims(data);

    // Précharge toutes les offres en parallèle
    const results = await Promise.all(
      data.map(async (esim) => {
        const { data: offers } = await fetchOffers(esim.id);
        return { esimId: esim.id, offers: offers ?? [] };
      })
    );

    const map: OffersMap = {};
    results.forEach(({ esimId, offers }) => { map[esimId] = offers; });

    setOffersMap(map);
    setLoading(false);
  }, []);

  // Chargement initial
  useEffect(() => { load(true); }, []);

  // Rechargement au retour en foreground
  useEffect(() => {
    const subscription = AppState.addEventListener(
      'change',
      (nextState: AppStateStatus) => {
        if (nextState === 'active') load();
      }
    );
    return () => subscription.remove();
  }, [load]);

  // Rafraîchissement du stock après un refus de stock (appelé par CountryCard)
  const handleStockExhausted = useCallback(async (esimId: string) => {
    const { data: offers } = await fetchOffers(esimId);
    if (offers) {
      setOffersMap((prev) => ({ ...prev, [esimId]: offers }));
    }
  }, []);

  const filteredEsims = useMemo(() => {
    if (!search.trim()) return esims;
    return esims.filter((e) =>
      e.name.toLowerCase().includes(search.toLowerCase())
    );
  }, [search, esims]);

  const monde = esims.find((e) => e.type === 'region' || e.type === 'global');
  const featuredOffers = monde ? (offersMap[monde.id] ?? []) : [];
  const featuredOffer =
    featuredOffers.find((o) => o.activeDiscount !== null && o.availableCount > 0)
    ?? featuredOffers.find((o) => o.availableCount > 0);

  const handleFeaturedOrder = () => {
    if (!monde || !featuredOffer) return;
    setCart({
      offerId: featuredOffer.id,
      esimId: monde.id,
      country: monde.name,
      flag: monde.flag,
      offer: formatOfferLabel(featuredOffer),
      basePrice: featuredOffer.basePrice,
      finalPrice: featuredOffer.finalPrice,
      isPromo: featuredOffer.activeDiscount !== null,
    });
    router.push('/payment');
  };

  if (loading && esims.length === 0) {
    return (
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: Colors.bg }}>
        <ActivityIndicator size="large" color={Colors.primary} />
        <Text style={{ color: Colors.muted, marginTop: 12 }}>Chargement des destinations…</Text>
      </View>
    );
  }

  if (error) {
    return (
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center', backgroundColor: Colors.bg, padding: 32 }}>
        <Text style={{ color: Colors.text, marginBottom: 16, textAlign: 'center' }}>{error}</Text>
        <PrimaryButton label="Réessayer" onPress={() => load(true)} />
      </View>
    );
  }

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <LinearGradient colors={['#FFFFFF', Colors.bg]} style={styles.gradient}>
        <ScrollView
          style={styles.scroll}
          contentContainerStyle={styles.content}
          keyboardShouldPersistTaps="handled"
          showsVerticalScrollIndicator={false}
        >
          <Image
            source={require('@/assets/images/logo.png')}
            style={styles.logo}
            defaultSource={require('@/assets/images/logo.png')}
          />

          <Text style={styles.title}>Choisissez votre eSIM</Text>

          {/* Carte mise en avant */}
          {monde && featuredOffer && (
            <View style={styles.featuredCard}>
              <View style={styles.featuredRow}>
                <Text style={styles.featuredEmoji}>{monde.flag}</Text>
                <Text style={styles.featuredTitle}>{monde.name} (Recommandé)</Text>
              </View>
              <Text style={styles.featuredSub}>
                Connectez-vous partout dès{' '}
                {Math.min(...featuredOffers.filter(o => o.availableCount > 0).map((o) => o.finalPrice)).toFixed(2)}€
              </Text>
              <PrimaryButton label="Voir les offres" onPress={handleFeaturedOrder} />
            </View>
          )}

          {/* Liste des destinations */}
          <View style={styles.listContainer}>
            <Text style={styles.listTitle}>Tous les pays</Text>
            <SearchBar value={search} onChangeText={setSearch} />

            <View style={styles.countriesList}>
              {filteredEsims.map((esim) => (
                <CountryCard
                  key={esim.id}
                  esim={esim}
                  preloadedOffers={offersMap[esim.id]}
                  onStockExhausted={handleStockExhausted}
                />
              ))}
            </View>

            {filteredEsims.length === 0 && (
              <Text style={{ color: Colors.muted, textAlign: 'center', marginTop: 24 }}>
                Aucune destination trouvée.
              </Text>
            )}
          </View>
        </ScrollView>
      </LinearGradient>
    </>
  );
}