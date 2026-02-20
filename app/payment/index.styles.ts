import { Colors, Radius, Spacing, Typography } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: Colors.bg,
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
  },
  title: {
    ...Typography.h1,
    marginBottom: Spacing.lg,
  },

  // Récapitulatif commande
  summaryRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: Spacing.sm,
  },
  summaryLabel: {
    ...Typography.muted,
  },
  summaryValue: {
    ...Typography.label,
  },
  summaryPrice: {
    fontSize: 20,
    fontWeight: '800',
    color: Colors.primary,
  },
  divider: {
    height: 1,
    backgroundColor: Colors.border,
    marginVertical: Spacing.md,
  },

  // Formulaire
  formLabel: {
    ...Typography.label,
    marginBottom: 6,
    marginTop: Spacing.md,
  },
  input: {
    backgroundColor: Colors.surface,
    borderRadius: Radius.md,
    borderWidth: 1,
    borderColor: Colors.border,
    paddingHorizontal: Spacing.md,
    paddingVertical: 12,
    fontSize: 14,
    color: Colors.text,
  },
  inputFocused: {
    borderColor: Colors.primary,
  },
  stripePlaceholder: {
    backgroundColor: Colors.surface,
    borderRadius: Radius.md,
    borderWidth: 1,
    borderColor: Colors.border,
    paddingHorizontal: Spacing.md,
    paddingVertical: 14,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    marginTop: 6,
  },
  stripeText: {
    color: Colors.muted,
    fontSize: 14,
  },
  stripeIcon: {
    fontSize: 18,
  },

  // Note Stripe
  stripeNote: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    marginTop: Spacing.sm,
  },
  stripeNoteText: {
    fontSize: 12,
    color: Colors.muted,
  },
});
