import { Colors } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const skeletonStyles = StyleSheet.create({
  // Miroir exact de cardStyles.card dans CountryCard.styles.ts
  card: {
    backgroundColor: Colors.white,
    borderWidth: 2,
    borderColor: Colors.border,
    borderRadius: 18,
    padding: 14,
    marginBottom: 10,
  },

  footer: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    justifyContent: 'space-between',
  },

  shimmerBase: {
    backgroundColor: '#EEF0F4',
    overflow: 'hidden',
  },

  // Miroir exact de masonryRow / masonryCol dans index.styles.ts
  masonryRow: {
    flexDirection: 'row',
    gap: 10,
  },
  masonryCol: {
    flex: 1,
  },
});
