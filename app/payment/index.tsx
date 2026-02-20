import { useRouter } from 'expo-router';
import React, { useState } from 'react';
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
import { useCartStore } from '@/store/useCartStore';
import { styles } from './index.styles';

export default function PaymentScreen() {
  const router = useRouter();
  const { cart, setEsim } = useCartStore();

  const [email, setEmail] = useState('');
  const [emailFocused, setEmailFocused] = useState(false);
  const [loading, setLoading] = useState(false);
  const [showSuccess, setShowSuccess] = useState(false);

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

    // TODO: Intégrer Stripe ici
    // const { paymentIntent } = await createPaymentIntent(cart.price);
    // await stripe.confirmPayment(...)

    setTimeout(() => {
      const iccid = '89883' + Math.floor(Math.random() * 99999999);
      setEsim({
        ...cart,
        iccid,
        activatedAt: new Date().toISOString(),
      });

      setShowSuccess(true);
      setLoading(false);

      setTimeout(() => {
        router.replace('/details');
      }, 1400);
    }, 1200);
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
            <Text style={styles.summaryValue}>
              {cart.flag} {cart.country}
            </Text>
          </View>

          <View style={styles.summaryRow}>
            <Text style={styles.summaryLabel}>Offre</Text>
            <Text style={styles.summaryValue}>{cart.offer}</Text>
          </View>

          <View style={styles.divider} />

          <View style={styles.summaryRow}>
            <Text style={styles.summaryLabel}>Total</Text>
            <Text style={styles.summaryPrice}>{cart.price.toFixed(2)}€</Text>
          </View>
        </Card>

        {/* Formulaire */}
        <Card>
          <Text style={styles.formLabel}>Email</Text>
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

          <Text style={styles.formLabel}>Carte bancaire</Text>
          {/* TODO: Remplacer par <CardField /> de @stripe/stripe-react-native */}
          <View style={styles.stripePlaceholder}>
            <Text style={styles.stripeIcon}>💳</Text>
            <Text style={styles.stripeText}>Stripe CardField (à intégrer)</Text>
          </View>

          <View style={styles.stripeNote}>
            <Text style={styles.stripeNoteText}>🔒 Paiement sécurisé par Stripe</Text>
          </View>
        </Card>

        <PrimaryButton
          label={loading ? 'Traitement…' : 'Payer'}
          onPress={handlePayment}
          loading={loading}
          disabled={loading}
        />
      </ScrollView>
    </KeyboardAvoidingView>
  );
}
