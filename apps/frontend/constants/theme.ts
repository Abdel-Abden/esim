export const Colors = {
  bg: '#FDF8F3',
  card: '#FFFFFF',
  primary: '#E8622A',
  primaryDark: '#B34B1E',
  primaryMid: '#F07A44',
  primaryLight: '#FDEEE6',
  accent: '#1A8A7A',
  accentLight: '#E0F5F2',
  text: '#2A1508',
  muted: '#9A7A68',
  border: '#F0D9C8',
  surface: '#FFF3EA',
  promoGreen: '#D97706',
  promoGreenLight: '#FEF3C7',
  successBg: '#E0F5F2',
  errorRed: '#DC2626',
  white: '#FFFFFF',
  overlay: 'rgba(42,21,8,0.06)',
  sand: '#F5E0CC',
} as const;

export const Spacing = {
  xs: 4,
  sm: 8,
  md: 12,
  lg: 16,
  xl: 20,
  xxl: 24,
} as const;

export const Radius = {
  sm: 10,
  md: 14,
  lg: 18,
} as const;

export const Typography = {
  h1: { fontSize: 22, fontWeight: '700' as const, color: Colors.text },
  h2: { fontSize: 18, fontWeight: '700' as const, color: Colors.text },
  h3: { fontSize: 15, fontWeight: '600' as const, color: Colors.text },
  body: { fontSize: 14, fontWeight: '400' as const, color: Colors.text },
  label: { fontSize: 14, fontWeight: '600' as const, color: Colors.text },
  muted: { fontSize: 13, fontWeight: '400' as const, color: Colors.muted },
  price: { fontSize: 15, fontWeight: '800' as const, color: Colors.primary },
  promo: { fontSize: 15, fontWeight: '800' as const, color: Colors.promoGreen },
} as const;

export const Shadow = {
  card: {
    shadowColor: '#2A1508',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.06,
    shadowRadius: 14,
    elevation: 3,
  },
  button: {
    shadowColor: '#E8622A',
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.28,
    shadowRadius: 20,
    elevation: 6,
  },
} as const;
