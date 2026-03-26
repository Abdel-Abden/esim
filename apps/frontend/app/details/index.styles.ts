// app/details/index.styles.ts
import { Platform, StyleSheet } from 'react-native';
import { Colors, Radius, Spacing, Typography } from '../../constants/theme';

export const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: Colors.bg },
  scroll: { flex: 1 },
  content: {
    maxWidth: 480,
    width: '100%',
    alignSelf: 'center',
    padding: Spacing.xl,
    paddingBottom: 48,
    gap: Spacing.md,
  },
  centered: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: Spacing.xl,
    gap: Spacing.lg,
    backgroundColor: Colors.bg,
  },
  loadingText: { ...Typography.muted, marginTop: Spacing.md },
  errorText: { ...Typography.body, color: Colors.errorRed, textAlign: 'center' },

  title: { ...Typography.h1, marginBottom: 2 },

  // ── Bandeau debug (local uniquement) ────────────────────────────────────
  debugBanner: {
    backgroundColor: '#FEFCE8',
    borderRadius: Radius.sm,
    borderWidth: 1.5,
    borderColor: '#FCD34D',
    paddingVertical: 8,
    paddingHorizontal: 12,
  },
  debugBannerText: {
    fontSize: 11,
    fontWeight: '700',
    color: '#92400E',
    fontFamily: Platform.OS === 'ios' ? 'Courier New' : 'monospace',
  },

  // ── Status badge ─────────────────────────────────────────────────────────
  statusBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    backgroundColor: '#DCFCE7',
    borderRadius: Radius.sm,
    paddingHorizontal: 10,
    paddingVertical: 4,
    alignSelf: 'flex-start',
  },
  statusDot: { width: 8, height: 8, borderRadius: 4, backgroundColor: '#16A34A' },
  statusText: { fontSize: 13, fontWeight: '700', color: '#15803D' },

  // ── Bannière email ────────────────────────────────────────────────────────
  emailBanner: {
    backgroundColor: Colors.accentLight,
    borderRadius: Radius.sm,
    borderWidth: 1,
    borderColor: Colors.accent + '44',
    paddingVertical: 10,
    paddingHorizontal: 14,
  },
  emailBannerText: {
    fontSize: 13,
    color: Colors.accent,
    lineHeight: 18,
  },
  emailBannerEmail: {
    fontWeight: '700',
  },

  // ── Code d'activation ─────────────────────────────────────────────────────
  codeCard: {
    gap: Spacing.sm,
  },
  codeLabel: {
    fontSize: 11,
    fontWeight: '800',
    letterSpacing: 1.5,
    textTransform: 'uppercase',
    color: Colors.muted,
  },
  codeHint: {
    ...Typography.muted,
    fontSize: 12,
    lineHeight: 17,
  },

  // ── QR code ───────────────────────────────────────────────────────────────
  qrWrap: {
    alignItems: 'center',
    paddingVertical: Spacing.md,
    gap: Spacing.sm,
  },
  qrSub: {
    ...Typography.muted,
    fontSize: 11,
    textAlign: 'center',
    maxWidth: 220,
    lineHeight: 15,
    fontStyle: 'italic',
  },

  // ── Séparateur "ou saisir manuellement" ───────────────────────────────────
  codeSeparator: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.sm,
    marginVertical: Spacing.xs,
  },
  codeSeparatorLine: {
    flex: 1,
    height: 1,
    backgroundColor: Colors.border,
  },
  codeSeparatorText: {
    ...Typography.muted,
    fontSize: 11,
  },

  // ── Code texte ────────────────────────────────────────────────────────────
  codeBox: {
    backgroundColor: Colors.surface,
    borderWidth: 2,
    borderStyle: 'dashed',
    borderColor: Colors.border,
    borderRadius: Radius.sm,
    paddingVertical: 14,
    paddingHorizontal: 16,
  },
  codeText: {
    fontFamily: Platform.OS === 'ios' ? 'Courier New' : 'monospace',
    fontSize: 13,
    fontWeight: '700',
    color: Colors.primary,
    lineHeight: 20,
  },

  // ── Bouton copier ─────────────────────────────────────────────────────────
  copyBtn: {
    backgroundColor: Colors.primaryLight,
    borderRadius: Radius.sm,
    borderWidth: 1.5,
    borderColor: Colors.border,
    paddingVertical: 11,
    alignItems: 'center',
  },
  copyBtnDone: {
    backgroundColor: Colors.accentLight,
    borderColor: Colors.accent + '55',
  },
  copyBtnText: {
    fontSize: 14,
    fontWeight: '700',
    color: Colors.primaryDark,
  },
  copyBtnTextDone: {
    color: Colors.accent,
  },

  // ── Récapitulatif commande ────────────────────────────────────────────────
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: Spacing.sm,
  },
  infoLabel: { ...Typography.muted, flex: 1 },
  infoValue: { ...Typography.label, flex: 2, textAlign: 'right' },
  iccidValue: {
    fontFamily: Platform.OS === 'ios' ? 'Courier New' : 'monospace',
    fontSize: 12,
    color: Colors.text,
    textAlign: 'right',
    flex: 2,
  },
  divider: { height: 1, backgroundColor: Colors.border },
});