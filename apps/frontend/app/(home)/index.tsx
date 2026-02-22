// app/(home)/index.tsx
import { LinearGradient } from 'expo-linear-gradient';
import { useRouter } from 'expo-router';
import React, { useEffect, useMemo, useState } from 'react';
import {
  ActivityIndicator,
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
import { Esim, OfferWithDetails, formatOfferLabel } from '@ilotel/shared';
import { styles } from './index.styles';

export default function HomeScreen() {
  const router = useRouter();
  const setCart = useCartStore((s) => s.setCart);

  const [esims, setEsims] = useState<Esim[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [search, setSearch] = useState('');

  // Offres de la carte "monde" mise en avant
  const [featuredOffers, setFeaturedOffers] = useState<OfferWithDetails[]>([]);

  useEffect(() => {
    const load = async () => {
      const { data, error } = await fetchEsims();

      if (error || !data) {
        setError(error ?? 'Impossible de charger les destinations.');
        setLoading(false);
        return;
      }

      setEsims(data);

      // Charger les offres de la destination "région" / "global" pour la mise en avant
      const monde = data.find((e) => e.type === 'region' || e.type === 'global');
      if (monde) {
        const { data: offers } = await fetchOffers(monde.id);
        if (offers) setFeaturedOffers(offers);
      }

      setLoading(false);
    };

    load();
  }, []);

  const filteredEsims = useMemo(() => {
    if (!search.trim()) return esims;
    return esims.filter((e) =>
      e.name.toLowerCase().includes(search.toLowerCase())
    );
  }, [search, esims]);

  const monde = esims.find((e) => e.type === 'region' || e.type === 'global');
  const featuredOffer =
    featuredOffers.find((o) => o.activeDiscount !== null) ?? featuredOffers[0];

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

  if (loading) {
    return (
      <View style={[styles.gradient, { justifyContent: 'center', alignItems: 'center' }]}>
        <ActivityIndicator size="large" color={Colors.primary} />
      </View>
    );
  }

  if (error) {
    return (
      <View style={[styles.gradient, { justifyContent: 'center', alignItems: 'center', padding: 32 }]}>
        <Text style={{ color: Colors.text, marginBottom: 16 }}>{error}</Text>
        <PrimaryButton label="Réessayer" onPress={() => { setError(null); setLoading(true); }} />
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
            source={require('@/assets/logo.png')}
            style={styles.logo}
            defaultSource={require('@/assets/logo.png')}
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
                Connectez-vous partout dès {Math.min(...featuredOffers.map((o) => o.finalPrice)).toFixed(2)}€
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
                <CountryCard key={esim.id} esim={esim} />
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
