import { Colors, Radius, Spacing } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: Colors.surface,
    borderRadius: Radius.md,
    borderWidth: 1,
    borderColor: Colors.border,
    paddingHorizontal: Spacing.md,
    paddingVertical: Spacing.sm,
    gap: 8,
  },
  icon: {
    fontSize: 16,
    color: Colors.muted,
  },
  input: {
    flex: 1,
    fontSize: 14,
    color: Colors.text,
    paddingVertical: 2,
  },
});
