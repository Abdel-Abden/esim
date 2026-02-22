// app/details/index.tsx
import { useRouter } from 'expo-router';
import React, { useEffect, useState } from 'react';
import { ActivityIndicator, Image, ScrollView, Text, View } from 'react-native';

import BackButton from '@/components/BackButton/BackButton';
import Card from '@/components/Card/Card';
import PrimaryButton from '@/components/PrimaryButton/PrimaryButton';
import { Colors } from '@/constants/theme';
import { fetchOrder } from '@/service/orders';
import { useCartStore } from '@/store/useCartStore';
import { OrderWithDetails } from '@ilotel/shared';
import { styles } from './index.styles';

export default function DetailsScreen() {
  const router = useRouter();
  const { orderId, clearCart } = useCartStore();

  const [order, setOrder] = useState<OrderWithDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [retries, setRetries] = useState(0);

  useEffect(() => {
    if (!orderId) { router.replace('/'); return; }

    // Le webhook Stripe peut avoir un léger délai — on retente jusqu'à 5 fois
    const poll = async () => {
      const { data, error } = await fetchOrder(orderId);

      if (data && data.status === 'provisioned') {
        setOrder(data);
        setLoading(false);
      } else if (retries < 5) {
        setTimeout(() => setRetries((r) => r + 1), 1500);
      } else {
        setError(error ?? 'Impossible de récupérer les détails.');
        setLoading(false);
      }
    };

    poll();
  }, [orderId, retries]);

  const handleNewEsim = () => {
    clearCart();
    router.replace('/');
  };

  if (loading) {
    return (
      <View style={styles.centered}>
        <ActivityIndicator size="large" color={Colors.primary} />
        <Text style={styles.loadingText}>Finalisation de votre eSIM…</Text>
      </View>
    );
  }

  if (error || !order) {
    return (
      <View style={styles.centered}>
        <Text style={styles.errorText}>{error ?? 'Erreur inconnue.'}</Text>
        <PrimaryButton label="Retour à l'accueil" onPress={handleNewEsim} />
      </View>
    );
  }

  const iccid = order.esimInventory?.iccid ?? '';
  const qrUrl = `https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=${iccid}`;

  return (
    <View style={styles.container}>
      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.content}
        showsVerticalScrollIndicator={false}
      >
        <BackButton label="Accueil" onPress={() => router.replace('/')} />
        <Text style={styles.title}>Votre eSIM</Text>

        <Card style={styles.qrCard}>
          <Image source={{ uri: qrUrl }} style={styles.qrImage} resizeMode="contain" />
          <Text style={styles.qrLabel}>Scannez ce QR code dans vos paramètres réseau</Text>
        </Card>

        <View style={styles.statusBadge}>
          <View style={styles.statusDot} />
          <Text style={styles.statusText}>Active</Text>
        </View>

        <Card>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Pays</Text>
            <Text style={styles.infoValue}>{order.offer.esim.flag} {order.offer.esim.name}</Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Offre</Text>
            <Text style={styles.infoValue}>{order.offer.dataGb} Go / {order.offer.durationDays}j</Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Prix payé</Text>
            <Text style={[styles.infoValue, { color: Colors.primary, fontWeight: '800' }]}>
              {order.finalPrice.toFixed(2)}€
            </Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>ICCID</Text>
            <Text style={styles.iccidValue}>{iccid}</Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Activée le</Text>
            <Text style={styles.infoValue}>
              {new Date(order.createdAt).toLocaleDateString('fr-FR', {
                day: '2-digit', month: 'long', year: 'numeric',
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
