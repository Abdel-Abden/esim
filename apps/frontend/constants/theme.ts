export const Colors = {
  bg: '#F6F8FC',
  card: '#FFFFFF',
  primary: '#3B82F6',
  accent: '#8B5CF6',
  text: '#0F172A',
  muted: '#64748B',
  border: '#E5E7EB',
  surface: '#F9FAFB',
  promoGreen: '#22C55E',
  promoGreenLight: '#D1FAE5',
  successBg: '#D1FAE5',
  errorRed: '#EF4444',
  white: '#FFFFFF',
  overlay: 'rgba(0,0,0,0.06)',
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
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 6 },
    shadowOpacity: 0.06,
    shadowRadius: 18,
    elevation: 4,
  },
  button: {
    shadowColor: Colors.primary,
    shadowOffset: { width: 0, height: 10 },
    shadowOpacity: 0.18,
    shadowRadius: 24,
    elevation: 6,
  },
} as const;
