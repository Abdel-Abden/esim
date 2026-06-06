/**
 * src/routes/legal/content/index.ts
 *
 * Point d'entrée unique pour le contenu légal.
 * Résout la langue depuis le header Accept-Language et retourne
 * le contenu + les chaînes UI correspondantes.
 *
 * Ajouter une langue : créer content/{lang}/ avec les 4 fichiers,
 * l'importer ici et l'ajouter dans LOCALES.
 */

import { cgu as cguFr } from './fr/cgu.js';
import { mentions as mentionsFr } from './fr/mentions.js';
import { privacy as privacyFr } from './fr/privacy.js';
import { ui as uiFr, type UiStrings } from './fr/ui.js';

import { cgu as cguEn } from './en/cgu.js';
import { mentions as mentionsEn } from './en/mentions.js';
import { privacy as privacyEn } from './en/privacy.js';
import { ui as uiEn } from './en/ui.js';

import { cgu as cguDe } from './de/cgu.js';
import { mentions as mentionsDe } from './de/mentions.js';
import { privacy as privacyDe } from './de/privacy.js';
import { ui as uiDe } from './de/ui.js';

import { DEFAULT_LANG } from '@ilotel/shared';
import { cgu as cguAr } from './ar/cgu.js';
import { mentions as mentionsAr } from './ar/mentions.js';
import { privacy as privacyAr } from './ar/privacy.js';
import { ui as uiAr } from './ar/ui.js';

// ─── Registre des locales disponibles ────────────────────────────────────────

interface Locale {
  cgu:      string;
  privacy:  string;
  mentions: string;
  ui:       UiStrings;
}

const LOCALES: Record<string, Locale> = {
  fr: { cgu: cguFr, privacy: privacyFr, mentions: mentionsFr, ui: uiFr },
  en: { cgu: cguEn, privacy: privacyEn, mentions: mentionsEn, ui: uiEn },
  de: { cgu: cguDe, privacy: privacyDe, mentions: mentionsDe, ui: uiDe },
  ar: { cgu: cguAr, privacy: privacyAr, mentions: mentionsAr, ui: uiAr },
};

// ─── Résolution de langue ─────────────────────────────────────────────────────

/**
 * Extrait la langue principale depuis le header Accept-Language.
 * Retourne toujours une locale disponible (fallback : DEFAULT_LANG).
 *
 * Exemples :
 *   'fr-FR,fr;q=0.9,en;q=0.8' → 'fr'
 *   'ar-SA,ar;q=0.9'           → 'ar'
 *   'de-AT,de;q=0.9,en;q=0.8' → 'de'
 *   'ja-JP,ja;q=0.9'           → 'fr'  (ja non dispo → fallback)
 *   undefined                   → 'fr'
 */
export function resolveLang(acceptLanguage: string | undefined): string {
  if (!acceptLanguage) return DEFAULT_LANG;

  const candidates = acceptLanguage
    .split(',')
    .map((entry) => {
      const [tag] = entry.trim().split(';');
      return tag.trim().split('-')[0].toLowerCase();
    });

  for (const lang of candidates) {
    if (lang in LOCALES) return lang;
  }

  return DEFAULT_LANG;
}

/**
 * Retourne le contenu et les chaînes UI pour la langue résolue.
 */
export function getLocale(acceptLanguage: string | undefined): { lang: string } & Locale {
  const lang = resolveLang(acceptLanguage);
  return { lang, ...LOCALES[lang] };
}
