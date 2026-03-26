/**
 * components/ActivationSteps/ActivationSteps.styles.ts
 *
 * Styles partagés pour le composant ActivationSteps et le OsTag.
 * Importé par TutorialModal (OsTag) et details/index (ActivationSteps).
 */
import { Colors, Spacing, Typography } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const activationStepsStyles = StyleSheet.create({
  /* ── Carte ─────────────────────────────────────────────────────────── */
  card: {
    gap: 0,
    overflow: 'hidden',
    padding: 0,
  },

  /* ── En-tête coloré ────────────────────────────────────────────────── */
  header: {
    paddingVertical: 10,
    paddingHorizontal: 14,
    borderBottomWidth: 2,
    marginBottom: 12,
  },
  headerLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 7,
  },
  headerTitle: {
    fontSize: 13,
    fontWeight: '700',
  },

  /* ── Étapes ────────────────────────────────────────────────────────── */
  stepRow: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: 10,
    marginBottom: 10,
    paddingHorizontal: 14,
  },
  stepBadge: {
    width: 22,
    height: 22,
    borderRadius: 11,
    alignItems: 'center',
    justifyContent: 'center',
    flexShrink: 0,
    marginTop: 1,
  },
  stepBadgeText: {
    fontSize: 11,
    fontWeight: '800',
    color: Colors.white,
  },
  stepText: {
    fontSize: 13,
    lineHeight: 20,
    flex: 1,
  },

  /* ── OsTag (badge inline dans TutorialModal) ───────────────────────── */
  osTag: {
    flexDirection: 'row',
    alignItems: 'center',
    alignSelf: 'flex-start',
    borderRadius: 8,
    paddingHorizontal: 10,
    paddingVertical: 5,
    borderWidth: 1,
    gap: 5,
  },
  osTagText: {
    fontSize: 12,
    fontWeight: '700',
  },
});
