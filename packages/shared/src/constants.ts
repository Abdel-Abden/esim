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

export type SegFilter = 'all' | 'country' | RegionCode | 'promo';
 
export const SEGS: { key: SegFilter }[] = [
  { key: 'all'     },
  { key: 'country' },
  { key: 'eu'      },
  { key: 'as'      },
  { key: 'af'      },
  { key: 'am'      },
  { key: 'oc'      },
  { key: 'me'      },
  { key: 'ww'      },
  { key: 'promo'   },
];