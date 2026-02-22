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
    paddingBottom: 40,
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

  title: { ...Typography.h1, marginBottom: Spacing.lg },

  qrCard: { alignItems: 'center', paddingVertical: Spacing.xxl },
  qrImage: { width: 180, height: 180, borderRadius: Radius.sm },
  qrLabel: { marginTop: Spacing.md, fontSize: 13, color: Colors.muted, textAlign: 'center' },

  statusBadge: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    backgroundColor: '#DCFCE7',
    borderRadius: Radius.sm,
    paddingHorizontal: 10,
    paddingVertical: 4,
    alignSelf: 'flex-start',
    marginBottom: Spacing.md,
  },
  statusDot: { width: 8, height: 8, borderRadius: 4, backgroundColor: '#16A34A' },
  statusText: { fontSize: 13, fontWeight: '700', color: '#15803D' },

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
