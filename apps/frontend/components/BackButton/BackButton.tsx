import React from 'react';
import { TouchableOpacity, Text } from 'react-native';
import { useRouter } from 'expo-router';
import { styles } from './BackButton.styles';

interface BackButtonProps {
  label?: string;
  onPress?: () => void;
}

export default function BackButton({ label = 'Retour', onPress }: BackButtonProps) {
  const router = useRouter();

  return (
    <TouchableOpacity
      style={styles.container}
      onPress={onPress ?? (() => router.back())}
      activeOpacity={0.7}
    >
      <Text style={styles.arrow}>←</Text>
      <Text style={styles.label}>{label}</Text>
    </TouchableOpacity>
  );
}
