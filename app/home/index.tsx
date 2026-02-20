import { LinearGradient } from 'expo-linear-gradient';
import { useRouter } from 'expo-router';
import React, { useMemo, useState } from 'react';
import {
  Image,
  ScrollView,
  StatusBar,
  Text,
  View,
} from 'react-native';

import { COUNTRIES } from '@/constants/countries';
import { Colors } from '@/constants/theme';
import { useCartStore } from '@/store/useCartStore';

import CountryCard from '@/components/CountryCard/CountryCard';
import PrimaryButton from '@/components/PrimaryButton/PrimaryButton';
import SearchBar from '@/components/SearchBar/SearchBar';
import { styles } from './index.styles';

export default function HomeScreen() {
  const router = useRouter();
  const setCart = useCartStore((s) => s.setCart);
  const [search, setSearch] = useState('');

  const filteredCountries = useMemo(() => {
    if (!search.trim()) return COUNTRIES;
    return COUNTRIES.filter((c) =>
      c.name.toLowerCase().includes(search.toLowerCase())
    );
  }, [search]);

  const monde = COUNTRIES.find((c) => c.id === 'monde');

  const handleFeaturedOrder = () => {
    if (!monde) return;
    const offer = monde.offers.find((o) => o.isPromo) ?? monde.offers[0];
    setCart({
      country: monde.name,
      flag: monde.flag,
      offer: `${offer.data} / ${offer.duration}`,
      price: offer.price,
    });
    router.push('/payment');
  };

  return (
    <>
      <StatusBar barStyle="dark-content" />
      <LinearGradient
        colors={['#FFFFFF', Colors.bg]}
        style={styles.gradient}
      >
        <ScrollView
          style={styles.scroll}
          contentContainerStyle={styles.content}
          keyboardShouldPersistTaps="handled"
          showsVerticalScrollIndicator={false}
        >
          {/* Logo */}
          <Image
            source={require('@/assets/logo.png')}
            style={styles.logo}
            defaultSource={require('@/assets/logo.png')}
          />

          <Text style={styles.title}>Choisissez votre eSIM</Text>

          {/* Carte mise en avant "Monde" */}
          {monde && (
            <View style={styles.featuredCard}>
              <View style={styles.featuredRow}>
                <Text style={styles.featuredEmoji}>🌍</Text>
                <Text style={styles.featuredTitle}>Monde (Recommandé)</Text>
              </View>
              <Text style={styles.featuredSub}>
                Connectez-vous partout dans le monde dès {Math.min(...monde.offers.map(o => o.price)).toFixed(2)}€
              </Text>
              <PrimaryButton label="Voir les offres" onPress={handleFeaturedOrder} />
            </View>
          )}

          {/* Liste des pays */}
          <View style={styles.listContainer}>
            <Text style={styles.listTitle}>Tous les pays</Text>
            <SearchBar value={search} onChangeText={setSearch} />

            <View style={styles.countriesList}>
              {filteredCountries.map((country) => (
                <CountryCard key={country.id} country={country} />
              ))}
            </View>
          </View>
        </ScrollView>
      </LinearGradient>
    </>
  );
}
