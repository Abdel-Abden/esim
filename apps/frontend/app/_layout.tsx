// app/_layout.tsx
import SplashAnimation from '@/components/SplashAnimation/SplashAnimation';
import { Colors } from '@/constants/theme';
import { StripeProvider } from '@stripe/stripe-react-native';
import { Stack } from 'expo-router';
import React, { useState } from 'react';
import { View } from 'react-native';

const STRIPE_KEY = process.env.EXPO_PUBLIC_STRIPE_PUBLISHABLE_KEY ?? '';

export default function RootLayout() {
  const [splashDone, setSplashDone] = useState(false);

  return (
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
  );
}
