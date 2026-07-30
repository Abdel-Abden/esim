import { Colors } from '@ilotel/shared';
import { StyleSheet } from 'react-native';

/**
 * wrapperStyle : à appliquer sur le View qui englobe card + bouton.
 * Exporté pour être utilisé dans CountryCard et FeaturedCard.
 */
export const rcbStyles = StyleSheet.create({
  wrapper: {
    position: 'relative',
    marginBottom: 10,
  },
});

export const btnStyles = StyleSheet.create({
  /**
   * Badge flottant (coin haut-droit d'une carte) — affiche le nombre de pays.
   * minWidth + paddingHorizontal (au lieu d'une largeur fixe) pour accueillir
   * les nombres à 2-3 chiffres (ex: "47").
   */
  btn: {
    position: 'absolute',
    top: 8,
    right: 8,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    minWidth: 26,
    height: 24,
    paddingHorizontal: 7,
    borderRadius: 12,
    backgroundColor: Colors.primaryLight,
    borderWidth: 1.5,
    borderColor: Colors.primary,
    justifyContent: 'center',
    zIndex: 10,
    elevation: 10,
  },
  /** Variante utilisée en ligne, ex: dans l'en-tête d'une section du GroupOfferDrawer */
  btnInline: {
    position: 'relative',
    top: 0,
    right: 0,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 4,
    minWidth: 0,
    height: 22,
    paddingHorizontal: 9,
    borderRadius: 11,
  },
  label: {
    fontSize: 12,
    color: Colors.primary,
    fontWeight: '800',
    lineHeight: 15,
    includeFontPadding: false,
  },
  labelInline: {
    fontSize: 11,
  },
  labelSuffix: {
    fontSize: 10,
    color: Colors.primary,
    fontWeight: '700',
    textTransform: 'uppercase',
  },
});

/** Bottom sheet — tableau pays / 3G / 4G / 5G */
export const sheetStyles = StyleSheet.create({
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
    maxHeight: '75%',
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
  headerLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
  },
  flag:     { fontSize: 32 },
  title:    { fontSize: 18, fontWeight: '800', color: Colors.text },
  subtitle: { fontSize: 12, color: Colors.muted, marginTop: 2 },
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
  list:        { paddingHorizontal: 18 },
  listContent: { paddingTop: 6, paddingBottom: 8 },
  loadingIndicator: { marginVertical: 32 },

  /* ── Tableau pays / réseaux ── */
  tableHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: 8,
    borderBottomWidth: 2,
    borderBottomColor: Colors.border,
  },
  headerCountryCell: {
    flex: 1,
    textAlign: 'left',
  },
  headerCell: {
    width: 40,
    fontSize: 11,
    fontWeight: '800',
    color: Colors.muted,
    textAlign: 'center',
    textTransform: 'uppercase',
  },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: 10,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  /** Ligne d'en-tête pays (mode multi-pays uniquement) — sépare visuellement chaque pays du tableau */
  countryHeaderRow: {
    paddingTop: 14,
    paddingBottom: 4,
  },
  countryHeaderText: {
    fontSize: 12,
    fontWeight: '800',
    letterSpacing: 0.5,
    textTransform: 'uppercase',
    color: Colors.primaryDark,
  },
  /** Ligne opérateur indentée sous un pays (mode multi-pays) */
  rowIndented: {
    paddingLeft: 14,
  },
  operatorNameIndented: {
    color: Colors.muted,
    fontWeight: '500',
  },
  countryName: { fontSize: 13, color: Colors.text, fontWeight: '500', flex: 1, paddingRight: 6 },
  countryCode: { fontSize: 11, color: Colors.muted, fontWeight: '600', marginLeft: 8 },
  checkCell: {
    width: 40,
    alignItems: 'center',
    justifyContent: 'center',
  },
  checkDash: {
    width: 12,
    height: 2,
    borderRadius: 1,
    backgroundColor: Colors.border,
  },
});