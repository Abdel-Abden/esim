/**
 * src/translation/index.ts
 *
 * Point d'entrée partagé pour toutes les traductions de l'API.
 * - Constantes de marque centralisées (BRAND)
 * - Résolution de langue (resolveLang)
 * - Accès au contenu web (getWebLocale)
 * - Accès au contenu mail (getMailContent)
 */

// ─── Contenu web ──────────────────────────────────────────────────────────────
import * as cgu from './web/cgu/index.js';
import * as deleteData from './web/delete/index.js';
import * as landing from './web/landing/index.js';
import * as mentions from './web/mentions/index.js';
import * as privacy from './web/privacy/index.js';

// ─── Contenu mail ─────────────────────────────────────────────────────────────
import { AVAILABLE_LANGS, DEFAULT_LANG } from '@ilotel/shared';
import { getEsimEmailContent, type EsimEmailContent } from './mail/esim/index.js';

// ─── Résolution de langue ─────────────────────────────────────────────────────

/**
 * Résout la langue depuis Accept-Language et/ou un query param explicite.
 * Le query param est prioritaire (permet au frontend de forcer la langue).
 * Fallback : DEFAULT_LANG si aucune langue dispo n'est trouvée.
 */
export function resolveLang(
  acceptLanguage: string | undefined,
  queryLang?: string,
): string {
  if (queryLang && AVAILABLE_LANGS.has(queryLang)) return queryLang;

  if (!acceptLanguage) return DEFAULT_LANG;

  const candidates = acceptLanguage
    .split(',')
    .map((entry) => entry.trim().split(';')[0].trim().split('-')[0].toLowerCase());

  for (const lang of candidates) {
    if (AVAILABLE_LANGS.has(lang)) return lang;
  }

  return DEFAULT_LANG;
}

// ─── Accès contenu web ────────────────────────────────────────────────────────

interface WebLocale {
  lang:       string;
  landing:    {ui: any};
  cgu:        {body: any, ui: any};
  privacy:    {body: any, ui: any};
  mentions:   {body: any, ui: any};
  deleteData: {ui: any};
}

const WEB_LOCALES: Record<string, Omit<WebLocale, 'lang'>> = {
  fr: { cgu: cgu['fr'], privacy: privacy['fr'], mentions: mentions['fr'], deleteData: deleteData['fr'], landing: landing['fr'] },
  en: { cgu: cgu['en'], privacy: privacy['en'], mentions: mentions['en'], deleteData: deleteData['en'], landing: landing['en'] },
  // de: { cgu: cgu['de'], privacy: privacy['de'], mentions: mentions['de'], deleteData: deleteData['de']},
  ar: { cgu: cgu['ar'], privacy: privacy['ar'], mentions: mentions['ar'], deleteData: deleteData['ar'], landing: landing['ar'] },
};

export function getWebLocale(
  acceptLanguage: string | undefined,
  queryLang?: string,
): WebLocale {
  const lang = resolveLang(acceptLanguage, queryLang);
  return { lang, ...WEB_LOCALES[lang] };
}

// ─── Accès contenu mail ───────────────────────────────────────────────────────

export type { EsimEmailContent };

export function getEsimContent(lang: string): EsimEmailContent {
  return getEsimEmailContent(lang);
}