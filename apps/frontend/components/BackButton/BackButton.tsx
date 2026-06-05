import React from 'react';
import { TouchableOpacity, Text } from 'react-native';
import { useRouter } from 'expo-router';
import { useTranslation } from 'react-i18next';
import { styles } from './BackButton.styles';

interface BackButtonProps {
  label?: string;
  onPress?: () => void;
}

export default function BackButton({ label, onPress }: BackButtonProps) {
  const router = useRouter();
  const { t } = useTranslation();

  return (
    <TouchableOpacity
      style={styles.container}
      onPress={onPress ?? (() => router.back())}
      activeOpacity={0.7}
    >
      <Text style={styles.arrow}>←</Text>
      <Text style={styles.label}>{label ?? t('backButton.default')}</Text>
    </TouchableOpacity>
  );
}
