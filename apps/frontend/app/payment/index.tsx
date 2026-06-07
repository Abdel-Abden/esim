import { useStripe } from '@stripe/stripe-react-native';
import { useRouter } from 'expo-router';
import React, { useEffect, useRef, useState } from 'react';
import { useTranslation } from 'react-i18next';
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
import { apiError } from '@/i18n/i18n';
import { cancelOrder, checkoutOrder, reserveOrder } from '@/service/orders';
import { useCartStore } from '@/store/useCartStore';
import { DEFAULT_LANG, RESERVATION_DURATION_MINUTES } from '@ilotel/shared';
import { cguStyles, styles } from './index.styles';

export default function PaymentScreen() {
  const router = useRouter();
  const { t, i18n } = useTranslation();
  const { initPaymentSheet, presentPaymentSheet } = useStripe();
  const { cart, setOrderId } = useCartStore();

  const [email, setEmail] = useState('');
  const [emailFocused, setEmailFocused] = useState(false);
  const [loading, setLoading] = useState(false);
  const [reserving, setReserving] = useState(true);
  const [showSuccess, setShowSuccess] = useState(false);
  const [expiresAt, setExpiresAt] = useState<Date | null>(null);
  const [timeLeft, setTimeLeft] = useState<number>(RESERVATION_DURATION_MINUTES * 60);
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
          t('payment.alerts.stockExhausted.title'),
          apiError(error, 'payment.alerts.stockExhausted.message'),
          [{ text: t('payment.alerts.stockExhausted.back'), onPress: () => router.back() }]
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
          t('payment.alerts.reservationExpired.title'),
          t('payment.alerts.reservationExpired.message'),
          [{ text: t('payment.alerts.reservationExpired.back'), onPress: () => router.back() }]
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
    cguAccepted;

  const handlePayment = async () => {
    if (!email.trim() || !email.includes('@')) {
      Alert.alert(
        t('payment.alerts.emailRequired.title'),
        t('payment.alerts.emailRequired.message')
      );
      return;
    }
    if (!cguAccepted) {
      Alert.alert(
        t('payment.alerts.cguRequired.title'),
        t('payment.alerts.cguRequired.message')
      );
      return;
    }
    if (!pendingOrderId.current) {
      Alert.alert(
        t('payment.alerts.reservationNotFound.title'),
        t('payment.alerts.reservationNotFound.message')
      );
      return;
    }

    setLoading(true);

    const { data, error } = await checkoutOrder(pendingOrderId.current, { email });

    if (error || !data) {
      setLoading(false);
      Alert.alert(t('payment.alerts.paymentFailed.title'), apiError(error, 'payment.alerts.paymentFailed.title'));
      return;
    }

    const lang = i18n.resolvedLanguage ?? DEFAULT_LANG;

    const { error: initError } = await initPaymentSheet({
      merchantDisplayName: 'ILOTEL eSIM',
      customerId: data.customerId,
      customerEphemeralKeySecret: data.ephemeralKey,
      paymentIntentClientSecret: data.clientSecret,
      defaultBillingDetails: { email },
      returnURL: 'ilotel://payment-complete',
      applePay: { merchantCountryCode: lang },
      googlePay: { merchantCountryCode: lang, testEnv: __DEV__ },
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
        Alert.alert(t('payment.alerts.paymentFailed.title'), paymentError.message);
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
        <Text style={styles.title}>{t('payment.title')}</Text>

        {/* Récapitulatif */}
        <Card>
          <View style={styles.summaryRow}>
            <Text style={styles.summaryLabel}>{t('payment.summary.destination')}</Text>
            <Text style={styles.summaryValue}>{cart.flag} {cart.country}</Text>
          </View>
          <View style={styles.summaryRow}>
            <Text style={styles.summaryLabel}>{t('payment.summary.offer')}</Text>
            <Text style={styles.summaryValue}>{cart.offer}</Text>
          </View>
          <View style={styles.divider} />
          <View style={styles.summaryRow}>
            <Text style={styles.summaryLabel}>{t('payment.summary.total')}</Text>
            <Text style={styles.summaryPrice}>{cart.finalPrice.toFixed(2)}€</Text>
          </View>
          {cart.isPromo && (
            <View style={styles.summaryRow}>
              <Text style={styles.summaryLabel}>{t('payment.summary.originalPrice')}</Text>
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
              ⏱ {t('payment.reservation.validFor', { time: formatTimeLeft() })}
            </Text>
          </View>
        )}

        {/* Email */}
        <Card>
          <Text style={styles.formLabel}>{t('payment.email.label')}</Text>
          <TextInput
            style={[styles.input, emailFocused && styles.inputFocused]}
            value={email}
            onChangeText={setEmail}
            placeholder={t('payment.email.placeholder')}
            keyboardType="email-address"
            autoCapitalize="none"
            autoComplete="email"
            onFocus={() => setEmailFocused(true)}
            onBlur={() => setEmailFocused(false)}
          />
          <View style={styles.stripeNote}>
            <Text style={styles.stripeNoteText}>{t('payment.stripeNote')}</Text>
          </View>
        </Card>

        {/* CGU */}
        <TouchableOpacity
          style={cguStyles.row}
          onPress={() => setCguAccepted((v) => !v)}
          activeOpacity={0.7}
        >
          <View style={[cguStyles.checkbox, cguAccepted && cguStyles.checkboxChecked]}>
            {cguAccepted && <Text style={cguStyles.checkmark}>✓</Text>}
          </View>

          <Text style={cguStyles.label}>
            {t('payment.cgu.label')
              .split('{cguLink}')[0]}
            <Text
              style={cguStyles.link}
              onPress={() => Linking.openURL('https://api.ilotel.com/legal/cgu')}
            >
              {t('payment.cgu.cgu')}
            </Text>
            {t('payment.cgu.label')
              .split('{cguLink}')[1]
              ?.split('{privacyLink}')[0]}
            <Text
              style={cguStyles.link}
              onPress={() => Linking.openURL('https://api.ilotel.com/legal/privacy')}
            >
              {t('payment.cgu.privacy')}
            </Text>
            {t('payment.cgu.label')
              .split('{privacyLink}')[1]}
          </Text>
        </TouchableOpacity>

        {/* Note droit de rétractation */}
        <Text style={cguStyles.withdrawalNote}>
          {t('payment.withdrawalNote')}
        </Text>

        <PrimaryButton
          label={
            reserving
              ? t('payment.button.reserving')
              : loading
              ? t('payment.button.loading')
              : t('payment.button.pay')
          }
          onPress={handlePayment}
          loading={loading || reserving}
          disabled={!isPayable}
        />
      </ScrollView>
    </KeyboardAvoidingView>
  );
}
