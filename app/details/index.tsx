import { useRouter } from 'expo-router';
import React from 'react';
import { Image, ScrollView, Text, View } from 'react-native';

import BackButton from '@/components/BackButton/BackButton';
import Card from '@/components/Card/Card';
import PrimaryButton from '@/components/PrimaryButton/PrimaryButton';
import { useCartStore } from '@/store/useCartStore';
import { styles } from './index.styles';

export default function DetailsScreen() {
  const router = useRouter();
  const { esim, clearCart } = useCartStore();

  if (!esim) {
    router.replace('/');
    return null;
  }

  const qrUrl = `https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=${esim.iccid}`;

  const handleNewEsim = () => {
    clearCart();
    router.replace('/');
  };

  return (
    <View style={styles.container}>
      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.content}
        showsVerticalScrollIndicator={false}
      >
        <BackButton label="Accueil" onPress={() => router.replace('/')} />

        <Text style={styles.title}>Votre eSIM</Text>

        {/* QR Code */}
        <Card style={styles.qrCard}>
          <Image
            source={{ uri: qrUrl }}
            style={styles.qrImage}
            resizeMode="contain"
          />
          <Text style={styles.qrLabel}>
            Scannez ce QR code dans vos paramètres réseau
          </Text>
        </Card>

        {/* Statut */}
        <View style={styles.statusBadge}>
          <View style={styles.statusDot} />
          <Text style={styles.statusText}>Active</Text>
        </View>

        {/* Détails eSIM */}
        <Card>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Pays</Text>
            <Text style={styles.infoValue}>
              {esim.flag} {esim.country}
            </Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Offre</Text>
            <Text style={styles.infoValue}>{esim.offer}</Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Prix payé</Text>
            <Text style={[styles.infoValue, { color: '#3B82F6', fontWeight: '800' }]}>
              {esim.price.toFixed(2)}€
            </Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>ICCID</Text>
            <Text style={styles.iccidValue}>{esim.iccid}</Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Activée le</Text>
            <Text style={styles.infoValue}>
              {new Date(esim.activatedAt).toLocaleDateString('fr-FR', {
                day: '2-digit',
                month: 'long',
                year: 'numeric',
              })}
            </Text>
          </View>
        </Card>

        <PrimaryButton
          label="Commander une nouvelle eSIM"
          onPress={handleNewEsim}
          variant="secondary"
        />
      </ScrollView>
    </View>
  );
}
