import { Colors, Radius, Shadow, Spacing } from '@ilotel/shared';
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
  wrapper: {
    borderRadius: Radius.md,
    ...Shadow.button,
  },

  gradient: {
    paddingVertical: 14,
    paddingHorizontal: Spacing.lg,
    borderRadius: Radius.md,
    alignItems: 'center',
    justifyContent: 'center',
    overflow: 'hidden', // 🔥 clé du fix
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
