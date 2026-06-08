import { DEFAULT_LANG } from '../constants.js';
import ar from './ar.json';
import de from './de.json';
import en from './en.json';
import fr from './fr.json';

export const esimsTranslations = { fr, en, de, ar } as const;
type GeoLang = keyof typeof esimsTranslations;

export function getCountryName(code: string, lang?: string): string {
  const l = (lang && lang in esimsTranslations ? lang : DEFAULT_LANG) as GeoLang;
  return esimsTranslations[l]['region'][code] ?? esimsTranslations[l]['country'][code] ?? code;
}