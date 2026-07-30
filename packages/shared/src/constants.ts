export const RESERVATION_DURATION_MINUTES = 5;

export const DEFAULT_LANG = "en"

export const AVAILABLE_LANGS = new Set(['fr', 'en', 'ar']);

export const RTL_LANGS  = new Set(['ar', 'he', 'fa', 'ur']);

export const LOCALE_TIME_MAP: Record<string, string> = {
  fr: 'fr-FR',
  en: 'en-GB',
  ar: 'ar-SA',
};

export const SUPPORT_EMAIL = "support@ilotel.com"

export const REGION_CODES = ['eu', 'as', 'af', 'am', 'oc', 'me', 'ww'] as const;
export type RegionCode = typeof REGION_CODES[number];

export type SegFilter = 'local' | "region" | 'global';
 
export const SEGS: { key: SegFilter }[] = [
  { key: 'local' },
  { key: 'region'  },
  { key: 'global'   },
];