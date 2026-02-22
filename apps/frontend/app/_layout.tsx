import { Colors } from '@/constants/theme';
import { Stack } from 'expo-router';

export default function RootLayout() {
  return (
    <Stack
      screenOptions={{
        headerShown: false,
        contentStyle: { backgroundColor: Colors.bg },
        animation: 'slide_from_right',
      }}
    />
  );
}
