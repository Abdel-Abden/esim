import { Colors } from '@/constants/theme';
import { LinearGradient } from 'expo-linear-gradient';
import React from 'react';
import {
  ActivityIndicator,
  Text,
  TouchableOpacity,
  ViewStyle,
} from 'react-native';
import { styles } from './PrimaryButton.styles';

interface PrimaryButtonProps {
  label: string;
  onPress: () => void;
  variant?: 'primary' | 'secondary';
  loading?: boolean;
  disabled?: boolean;
  style?: ViewStyle;
}

export default function PrimaryButton({
  label,
  onPress,
  variant = 'primary',
  loading = false,
  disabled = false,
  style,
}: PrimaryButtonProps) {
  const isPrimary = variant === 'primary';

  if (isPrimary) {
    return (
      <TouchableOpacity
        onPress={onPress}
        disabled={disabled || loading}
        activeOpacity={0.85}
        style={[disabled || loading ? styles.disabled : null, style]}
      >
        <LinearGradient
          colors={[Colors.primary, Colors.accent]}
          start={{ x: 0, y: 0 }}
          end={{ x: 1, y: 1 }}
          style={[styles.base]}
        >
          {loading ? (
            <ActivityIndicator color="#fff" />
          ) : (
            <Text style={styles.label}>{label}</Text>
          )}
        </LinearGradient>
      </TouchableOpacity>
    );
  }

  return (
    <TouchableOpacity
      onPress={onPress}
      disabled={disabled || loading}
      activeOpacity={0.8}
      style={[styles.base, styles.secondary, disabled || loading ? styles.disabled : null, style]}
    >
      {loading ? (
        <ActivityIndicator color={Colors.text} />
      ) : (
        <Text style={[styles.label, styles.labelSecondary]}>{label}</Text>
      )}
    </TouchableOpacity>
  );
}
