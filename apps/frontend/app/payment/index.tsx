// app/payment/index.tsx
import { useStripe } from '@stripe/stripe-react-native';
import { useRouter } from 'expo-router';
import React, { useEffect, useRef, useState } from 'react';
import {
  Alert,
  KeyboardAvoidingView,
  Platform,
  ScrollView,
  Text,
  TextInput,
  View,
} from 'react-native';

import BackButton from '@/components/BackButton/BackButton';
import Card from '@/components/Card/Card';
import PrimaryButton from '@/components/PrimaryButton/PrimaryButton';
import SuccessPopup from '@/components/SuccessPopup/SuccessPopup';
import { cancelOrder, createOrder } from '@/service/orders';
import { useCartStore } from '@/store/useCartStore';
import { styles } from './index.styles';

export default function PaymentScreen() {
  const router = useRouter();
  const { initPaymentSheet, presentPaymentSheet } = useStripe();
  const { cart, setOrderId } = useCartStore();

  const [email, setEmail] = useState('');
  const [emailFocused, setEmailFocused] = useState(false);
  const [loading, setLoading] = useState(false);
  const [showSuccess, setShowSuccess] = useState(false);

  // Référence vers l'orderId en cours — permet de l'annuler si l'écran est quitté
  const pendingOrderId = useRef<string | null>(null);

  // Annulation automatique si l'utilisateur quitte l'écran sans payer
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

  const handlePayment = async () => {
    if (!email.trim() || !email.includes('@')) {
      Alert.alert('Email requis', 'Veuillez entrer un email valide.');
      return;
    }

    setLoading(true);

    // Étape 1 — Créer la commande + réserver l'eSIM
    const { data, error } = await createOrder({ offerId: cart.offerId, email });

    if (error || !data) {
      setLoading(false);
      Alert.alert('Erreur', error ?? 'Impossible de créer la commande.');
      return;
    }

    // Stocker l'orderId pour pouvoir l'annuler si besoin
    pendingOrderId.current = data.orderId;

    // Étape 2 — Initialiser la PaymentSheet Stripe
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
      // Libérer l'eSIM réservée
      await cancelOrder(data.orderId);
      pendingOrderId.current = null;
      setLoading(false);
      Alert.alert('Erreur', initError.message);
      return;
    }

    // Étape 3 — Ouvrir la modale Stripe
    const { error: paymentError } = await presentPaymentSheet();

    if (paymentError) {
      if (paymentError.code === 'Canceled') {
        // L'utilisateur a fermé la modale — on libère l'eSIM
        await cancelOrder(data.orderId);
        pendingOrderId.current = null;
        setLoading(false);
        return;
      }

      // Paiement refusé — on libère l'eSIM pour qu'il puisse réessayer
      await cancelOrder(data.orderId);
      pendingOrderId.current = null;
      setLoading(false);
      Alert.alert('Paiement refusé', paymentError.message);
      return;
    }

    // Paiement confirmé — la commande est finalisée via webhook
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

        <PrimaryButton
          label={loading ? 'Chargement...' : 'Choisir mon moyen de paiement'}
          onPress={handlePayment}
          loading={loading}
          disabled={loading || !email.trim() || !email.includes('@')}
        />
      </ScrollView>
    </KeyboardAvoidingView>
  );
}
