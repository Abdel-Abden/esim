// app/_layout.tsx
import SplashAnimation from '@/components/SplashAnimation/SplashAnimation';
import i18n from '@/i18n/i18n';
import { Colors, RTL_LANGS } from '@ilotel/shared';
import { StripeProvider } from '@stripe/stripe-react-native';
import { Stack } from 'expo-router';
import * as Updates from 'expo-updates';
import React, { useEffect, useState } from 'react';
import { I18nextProvider } from 'react-i18next';
import { I18nManager, View } from 'react-native';

const STRIPE_KEY = process.env.EXPO_PUBLIC_STRIPE_PUBLISHABLE_KEY ?? '';

/**
 * Synchronise la direction de mise en page (LTR / RTL) avec la langue active.
 *
 * React Native requiert un rechargement complet de l'app pour appliquer un
 * changement de direction — I18nManager.forceRTL() ne suffit pas seul.
 * On recharge uniquement si la direction courante diffère de celle attendue,
 * pour éviter une boucle infinie.
 */
function useSyncRtl(language: string) {
  useEffect(() => {
    const shouldBeRtl = RTL_LANGS.has(language);
    const isCurrentlyRtl = I18nManager.isRTL;

    if (shouldBeRtl !== isCurrentlyRtl) {
      I18nManager.forceRTL(shouldBeRtl);
      Updates.reloadAsync().catch(() => {
      });
    }
  }, [language]);
}

export default function RootLayout() {
  const [splashDone, setSplashDone] = useState(false);

  useSyncRtl(i18n.language);

  return (
    <I18nextProvider i18n={i18n}>
      <StripeProvider
        publishableKey={STRIPE_KEY}
        merchantIdentifier="merchant.com.ilotel.esim"
      >
        <View style={{ flex: 1 }}>
          <Stack
            screenOptions={{
              headerShown: false,
              contentStyle: { backgroundColor: Colors.bg },
              animation: 'slide_from_right',
            }}
          />
          {!splashDone && (
            <SplashAnimation onFinish={() => setSplashDone(true)} />
          )}
        </View>
      </StripeProvider>
    </I18nextProvider>
  );
}
