import * as Clipboard from 'expo-clipboard';
import { useRouter } from 'expo-router';
import React, { useEffect, useState } from 'react';
import {
  ActivityIndicator,
  ScrollView,
  Text,
  TouchableOpacity,
  View
} from 'react-native';
import QRCode from 'react-native-qrcode-svg';

import { ActivationSteps } from '@/components/ActivationSteps/ActivationSteps';
import BackButton from '@/components/BackButton/BackButton';
import Card from '@/components/Card/Card';
import PrimaryButton from '@/components/PrimaryButton/PrimaryButton';
import { DEBUG_ORDER_ID, IS_LOCAL } from '@/constants/env';
import { Colors } from '@/constants/theme';
import { fetchOrder } from '@/service/orders';
import { useCartStore } from '@/store/useCartStore';
import { OrderWithDetails } from '@ilotel/shared';
import { styles } from './index.styles';

// ─── Composant code d'activation + QR + copie ────────────────────────────────

function ActivationCodeBlock({ code }: { code: string }) {
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    await Clipboard.setStringAsync(code);
    setCopied(true);
    setTimeout(() => setCopied(false), 2500);
  };

  return (
    <Card style={styles.codeCard}>
      <Text style={styles.codeLabel}>🔑 Code d'activation</Text>
      <Text style={styles.codeHint}>
        Scannez le QR code ou copiez le code texte et saisissez-le manuellement dans les réglages.
        Faites une capture d'écran pour le retrouver facilement.
      </Text>

      {/* QR Code */}
      <View style={styles.qrWrap}>
        <QRCode value={code} size={160} />
        <Text style={styles.qrSub}>Scanner avec l'app Appareil photo ne fonctionne pas — utilisez les réglages réseau</Text>
      </View>

      {/* Séparateur */}
      <View style={styles.codeSeparator}>
        <View style={styles.codeSeparatorLine} />
        <Text style={styles.codeSeparatorText}>ou saisir manuellement</Text>
        <View style={styles.codeSeparatorLine} />
      </View>

      {/* Code texte sélectionnable */}
      <View style={styles.codeBox}>
        <Text style={styles.codeText} selectable>{code}</Text>
      </View>

      <TouchableOpacity
        style={[styles.copyBtn, copied && styles.copyBtnDone]}
        onPress={handleCopy}
        activeOpacity={0.8}
      >
        <Text style={[styles.copyBtnText, copied && styles.copyBtnTextDone]}>
          {copied ? '✓ Copié dans le presse-papier !' : '📋 Copier le code'}
        </Text>
      </TouchableOpacity>
    </Card>
  );
}

// ─── Écran principal ─────────────────────────────────────────────────────────

export default function DetailsScreen() {
  const router = useRouter();
  const { orderId, clearCart } = useCartStore();

  const [order, setOrder] = useState<OrderWithDetails | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [retries, setRetries] = useState(0);

  useEffect(() => {
    if (!orderId) { router.replace('/'); return; }

    // ── Mode debug local ──────────────────────────────────────────────────
    // IS_LOCAL est une constante littérale : Metro remplace
    // process.env.EXPO_PUBLIC_ENVIRONMENT au bundle-time, puis Terser/Hermes
    // supprime ce bloc entier en production (dead-code elimination).
    // Le require() dynamique empêche debugFixtures d'être bundlé en prod.
    if (IS_LOCAL && orderId === DEBUG_ORDER_ID) {
      const { DEBUG_ORDER } = require('@/constants/debugFixtures');
      const t = setTimeout(() => {
        setOrder(DEBUG_ORDER);
        setLoading(false);
      }, 600);
      return () => clearTimeout(t);
    }

    // ── Parcours normal ───────────────────────────────────────────────────
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

        {/* ── Bandeau debug (local uniquement) ─────────────────────────── */}
        {IS_LOCAL && orderId === DEBUG_ORDER_ID && (
          <View style={styles.debugBanner}>
            <Text style={styles.debugBannerText}>
              🛠 Mode debug — données fictives · EXPO_PUBLIC_ENVIRONMENT=local
            </Text>
          </View>
        )}

        <Text style={styles.title}>Votre eSIM est prête 🎉</Text>

        {/* ── Badge statut ─────────────────────────────────────────────── */}
        <View style={styles.statusBadge}>
          <View style={styles.statusDot} />
          <Text style={styles.statusText}>Active</Text>
        </View>

        {/* ── Rappel email ─────────────────────────────────────────────── */}
        <View style={styles.emailBanner}>
          <Text style={styles.emailBannerText}>
            📧 Un email avec votre code d'activation a été envoyé à{' '}
            <Text style={styles.emailBannerEmail}>{order.email}</Text>
          </Text>
        </View>

        {/* ── Récapitulatif commande ───────────────────────────────────── */}
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

        {/* ── Code d'activation + copie ─────────────────────────────────── */}
        {order.esimInventory.activationCode && (
          <ActivationCodeBlock code={order.esimInventory.activationCode} />
        )}

        {/* ── Instructions par OS ──────────────────────────────────────── */}
        <ActivationSteps />

        <PrimaryButton
          label="Commander une nouvelle eSIM"
          onPress={handleNewEsim}
          variant="secondary"
        />
      </ScrollView>
    </View>
  );
}