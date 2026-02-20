import { Colors, Radius, Shadow, Spacing } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  gradient: {
    flex: 1,
  },
  scroll: {
    flex: 1,
  },
  content: {
    maxWidth: 480,
    width: '100%',
    alignSelf: 'center',
    padding: Spacing.xl,
    paddingBottom: 40,
    gap: Spacing.lg,
  },
  logo: {
    width: 120,
    height: 60,
    alignSelf: 'center',
    resizeMode: 'contain',
    marginBottom: Spacing.sm,
  },
  title: {
    fontSize: 22,
    fontWeight: '700',
    color: Colors.text,
    marginBottom: Spacing.xs,
  },
  featuredCard: {
    backgroundColor: Colors.card,
    borderRadius: Radius.lg,
    padding: Spacing.lg,
    borderWidth: 1,
    borderColor: Colors.border,
    ...Shadow.card,
  },
  featuredRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    marginBottom: Spacing.sm,
  },
  featuredEmoji: {
    fontSize: 20,
  },
  featuredTitle: {
    fontSize: 16,
    fontWeight: '700',
    color: Colors.text,
  },
  featuredSub: {
    fontSize: 13,
    color: Colors.muted,
    marginBottom: Spacing.sm,
  },
  listContainer: {
    backgroundColor: Colors.white,
    borderRadius: Radius.lg,
    borderWidth: 1,
    borderColor: Colors.border,
    ...Shadow.card,
    padding: Spacing.md,
    gap: Spacing.md,
  },
  listTitle: {
    fontSize: 13,
    fontWeight: '600',
    color: Colors.muted,
    letterSpacing: 0.5,
    textTransform: 'uppercase',
    marginBottom: Spacing.xs,
  },
  countriesList: {
    gap: Spacing.sm,
  },
});
