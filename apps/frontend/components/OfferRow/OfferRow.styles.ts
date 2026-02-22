import { Colors, Radius } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    padding: 14,
    borderRadius: Radius.md,
    backgroundColor: Colors.surface,
    borderWidth: 1,
    borderColor: Colors.border,
    gap: 12,
  },
  rowSelected: {
    borderColor: 'rgba(59, 130, 246, 0.55)',
    backgroundColor: 'rgba(59, 130, 246, 0.06)',
  },
  radio: {
    width: 20,
    height: 20,
    borderRadius: 10,
    borderWidth: 2,
    borderColor: Colors.border,
    alignItems: 'center',
    justifyContent: 'center',
  },
  radioSelected: {
    borderColor: Colors.primary,
  },
  radioDot: {
    width: 10,
    height: 10,
    borderRadius: 5,
    backgroundColor: Colors.primary,
  },
  label: {
    flex: 1,
    fontSize: 14,
    fontWeight: '600',
    color: Colors.text,
  },
  price: {
    fontSize: 15,
    fontWeight: '800',
    color: Colors.primary,
    whiteSpace: 'nowrap' as any,
  },
  promoPrice: {
    color: Colors.promoGreen,
  },
  originalPrice: {
    fontSize: 11,
    color: Colors.muted,
    textDecorationLine: 'line-through',
  },
});
