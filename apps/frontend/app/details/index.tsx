import { useRouter } from 'expo-router';
import React, { useEffect, useState } from 'react';
import { ActivityIndicator, ScrollView, Text, View } from 'react-native';
import QRCode from 'react-native-qrcode-svg';

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

  // Paiement confirmé mais eSIM non assignée — problème de provisioning
  if (!order.esimInventory) {
    return (
      <View style={styles.centered}>
        <Text style={styles.errorText}>
          Votre paiement a bien été reçu mais votre eSIM n'a pas pu être activée automatiquement.
        </Text>
        <Text style={[styles.errorText, { marginTop: 12, fontSize: 13, color: Colors.muted }]}>
          Référence de commande :
        </Text>
        <Text style={[styles.iccidValue, { marginBottom: 24 }]}>
          {order.id}
        </Text>
        <Text style={[styles.errorText, { fontSize: 13, color: Colors.muted, textAlign: 'center' }]}>
          Contactez-nous à support@ilotel.com en indiquant cette référence.
          Nous vous enverrons votre eSIM sous 24h.
        </Text>
        <PrimaryButton
          label="Retour à l'accueil"
          onPress={handleNewEsim}
          style={{ marginTop: 24 }}
        />
      </View>
    );
  }

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
          {order.esimInventory.activationCode ? (
            <>
              <QRCode
                value={order.esimInventory.activationCode}
                size={180}
              />
              <Text style={styles.qrLabel}>
                Scannez ce QR code dans vos paramètres réseau
              </Text>
            </>
          ) : (
            <Text style={styles.qrLabel}>
              QR code non disponible — contactez le support en indiquant la référence{' '}
              <Text style={{ fontWeight: '700' }}>{order.id}</Text>
            </Text>
          )}
        </Card>

        <View style={styles.statusBadge}>
          <View style={styles.statusDot} />
          <Text style={styles.statusText}>Active</Text>
        </View>

        <Card>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Pays</Text>
            <Text style={styles.infoValue}>
              {order.offer.esim.flag} {order.offer.esim.name}
            </Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>Offre</Text>
            <Text style={styles.infoValue}>
              {order.offer.dataGb} Go / {order.offer.durationDays}j
            </Text>
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
            <Text style={styles.iccidValue}>{order.esimInventory.iccid}</Text>
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
