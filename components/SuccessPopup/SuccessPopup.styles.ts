import { Colors, Radius } from '@/constants/theme';
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    position: 'absolute',
    top: 24,
    left: 16,
    right: 16,
    zIndex: 9999,
    backgroundColor: Colors.successBg,
    borderRadius: Radius.md,
    padding: 14,
    alignItems: 'center',
  },
  text: {
    fontWeight: '700',
    fontSize: 15,
    color: '#065F46',
  },
});
