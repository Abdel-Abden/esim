import * as Clipboard from 'expo-clipboard';
import { useRouter } from 'expo-router';
import React, { useEffect, useState } from 'react';
import { useTranslation } from 'react-i18next';
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
import { apiError } from '@/i18n/i18n';
import { fetchOrder } from '@/service/orders';
import { useCartStore } from '@/store/useCartStore';
import { Colors, DEFAULT_LANG, LOCALE_TIME_MAP, OrderWithDetails, SUPPORT_EMAIL } from '@ilotel/shared';
import { styles } from './index.styles';

// ─── Composant code d'activation + QR + copie ────────────────────────────────

function ActivationCodeBlock({ code }: { code: string }) {
  const { t } = useTranslation();
  const [copied, setCopied] = useState(false);

  const handleCopy = async () => {
    await Clipboard.setStringAsync(code);
    setCopied(true);
    setTimeout(() => setCopied(false), 2500);
  };

  return (
    <Card style={styles.codeCard}>
      <Text style={styles.codeLabel}>{t('details.activationCode.label')}</Text>
      <Text style={styles.codeHint}>{t('details.activationCode.hint')}</Text>

      <View style={styles.qrWrap}>
        <QRCode value={code} size={160} />
        <Text style={styles.qrSub}>{t('details.qrSub')}</Text>
      </View>

      <View style={styles.codeSeparator}>
        <View style={styles.codeSeparatorLine} />
        <Text style={styles.codeSeparatorText}>{t('details.activationCode.separator')}</Text>
        <View style={styles.codeSeparatorLine} />
      </View>

      <View style={styles.codeBox}>
        <Text style={styles.codeText} selectable>{code}</Text>
      </View>

      <TouchableOpacity
        style={[styles.copyBtn, copied && styles.copyBtnDone]}
        onPress={handleCopy}
        activeOpacity={0.8}
      >
        <Text style={[styles.copyBtnText, copied && styles.copyBtnTextDone]}>
          {copied
            ? t('details.activationCode.copy.copied')
            : t('details.activationCode.copy.default')}
        </Text>
      </TouchableOpacity>
    </Card>
  );
}

// ─── Écran principal ─────────────────────────────────────────────────────────

export default function DetailsScreen() {
  const router = useRouter();
  const { t, i18n } = useTranslation();
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
      const timer = setTimeout(() => {
        setOrder(DEBUG_ORDER);
        setLoading(false);
      }, 600);
      return () => clearTimeout(timer);
    }

    const poll = async () => {
      const { data, errorCode, meta } = await fetchOrder(orderId);
      
      if (data && data.status === 'provisioned') {
        setOrder(data);
        setLoading(false);
      } else if (retries < 5) {
        setTimeout(() => setRetries((r) => r + 1), 1500);
      } else {
        setError(apiError(errorCode, 'details.error', { supportMail: meta?.supportEmail ?? SUPPORT_EMAIL }));
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
        <Text style={styles.loadingText}>{t('details.loading')}</Text>
      </View>
    );
  }

  if (error || !order) {
    return (
      <View style={styles.centered}>
        <Text style={styles.errorText}>{error ?? t('details.error')}</Text>
        <PrimaryButton label={t('details.provisioningError.home')} onPress={handleNewEsim} />
      </View>
    );
  }

  if (!order.esimInventory) {
    return (
      <View style={styles.centered}>
        <Text style={styles.errorText}>{t('details.provisioningError.text')}</Text>
        <Text style={[styles.errorText, { marginTop: 12, fontSize: 13, color: Colors.muted }]}>
          {t('details.provisioningError.reference')}
        </Text>
        <Text style={[styles.iccidValue, { marginBottom: 24 }]}>{order.id}</Text>
        <Text style={[styles.errorText, { fontSize: 13, color: Colors.muted, textAlign: 'center' }]}>
          {t('details.provisioningError.contact')}
        </Text>
        <PrimaryButton
          label={t('details.provisioningError.home')}
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
        <BackButton
          label={t('backButton.home')}
          onPress={() => router.replace('/')}
        />

        {IS_LOCAL && orderId === DEBUG_ORDER_ID && (
          <View style={styles.debugBanner}>
            <Text style={styles.debugBannerText}>
              🛠 Mode debug — données fictives · EXPO_PUBLIC_ENVIRONMENT=local
            </Text>
          </View>
        )}

        <Text style={styles.title}>{t('details.title')}</Text>

        <View style={styles.statusBadge}>
          <View style={styles.statusDot} />
          <Text style={styles.statusText}>{t('details.status.active')}</Text>
        </View>

        <View style={styles.emailBanner}>
          <Text style={styles.emailBannerText}>
            {t('details.emailBanner')}
            <Text style={styles.emailBannerEmail}> {order.email}</Text>
          </Text>
        </View>

        <Card>
          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>{t('details.info.country')}</Text>
            <Text style={styles.infoValue}>
              {order.offer.esim.flag} {t(`${order.offer.esim.type}.${order.offer.esim.code}`)}
            </Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>{t('details.info.offer')}</Text>
            <Text style={styles.infoValue}>
              {order.offer.dataGb} Go / {order.offer.durationDays}j
            </Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>{t('details.info.price')}</Text>
            <Text style={[styles.infoValue, { color: Colors.primary, fontWeight: '800' }]}>
              {order.finalPrice.toFixed(2)}€
            </Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>{t('details.info.iccid')}</Text>
            <Text style={styles.iccidValue}>{order.esimInventory.iccid}</Text>
          </View>
          <View style={styles.divider} />

          <View style={styles.infoRow}>
            <Text style={styles.infoLabel}>{t('details.info.activated')}</Text>
            <Text style={styles.infoValue}>
              {new Date(order.createdAt).toLocaleDateString(
                LOCALE_TIME_MAP[i18n.language] ?? LOCALE_TIME_MAP[DEFAULT_LANG],
                { day: '2-digit', month: 'long', year: 'numeric' }
              )}
            </Text>
          </View>
        </Card>

        {order.esimInventory.activationCode && (
          <ActivationCodeBlock code={order.esimInventory.activationCode} />
        )}

        <ActivationSteps />

        <PrimaryButton
          label={t('details.newEsim')}
          onPress={handleNewEsim}
          variant="secondary"
        />
      </ScrollView>
    </View>
  );
}
