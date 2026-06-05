import * as Localization from 'expo-localization';
import i18n, { t } from 'i18next';
import { initReactI18next } from 'react-i18next';
import { Platform } from 'react-native';

import { ApiError } from '@ilotel/shared';
import arTranslations from './locales/ar.json';
import deTranslations from './locales/de.json';
import enTranslations from './locales/en.json';
import frTranslations from './locales/fr.json';

const resources = {
  fr: { translation: frTranslations },
  en: { translation: enTranslations },
  de: { translation: deTranslations },
  ar: { translation: arTranslations },
};

i18n
  .use(initReactI18next)
  .init({
    resources,
    lng: Platform.OS === 'android' ? Localization.getLocales()[0]?.languageCode : 'fr',
    fallbackLng: 'en',
    interpolation: {
      escapeValue: false,
    },
    compatibilityJSON: 'v3',
  });

export default i18n;

export const LOCALE_MAP: Record<string, string> = {
  fr: 'fr-FR',
  en: 'en-GB',
  de: 'de-DE',
  ar: 'ar-SA',
};

export const DEFAULT_LANG = "en-EN"

export const RTL_LANGS = new Set(['ar', 'he', 'fa', 'ur']);

/** Traduit un code d'erreur API ou retourne le message brut en fallback */
export function apiError(error: string | null, fallbackKey: string): string {
  if (!error) return t(fallbackKey);
  try {
    const parsed: ApiError = JSON.parse(error);
    if (parsed.code) return t(`errors.${parsed.code}`);
  } catch {}
  return error;
}