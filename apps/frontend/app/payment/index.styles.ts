import { Colors, Radius, Spacing, Typography } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Colors.bg },
  scroll: { flex: 1 },
  content: {
    maxWidth: 480,
    width: '100%',
    alignSelf: 'center',
    padding: Spacing.xl,
    paddingBottom: 40,
  },
  title: { ...Typography.h1, marginBottom: Spacing.lg },

  summaryRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: Spacing.sm,
  },
  summaryLabel: { ...Typography.muted },
  summaryValue: { ...Typography.label },
  summaryPrice: { fontSize: 20, fontWeight: '800', color: Colors.primary },
  divider: { height: 1, backgroundColor: Colors.border, marginVertical: Spacing.md },

  formLabel: { ...Typography.label, marginBottom: 6, marginTop: Spacing.md },
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
  inputFocused: { borderColor: Colors.primary },

  // Stripe CardField
  stripeCardField: {
    width: '100%',
    height: 50,
    marginTop: 6,
  },
  stripeNote: {
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: Spacing.sm,
  },
  stripeNoteText: { fontSize: 12, color: Colors.muted },
});

// ─── Styles CGU ───────────────────────────────────────────────────────────────
export const cguStyles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    marginVertical: 12,
    paddingHorizontal: 4,
    gap: 10,
  },
  checkbox: {
    width: 22,
    height: 22,
    borderRadius: 6,
    borderWidth: 2,
    borderColor: '#C0C4D0',
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: 1,
    flexShrink: 0,
  },
  checkboxChecked: {
    backgroundColor: '#0066FF',
    borderColor: '#0066FF',
  },
  checkmark: {
    color: '#FFF',
    fontSize: 13,
    fontWeight: '700',
    lineHeight: 16,
  },
  label: {
    flex: 1,
    fontSize: 13,
    color: '#555',
    lineHeight: 19,
  },
  link: {
    color: '#0066FF',
    fontWeight: '600',
    textDecorationLine: 'underline',
  },
  withdrawalNote: {
    fontSize: 11,
    color: '#999',
    lineHeight: 16,
    marginBottom: 16,
    paddingHorizontal: 4,
    fontStyle: 'italic',
  },
});