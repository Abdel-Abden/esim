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

  // QR Code
  qrCard: {
    alignItems: 'center',
    paddingVertical: Spacing.xxl,
  },
  qrImage: {
    width: 180,
    height: 180,
    borderRadius: Radius.sm,
  },
  qrLabel: {
    marginTop: Spacing.md,
    fontSize: 13,
    color: Colors.muted,
    textAlign: 'center',
  },

  // Status badge
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
  statusDot: {
    width: 8,
    height: 8,
    borderRadius: 4,
    backgroundColor: '#16A34A',
  },
  statusText: {
    fontSize: 13,
    fontWeight: '700',
    color: '#15803D',
  },

  // Info rows
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: Spacing.sm,
  },
  infoLabel: {
    ...Typography.muted,
    flex: 1,
  },
  infoValue: {
    ...Typography.label,
    flex: 2,
    textAlign: 'right',
  },
  iccidValue: {
    fontFamily: Platform.OS === 'ios' ? 'Courier New' : 'monospace',
    fontSize: 12,
    color: Colors.text,
    textAlign: 'right',
    flex: 2,
  },
  divider: {
    height: 1,
    backgroundColor: Colors.border,
  },
});

import { Platform } from 'react-native';
