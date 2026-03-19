import { Colors, Shadow } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  root: { flex: 1, backgroundColor: Colors.bg },
  scroll: { flex: 1 },
  content: { paddingBottom: 48 },

  errorContainer: {
    flex: 1, justifyContent: 'center', alignItems: 'center',
    backgroundColor: Colors.bg, padding: 32, gap: 16,
  },
  errorText: { color: Colors.text, fontSize: 14, textAlign: 'center' },

  // ── Topbar ──────────────────────────────────────────────────────────────
  topbar: {
    backgroundColor: Colors.white,
    borderBottomWidth: 2,
    borderBottomColor: Colors.border,
    paddingHorizontal: 18,
    paddingTop: 25,
    paddingBottom: 12,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    shadowColor: Colors.primary,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.06,
    shadowRadius: 8,
    elevation: 3,
    zIndex: 10,
  },
  logoArea: { flexDirection: 'row', alignItems: 'center' },
  logoBadgeWrap: {
    width:    180,      // ← largeur fixe du conteneur
    height:   52,
    overflow: 'hidden',
  },
  logoBadge: {
    width:    320,      // un peu plus large pour rogner le padding transparent
    height:   160,
    margin:   -46,
    marginLeft: -100
  },
  esimTag: {
    backgroundColor: Colors.primaryLight,
    color: Colors.primaryDark,
    fontSize: 10,
    fontWeight: '800',
    paddingHorizontal: 11,
    paddingVertical: 5,
    borderRadius: 20,
    borderWidth: 1.5,
    borderColor: Colors.border,
    overflow: 'hidden',
  },

  // ── Hero wave ───────────────────────────────────────────────────────────
  hero: {
    position: 'relative',
    overflow: 'hidden',
    paddingTop: 22,
    paddingHorizontal: 20,
    paddingBottom: 50,
  },
  heroBgCircle: {
    position: 'absolute',
    right: -50, top: -50,
    width: 200, height: 200,
    borderRadius: 100,
    backgroundColor: 'rgba(255,255,255,0.08)',
  },
  heroKicker: {
    fontSize: 11, fontWeight: '700', color: 'rgba(255,255,255,0.75)',
    letterSpacing: 1.5, textTransform: 'uppercase', marginBottom: 8,
  },
  heroTitle: {
    fontSize: 26, fontWeight: '600', color: '#fff',
    lineHeight: 32, marginBottom: 10,
  },
  heroTitleItalic: { fontStyle: 'italic' },
  heroBody: {
    fontSize: 13, color: 'rgba(255,255,255,0.82)',
    lineHeight: 20, marginBottom: 16, maxWidth: 280,
  },
  heroPills: { flexDirection: 'row', flexWrap: 'wrap', gap: 8 },
  heroPill: {
    backgroundColor: 'rgba(255,255,255,0.18)',
    borderWidth: 1, borderColor: 'rgba(255,255,255,0.3)',
    borderRadius: 6, paddingHorizontal: 11, paddingVertical: 5,
  },
  heroPillText: { fontSize: 11, fontWeight: '700', color: '#fff' },

  // ── Featured ─────────────────────────────────────────────────────────────
  featuredZone: { paddingHorizontal: 16, paddingTop: 16, paddingBottom: 6 },
  featLabel: {
    fontSize: 10, fontWeight: '800', letterSpacing: 2,
    textTransform: 'uppercase', color: Colors.primary, marginBottom: 10,
  },
  featCard: {
    backgroundColor: Colors.white,
    borderWidth: 2, borderColor: Colors.border,
    borderRadius: 20, padding: 16,
    flexDirection: 'row', alignItems: 'center', gap: 14,
    ...Shadow.card,
  },
  featIcon: {
    width: 54, height: 54, borderRadius: 16,
    backgroundColor: Colors.primaryLight,
    borderWidth: 2, borderColor: Colors.border,
    alignItems: 'center', justifyContent: 'center',
  },
  featEmoji: { fontSize: 26 },
  featInfo: { flex: 1 },
  featName: { fontSize: 16, fontWeight: '800', color: Colors.text, marginBottom: 2 },
  featDesc: { fontSize: 12, color: Colors.muted, marginBottom: 7 },
  featPriceTag: {
    backgroundColor: Colors.primaryLight,
    borderRadius: 8, paddingHorizontal: 10, paddingVertical: 4,
    alignSelf: 'flex-start',
  },
  featPriceTagText: { fontSize: 12, fontWeight: '800', color: Colors.primaryDark },
  featBtn: {
    width: 36, height: 36, backgroundColor: Colors.primary,
    borderRadius: 10, alignItems: 'center', justifyContent: 'center',
    shadowColor: Colors.primary, shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3, shadowRadius: 10, elevation: 4,
  },
  featBtnText: { fontSize: 17, color: '#fff', fontWeight: '700' },

  // ── Segmented filter (scrollable pills) ─────────────────────────────────
  segmentWrap: {
    marginHorizontal: 16, marginVertical: 14,
    backgroundColor: Colors.surface,
    borderWidth: 2, borderColor: Colors.border,
    borderRadius: 14, padding: 4,
  },
  segmentScroll: { flexGrow: 0 },
  segmentContent: { gap: 2, flexDirection: 'row' },
  segBtn: {
    paddingHorizontal: 12, paddingVertical: 7,
    borderRadius: 10,
  },
  segBtnActive: {
    backgroundColor: Colors.white,
    shadowColor: Colors.primary,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.12, shadowRadius: 6, elevation: 2,
  },
  segBtnText: { fontSize: 12, fontWeight: '700', color: Colors.muted},
  segBtnTextActive: { color: Colors.primaryDark },

  // ── Search ───────────────────────────────────────────────────────────────
  searchZone: { paddingHorizontal: 16, paddingBottom: 12 },

  // ── Masonry ──────────────────────────────────────────────────────────────
  masonrySection: { paddingHorizontal: 16, paddingBottom: 32 },
  masonryRow: { flexDirection: 'row', gap: 10 },
  masonryCol: { flex: 1 },

  loadingText: { color: Colors.muted, fontSize: 13, marginBottom: 12, textAlign: 'center' },
  emptyText: { color: Colors.muted, textAlign: 'center', marginTop: 24, fontSize: 14 },
});
