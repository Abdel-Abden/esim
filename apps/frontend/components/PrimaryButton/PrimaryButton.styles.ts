import { Colors, Radius, Shadow, Spacing } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  base: {
    paddingVertical: 14,
    paddingHorizontal: Spacing.lg,
    borderRadius: Radius.md,
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: Spacing.sm,
    ...Shadow.button,
  },
  gradient: {
    // On simule le dégradé via une couleur de fond
    // Le vrai gradient sera via expo-linear-gradient
    backgroundColor: Colors.primary,
  },
  secondary: {
    backgroundColor: '#F1F5F9',
    shadowColor: 'transparent',
    elevation: 0,
  },
  label: {
    color: Colors.white,
    fontWeight: '700',
    fontSize: 15,
  },
  labelSecondary: {
    color: Colors.text,
  },
  disabled: {
    opacity: 0.5,
  },
});
