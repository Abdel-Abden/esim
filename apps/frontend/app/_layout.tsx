// app/_layout.tsx
import { Colors } from '@/constants/theme';
import { StripeProvider } from '@stripe/stripe-react-native';
import { Stack } from 'expo-router';

const STRIPE_KEY = process.env.EXPO_PUBLIC_STRIPE_PUBLISHABLE_KEY ?? '';

export default function RootLayout() {
  return (
    <StripeProvider
      publishableKey={STRIPE_KEY}
      merchantIdentifier="merchant.com.ilotel.esim" // requis pour Apple Pay
    >
      <Stack
        screenOptions={{
          headerShown: false,
          contentStyle: { backgroundColor: Colors.bg },
          animation: 'slide_from_right',
        }}
      />
    </StripeProvider>
  );
}
