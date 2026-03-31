import { useStripe } from '@stripe/stripe-react-native';
import { useRouter } from 'expo-router';
import React, { useEffect, useRef, useState } from 'react';
import {
  Alert,
  KeyboardAvoidingView,
  Linking,
  Platform,
  ScrollView,
  Text,
  TextInput,
  TouchableOpacity,
  View
} from 'react-native';

import BackButton from '@/components/BackButton/BackButton';
import Card from '@/components/Card/Card';
import PrimaryButton from '@/components/PrimaryButton/PrimaryButton';
import SuccessPopup from '@/components/SuccessPopup/SuccessPopup';
import { cancelOrder, checkoutOrder, reserveOrder } from '@/service/orders';
import { useCartStore } from '@/store/useCartStore';
import { RESERVATION_DURATION_MINUTES } from '@ilotel/shared';
import { cguStyles, styles } from './index.styles';

export default function PaymentScreen() {
  const router = useRouter();
  const { initPaymentSheet, presentPaymentSheet } = useStripe();
  const { cart, setOrderId } = useCartStore();

  const [email, setEmail] = useState('');
  const [emailFocused, setEmailFocused] = useState(false);
  const [loading, setLoading] = useState(false);
  const [reserving, setReserving] = useState(true);
  const [showSuccess, setShowSuccess] = useState(false);
  const [expiresAt, setExpiresAt] = useState<Date | null>(null);
  const [timeLeft, setTimeLeft] = useState<number>(RESERVATION_DURATION_MINUTES * 60);

  // ── Nouveau : consentement CGU ───────────────────────────────────────────────
  const [cguAccepted, setCguAccepted] = useState(false);

  const pendingOrderId = useRef<string | null>(null);

  // ── Réservation automatique ───────────────────────────────────────────────
  useEffect(() => {
    if (!cart) return;

    const reserve = async () => {
      setReserving(true);
      const { data, error } = await reserveOrder({ offerId: cart.offerId });

      if (error || !data) {
        setReserving(false);
        Alert.alert(
          'Stock épuisé',
          error ?? "Cette offre n'est plus disponible.",
          [{ text: 'Retour', onPress: () => router.back() }]
        );
        return;
      }

      pendingOrderId.current = data.orderId;
      setExpiresAt(new Date(data.expiresAt));
      setReserving(false);
    };

    reserve();
  }, []);

  // ── Compte à rebours ──────────────────────────────────────────────────────
  useEffect(() => {
    if (!expiresAt) return;

    const interval = setInterval(() => {
      const remaining = Math.max(0, Math.floor((expiresAt.getTime() - Date.now()) / 1000));
      setTimeLeft(remaining);

      if (remaining === 0) {
        clearInterval(interval);
        if (pendingOrderId.current) {
          cancelOrder(pendingOrderId.current);
          pendingOrderId.current = null;
        }
        Alert.alert(
          'Réservation expirée',
          'Votre réservation a expiré. Veuillez recommencer.',
          [{ text: 'Retour', onPress: () => router.back() }]
        );
      }
    }, 1000);

    return () => clearInterval(interval);
  }, [expiresAt]);

  // ── Annulation si l'utilisateur quitte ───────────────────────────────────
  useEffect(() => {
    return () => {
      if (pendingOrderId.current) {
        cancelOrder(pendingOrderId.current);
        pendingOrderId.current = null;
      }
    };
  }, []);

  if (!cart) {
    router.replace('/');
    return null;
  }

  const formatTimeLeft = () => {
    const m = Math.floor(timeLeft / 60);
    const s = timeLeft % 60;
    return `${m}:${s.toString().padStart(2, '0')}`;
  };

  const isPayable =
    !loading &&
    !reserving &&
    email.trim() !== '' &&
    email.includes('@') &&
    timeLeft > 0 &&
    cguAccepted; // ← condition supplémentaire

  const handlePayment = async () => {
    if (!email.trim() || !email.includes('@')) {
      Alert.alert('Email requis', 'Veuillez entrer un email valide.');
      return;
    }
    if (!cguAccepted) {
      Alert.alert('Conditions générales', 'Veuillez accepter les CGU pour continuer.');
      return;
    }
    if (!pendingOrderId.current) {
      Alert.alert('Erreur', 'Réservation introuvable, veuillez recommencer.');
      return;
    }

    setLoading(true);

    const { data, error } = await checkoutOrder(pendingOrderId.current, { email });

    if (error || !data) {
      setLoading(false);
      Alert.alert('Erreur', error ?? 'Impossible de lancer le paiement.');
      return;
    }

    const { error: initError } = await initPaymentSheet({
      merchantDisplayName: 'ILOTEL eSIM',
      customerId: data.customerId,
      customerEphemeralKeySecret: data.ephemeralKey,
      paymentIntentClientSecret: data.clientSecret,
      defaultBillingDetails: { email },
      returnURL: 'ilotel://payment-complete',
      applePay: { merchantCountryCode: 'FR' },
      googlePay: { merchantCountryCode: 'FR', testEnv: __DEV__ },
    });

    if (initError) {
      setLoading(false);
      Alert.alert('Erreur', initError.message);
      return;
    }

    const { error: paymentError } = await presentPaymentSheet();

    if (paymentError) {
      setLoading(false);
      if (paymentError.code !== 'Canceled') {
        Alert.alert('Paiement refusé', paymentError.message);
      }
      return;
    }

    pendingOrderId.current = null;
    setOrderId(data.orderId);
    setLoading(false);
    setShowSuccess(true);

    setTimeout(() => router.replace('/details'), 1400);
  };

  return (
    <KeyboardAvoidingView
      style={styles.container}
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
    >
      <SuccessPopup visible={showSuccess} />

      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.content}
        keyboardShouldPersistTaps="handled"
        showsVerticalScrollIndicator={false}
      >
        <BackButton />
        <Text style={styles.title}>Paiement</Text>

        {/* Récapitulatif */}
        <Card>
          <View style={styles.summaryRow}>
            <Text style={styles.summaryLabel}>Destination</Text>
            <Text style={styles.summaryValue}>{cart.flag} {cart.country}</Text>
          </View>
          <View style={styles.summaryRow}>
            <Text style={styles.summaryLabel}>Offre</Text>
            <Text style={styles.summaryValue}>{cart.offer}</Text>
          </View>
          <View style={styles.divider} />
          <View style={styles.summaryRow}>
            <Text style={styles.summaryLabel}>Total</Text>
            <Text style={styles.summaryPrice}>{cart.finalPrice.toFixed(2)}€</Text>
          </View>
          {cart.isPromo && (
            <View style={styles.summaryRow}>
              <Text style={styles.summaryLabel}>Prix original</Text>
              <Text style={[styles.summaryValue, { textDecorationLine: 'line-through' }]}>
                {cart.basePrice.toFixed(2)}€
              </Text>
            </View>
          )}
        </Card>

        {/* Compte à rebours */}
        {expiresAt && timeLeft > 0 && (
          <View style={{ alignItems: 'center', marginVertical: 8 }}>
            <Text style={{ color: timeLeft < 60 ? 'red' : '#888', fontSize: 13 }}>
              ⏱ Réservation valide encore {formatTimeLeft()}
            </Text>
          </View>
        )}

        {/* Email */}
        <Card>
          <Text style={styles.formLabel}>Email de confirmation</Text>
          <TextInput
            style={[styles.input, emailFocused && styles.inputFocused]}
            value={email}
            onChangeText={setEmail}
            placeholder="votre@email.com"
            keyboardType="email-address"
            autoCapitalize="none"
            autoComplete="email"
            onFocus={() => setEmailFocused(true)}
            onBlur={() => setEmailFocused(false)}
          />
          <View style={styles.stripeNote}>
            <Text style={styles.stripeNoteText}>
              🔒 La saisie de carte est gérée de façon sécurisée par Stripe
            </Text>
          </View>
        </Card>

        {/* ── CGU ──────────────────────────────────────────────────────────── */}
        <TouchableOpacity
          style={cguStyles.row}
          onPress={() => setCguAccepted((v) => !v)}
          activeOpacity={0.7}
        >
          {/* Checkbox personnalisée */}
          <View style={[cguStyles.checkbox, cguAccepted && cguStyles.checkboxChecked]}>
            {cguAccepted && <Text style={cguStyles.checkmark}>✓</Text>}
          </View>

          {/* Texte + lien */}
          <Text style={cguStyles.label}>
            J'ai lu et j'accepte les{' '}
            <Text
              style={cguStyles.link}
              onPress={() => Linking.openURL('https://api.ilotel.com/legal/cgu')}
            >
              Conditions Générales de Vente
            </Text>
            {' '}et la{' '}
            <Text
              style={cguStyles.link}
              onPress={() => Linking.openURL('https://api.ilotel.com/legal/privacy')}
            >
              Politique de confidentialité
            </Text>
            .
          </Text>
        </TouchableOpacity>

        {/* Note droit de rétractation (contenu numérique) */}
        <Text style={cguStyles.withdrawalNote}>
          Conformément à l'article L221-28 du Code de la consommation, vous reconnaissez que la fourniture de l'eSIM débute immédiatement après le paiement et renoncez expressément à votre droit de rétractation.
        </Text>

        <PrimaryButton
          label={
            reserving
              ? 'Réservation en cours…'
              : loading
              ? 'Chargement...'
              : 'Choisir mon moyen de paiement'
          }
          onPress={handlePayment}
          loading={loading || reserving}
          disabled={!isPayable}
        />
      </ScrollView>
    </KeyboardAvoidingView>
  );
}