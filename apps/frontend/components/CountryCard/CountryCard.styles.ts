import { Colors, Radius, Spacing } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    borderWidth: 1,
    borderColor: Colors.border,
    borderRadius: Radius.md,
    overflow: 'hidden',
    backgroundColor: Colors.white,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: Spacing.md,
  },
  left: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    flex: 1,
  },
  flag: {
    fontSize: 22,
  },
  name: {
    fontSize: 15,
    fontWeight: '600',
    color: Colors.text,
  },
  promoBadge: {
    backgroundColor: 'rgba(139, 92, 246, 0.1)',
    borderRadius: 8,
    paddingHorizontal: 8,
    paddingVertical: 2,
  },
  promoText: {
    fontSize: 11,
    fontWeight: '700',
    color: Colors.accent,
  },
  startingPrice: {
    fontSize: 13,
    fontWeight: '700',
    color: Colors.primary,
  },
  chevron: {
    fontSize: 12,
    color: Colors.muted,
    marginLeft: Spacing.sm,
  },
  offersContainer: {
    paddingHorizontal: Spacing.md,
    paddingBottom: Spacing.md,
    gap: Spacing.sm,
    flexDirection: 'column',
  },
  divider: {
    height: 1,
    backgroundColor: Colors.border,
    marginBottom: Spacing.sm,
  },
});
