import { Colors } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const featuredStyles = StyleSheet.create({
  card: {
    backgroundColor: Colors.white,
    borderWidth: 2,
    borderColor: Colors.border,
    borderRadius: 20,
    padding: 16,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 14,
    shadowColor: Colors.primary,
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.08,
    shadowRadius: 14,
    elevation: 3,
  },

  // Icône du pays (flag dans un carré arrondi)
  iconBox: {
    width: 54,
    height: 54,
    borderRadius: 16,
    backgroundColor: Colors.primaryLight,
    borderWidth: 2,
    borderColor: Colors.border,
    alignItems: 'center',
    justifyContent: 'center',
    flexShrink: 0,
  },
  iconFlag: {
    fontSize: 26,
  },

  // Bloc central : nom, description, prix
  info: {
    flex: 1,
  },
  name: {
    fontSize: 16,
    fontWeight: '800',
    color: Colors.text,
    marginBottom: 2,
  },
  desc: {
    fontSize: 12,
    color: Colors.muted,
    marginBottom: 7,
    lineHeight: 16,
  },
  priceTag: {
    alignSelf: 'flex-start',
    backgroundColor: Colors.primaryLight,
    borderRadius: 8,
    paddingHorizontal: 10,
    paddingVertical: 4,
  },
  priceTagText: {
    fontSize: 12,
    fontWeight: '800',
    color: Colors.primaryDark,
  },

  // Bouton flèche à droite
  arrowBtn: {
    width: 36,
    height: 36,
    backgroundColor: Colors.primary,
    borderRadius: 10,
    alignItems: 'center',
    justifyContent: 'center',
    flexShrink: 0,
    shadowColor: Colors.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 12,
    elevation: 4,
  },

  // État épuisé
  exhausted: {
    opacity: 0.5,
  },
});
