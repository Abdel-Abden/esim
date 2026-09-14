import { Colors } from '@ilotel/shared';
import { StyleSheet } from 'react-native';

/**
 * Styles de la carte esim affichée dans le Masonry — partagés par
 * CountryCard, qu'elle représente un esim unique (pays/monde) ou un
 * groupe de régions fusionnées (cf. CountryCard.tsx).
 */
export const cardStyles = StyleSheet.create({
  card: {
    backgroundColor: Colors.white,
    borderWidth: 2,
    borderColor: Colors.border,
    borderRadius: 18,
    padding: 14,
    marginBottom: 10,
    shadowColor: Colors.primary,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.06,
    shadowRadius: 8,
    elevation: 2,
  },
  cardAccent:    { backgroundColor: Colors.primaryLight },
  cardExhausted: { opacity: 0.5 },
  exhausted:     { fontSize: 19, fontWeight: '600', color: Colors.muted },
  flag:          { fontSize: 32, marginBottom: 8 },
  name:          { fontSize: 14, fontWeight: '800', color: Colors.text, marginBottom: 2 },
  sub:           { fontSize: 10, color: Colors.muted, marginBottom: 10, lineHeight: 14 },
  footer: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    justifyContent: 'space-between',
  },
  from:      { fontSize: 10, color: Colors.muted, lineHeight: 12 },
  price:     { fontSize: 19, fontWeight: '700', color: Colors.primary },
  priceDark: { color: Colors.primaryDark },

  promoBadge: {
    backgroundColor: Colors.promoGreenLight,
    borderRadius: 6,
    paddingHorizontal: 7,
    paddingVertical: 2,
    alignSelf: 'flex-start',
  },
    promoBadgeFloating: {
    position: 'absolute',
    right: 8,
    zIndex: 9,
  },
  promoText: { fontSize: 9, fontWeight: '800', color: Colors.promoGreen },
});
