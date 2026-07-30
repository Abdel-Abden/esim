import { Colors } from '@ilotel/shared';
import { StyleSheet } from 'react-native';

export const carouselStyles = StyleSheet.create({
  wrap: { width: '100%' },
  slide: { justifyContent: 'center' },
  dotsRow: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    gap: 6,
    marginTop: 10,
  },
  dot: {
    width: 6,
    height: 6,
    borderRadius: 3,
    backgroundColor: Colors.border,
  },
  dotActive: {
    width: 16,
    backgroundColor: Colors.primary,
  },
});