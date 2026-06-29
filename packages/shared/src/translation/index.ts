import { DEFAULT_LANG } from '../constants.js';
import ar from './ar.json' with { type: 'json' };
import de from './de.json' with { type: 'json' };
import en from './en.json' with { type: 'json' };
import fr from './fr.json' with { type: 'json' };

export const esimsTranslations: Record<string, Translation> = { fr, en, de, ar } as const;
type GeoLang = keyof typeof esimsTranslations;
type Translation = {
  region: Record<string, string>;
  country: Record<string, string>;
}

export function getDisplayName(code: string, lang?: string): string {
  const l = (lang && lang in esimsTranslations ? lang : DEFAULT_LANG) as GeoLang;
  return esimsTranslations[l]['region'][code] ?? esimsTranslations[l]['country'][code] ?? code;
}