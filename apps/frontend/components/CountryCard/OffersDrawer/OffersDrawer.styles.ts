import { Colors } from '@ilotel/shared';
import { StyleSheet } from 'react-native';

/**
 * Styles partagés par tout le sous-système OffersDrawer :
 * - drawerStyles : chrome du bottom sheet (OffersDrawerModal) + ligne d'offre
 *   (OffersSections, modal ou inline)
 * - sectionStyles : en-tête/séparateur d'une section (visible dès que
 *   plusieurs destination sont affichées ensemble — région groupée ou monde)
 * - worldStyles : wrapper de WorldOffersSection (affichage inline, page Monde)
 *
 * ⚠️ Pas de styles radio/CTA ici : depuis que taper une offre déclenche la
 * commande immédiatement, il n'y a plus d'étape de sélection à afficher.
 */
export const drawerStyles = StyleSheet.create({
  backdrop: {
    flex: 1,
    backgroundColor: 'rgba(42,21,8,0.45)',
    justifyContent: 'flex-end',
  },
  sheet: {
    backgroundColor: Colors.white,
    borderTopLeftRadius: 24,
    borderTopRightRadius: 24,
    borderTopWidth: 3,
    borderTopColor: Colors.primary,
    paddingBottom: 32,
    maxHeight: '85%',
  },
  handle: {
    width: 40,
    height: 4,
    backgroundColor: Colors.border,
    borderRadius: 2,
    alignSelf: 'center',
    marginTop: 12,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 18,
    paddingTop: 16,
    paddingBottom: 8,
  },
  countryRow:  { flexDirection: 'row', alignItems: 'center', gap: 12 },
  flag:        { fontSize: 36 },
  countryName: { fontSize: 20, fontWeight: '800', color: Colors.text },
  countrySub:  { fontSize: 12, color: Colors.muted, marginTop: 2 },
  closeBtn: {
    width: 30,
    height: 30,
    backgroundColor: Colors.surface,
    borderRadius: 8,
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 1,
    borderColor: Colors.border,
  },
  closeTxt: { fontSize: 13, color: Colors.muted, fontWeight: '700' },
  divider: {
    height: 1,
    backgroundColor: Colors.border,
    marginHorizontal: 18,
    marginVertical: 4,
  },
  // Libellé générique ("Forfaits disponibles"), affiché seulement quand il
  // n'y a qu'une seule section (pas d'en-tête de section dédié dans ce cas)
  offersLabel: {
    fontSize: 10,
    fontWeight: '800',
    letterSpacing: 2,
    textTransform: 'uppercase',
    color: Colors.muted,
    paddingHorizontal: 18,
    paddingTop: 12,
    paddingBottom: 8,
  },
  errorText:  { color: Colors.errorRed, textAlign: 'center', padding: 20, fontSize: 13 },
  loadingIndicator: { marginVertical: 32 },
  offerCard: {
    backgroundColor: Colors.bg,
    borderWidth: 2,
    borderColor: Colors.border,
    borderRadius: 16,
    padding: 14,
    marginBottom: 10,
    flexDirection: 'row',
    alignItems: 'center',
  },
  offerCardExhausted: { opacity: 0.4 },
  offerLeft:  { flex: 1 },
  offerData:  { fontSize: 22, fontWeight: '700', color: Colors.text },
  offerDays:  { fontSize: 12, color: Colors.muted, marginTop: 2 },
  offerRight: { alignItems: 'flex-end' },
  promoBadge: {
    backgroundColor: Colors.promoGreenLight,
    borderRadius: 5,
    paddingHorizontal: 7,
    paddingVertical: 2,
    marginBottom: 4,
  },
  promoBadgeText:      { fontSize: 9, fontWeight: '800', color: Colors.promoGreen },
  oldPrice:            { fontSize: 12, color: Colors.muted, textDecorationLine: 'line-through' },
  finalPrice:          { fontSize: 22, fontWeight: '700', color: Colors.primary },
  finalPriceExhausted: { fontSize: 13, color: Colors.muted },
});

/** En-tête + séparateur d'une section (une par destination, visible quand il y en a plusieurs) */
export const sectionStyles = StyleSheet.create({
  sectionHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
    paddingHorizontal: 18,
    paddingTop: 16,
    paddingBottom: 6,
  },
  sectionFlag: { fontSize: 18 },
  sectionName: {
    flex: 1,
    fontSize: 13,
    fontWeight: '800',
    letterSpacing: 1,
    textTransform: 'uppercase',
    color: Colors.text,
  },
  sectionDivider: {
    height: 1,
    backgroundColor: Colors.border,
    marginHorizontal: 18,
    marginTop: 14,
  },
  sectionErrorText: {
    color: Colors.errorRed,
    textAlign: 'center',
    paddingVertical: 16,
    paddingHorizontal: 18,
    fontSize: 13,
  },
  sectionLoading: { marginVertical: 20 },
  offersWrap: { paddingHorizontal: 18 },
});

/** Wrapper de WorldOffersSection (rendu inline dans la page, pas de modal) */
export const worldStyles = StyleSheet.create({
  wrap: {
    marginTop: 4,
    marginBottom: 8,
  },
});
