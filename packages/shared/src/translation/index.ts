import ar from './ar.json';
import de from './de.json';
import en from './en.json';
import fr from './fr.json';

export const esimsTranslations = { fr, en, de, ar } as const;
type GeoLang = keyof typeof esimsTranslations;

export function getCountryName(code: string, lang: string): string {
  const l = (lang in esimsTranslations ? lang : 'fr') as GeoLang;
  return esimsTranslations[l][code] ?? esimsTranslations.fr[code] ?? code;
}