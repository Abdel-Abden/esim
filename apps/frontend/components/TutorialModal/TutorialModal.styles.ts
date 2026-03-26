import { Colors, Radius, Shadow, Spacing, Typography } from '@/constants/theme';
import { Dimensions, Platform, StyleSheet } from 'react-native';

const { width: W, height: H } = Dimensions.get('window');

export const styles = StyleSheet.create({
  /* ── Backdrop ──────────────────────────────────────────────────────────── */
  backdrop: {
    ...StyleSheet.absoluteFillObject,
    backgroundColor: 'rgba(42,21,8,0.55)',
  },

  /* ── Card container ────────────────────────────────────────────────────── */
  card: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    backgroundColor: Colors.white,
    borderTopLeftRadius: 28,
    borderTopRightRadius: 28,
    overflow: 'hidden',
    maxHeight: H * 0.88,
    ...Shadow.card,
    shadowOpacity: 0.18,
    shadowRadius: 24,
    elevation: 12,
  },

  /* ── Header dégradé ────────────────────────────────────────────────────── */
  cardHeader: {
    paddingTop: Platform.OS === 'ios' ? 20 : 16,
    paddingBottom: 32,
    paddingHorizontal: Spacing.xxl,
    alignItems: 'center',
    minHeight: 190,
    position: 'relative',
  },
  headerWave: {
    position: 'absolute',
    bottom: -1,
    left: -10,
    right: 0,
  },

  /* ── Bouton fermer ─────────────────────────────────────────────────────── */
  closeBtn: {
    position: 'absolute',
    top: 16,
    right: 16,
    width: 30,
    height: 30,
    borderRadius: 15,
    backgroundColor: 'rgba(255,255,255,0.25)',
    alignItems: 'center',
    justifyContent: 'center',
    zIndex: 10,
  },
  closeTxt: {
    color: Colors.white,
    fontSize: 13,
    fontWeight: '700',
  },

  /* ── Illustration ──────────────────────────────────────────────────────── */
  illuWrap: {
    marginTop: Spacing.sm,
    alignItems: 'center',
    justifyContent: 'center',
  },

  /* ── Corps ─────────────────────────────────────────────────────────────── */
  body: {
    flexShrink: 1,
  },
  bodyContent: {
    paddingHorizontal: Spacing.xxl,
    paddingTop: Spacing.xl,
    paddingBottom: Spacing.md,
  },
  pageContent: {
    gap: Spacing.md,
  },

  /* ── Badge ─────────────────────────────────────────────────────────────── */
  badge: {
    alignSelf: 'flex-start',
    backgroundColor: Colors.primaryLight,
    borderRadius: 20,
    paddingHorizontal: 12,
    paddingVertical: 5,
    borderWidth: 1,
    borderColor: Colors.border,
  },
  badgeText: {
    ...Typography.muted,
    fontSize: 12,
    fontWeight: '600',
    color: Colors.primaryDark,
  },

  /* ── Titre / sous-titre ────────────────────────────────────────────────── */
  title: {
    ...Typography.h1,
    fontSize: 22,
    lineHeight: 30,
    color: Colors.text,
    marginTop: Spacing.xs,
  },
  subtitle: {
    ...Typography.body,
    color: Colors.muted,
    lineHeight: 20,
  },

  /* ── Bullets ───────────────────────────────────────────────────────────── */
  bullets: {
    gap: Spacing.sm,
    marginTop: Spacing.xs,
  },
  bulletRow: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: Spacing.sm,
  },
  bulletIcon: {
    width: 34,
    height: 34,
    borderRadius: 10,
    backgroundColor: Colors.surface,
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 1,
    borderColor: Colors.border,
    flexShrink: 0,
  },
  bulletIconText: {
    fontSize: 16,
  },
  bulletText: {
    ...Typography.body,
    flex: 1,
    lineHeight: 20,
    paddingTop: 7,
    color: Colors.text,
  },

  /* ── Footer ─────────────────────────────────────────────────────────────── */
  footer: {
    paddingHorizontal: Spacing.xxl,
    paddingBottom: Platform.OS === 'ios' ? 36 : Spacing.xxl,
    paddingTop: Spacing.md,
    borderTopWidth: 1,
    borderTopColor: Colors.border,
    gap: Spacing.md,
    backgroundColor: Colors.white,
  },

  /* ── Points de progression ──────────────────────────────────────────────── */
  dots: {
    flexDirection: 'row',
    justifyContent: 'center',
    gap: 7,
  },
  dot: {
    width: 7,
    height: 7,
    borderRadius: 4,
    backgroundColor: Colors.border,
  },
  dotActive: {
    width: 22,
    backgroundColor: Colors.primary,
  },

  /* ── Boutons nav ─────────────────────────────────────────────────────────── */
  navRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  skipBtn: {
    paddingVertical: 10,
    paddingHorizontal: Spacing.md,
  },
  skipBtnText: {
    ...Typography.muted,
    fontSize: 14,
  },
  prevBtn: {
    paddingVertical: 10,
    paddingHorizontal: Spacing.md,
  },
  prevBtnText: {
    ...Typography.body,
    color: Colors.muted,
    fontSize: 14,
  },
  nextBtn: {
    paddingVertical: 13,
    paddingHorizontal: Spacing.xxl,
    borderRadius: Radius.md,
    minWidth: 150,
    alignItems: 'center',
    ...Shadow.button,
  },
  nextBtnText: {
    color: Colors.white,
    fontSize: 15,
    fontWeight: '700',
  },
});