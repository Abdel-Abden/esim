import { Colors, Spacing } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    paddingVertical: 6,
    paddingHorizontal: 0,
    marginBottom: Spacing.md,
    alignSelf: 'flex-start',
  },
  arrow: {
    fontSize: 16,
    color: Colors.muted,
    fontWeight: '600',
  },
  label: {
    fontSize: 14,
    color: Colors.muted,
    fontWeight: '600',
  },
});
