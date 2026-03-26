/**
 * components/DebugPanel/DebugPanel.styles.ts
 */
import { Colors, Radius, Shadow } from '@/constants/theme';
import { Platform, StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  /* ── Wrapper positionné en overlay ──────────────────────────────────── */
  container: {
    position: 'absolute',
    bottom: Platform.OS === 'ios' ? 44 : 24,
    right: 16,
    alignItems: 'flex-end',
    zIndex: 999,
  },

  /* ── Panneau déroulant ──────────────────────────────────────────────── */
  panel: {
    backgroundColor: Colors.white,
    borderRadius: Radius.lg,
    marginBottom: 10,
    overflow: 'hidden',
    minWidth: 230,
    ...Shadow.card,
    shadowOpacity: 0.14,
    shadowRadius: 18,
    elevation: 10,
    borderWidth: 2,
    borderColor: '#FCD34D', // jaune warning — clairement un outil de dev
  },
  panelHeader: {
    backgroundColor: '#FEFCE8',
    paddingHorizontal: 14,
    paddingVertical: 10,
    borderBottomWidth: 1,
    borderBottomColor: '#FDE68A',
  },
  panelTitle: {
    fontSize: 13,
    fontWeight: '800',
    color: '#92400E',
  },
  panelSubtitle: {
    fontSize: 10,
    color: '#B45309',
    fontFamily: Platform.OS === 'ios' ? 'Courier New' : 'monospace',
    marginTop: 1,
  },

  /* ── Boutons raccourci ───────────────────────────────────────────────── */
  shortcutBtn: {
    paddingHorizontal: 14,
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  shortcutLabel: {
    fontSize: 13,
    fontWeight: '700',
    color: Colors.text,
  },
  shortcutDesc: {
    fontSize: 11,
    color: Colors.muted,
    marginTop: 2,
  },

  /* ── Bouton flottant (FAB) ───────────────────────────────────────────── */
  fab: {
    width: 46,
    height: 46,
    borderRadius: 23,
    backgroundColor: '#FCD34D',
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 2,
    borderColor: '#F59E0B',
    ...Shadow.button,
    shadowColor: '#F59E0B',
  },
  fabActive: {
    backgroundColor: '#FEF3C7',
    borderColor: '#FCD34D',
  },
  fabText: {
    fontSize: 18,
  },
});
