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
  btn: {
    position: 'absolute',
    top: 8,
    right: 8,
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: Colors.primaryLight,
    borderWidth: 1.5,
    borderColor: Colors.primary,
    alignItems: 'center',
    justifyContent: 'center',
    zIndex: 10,
    elevation: 10,
  },
  label: {
    fontSize: 13,
    color: Colors.primary,
    fontWeight: '700',
    lineHeight: 15,
    includeFontPadding: false,
  },
});

/** Bottom sheet liste des pays */
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
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingVertical: 9,
    borderBottomWidth: 1,
    borderBottomColor: Colors.border,
  },
  countryName: { fontSize: 14, color: Colors.text, fontWeight: '500', flex: 1 },
  countryCode: { fontSize: 11, color: Colors.muted, fontWeight: '600', marginLeft: 8 },
});