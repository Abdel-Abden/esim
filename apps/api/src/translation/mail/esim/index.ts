/**
 * src/translation/content/mail/esim/index.ts
 * Résolution du contenu email eSIM par langue.
 */

import { DEFAULT_LANG } from '@ilotel/shared';
import type { EsimEmailParams } from '../../../lib/email/index.js';
import { content as ar } from './ar.js';
import { content as de } from './de.js';
import { content as en } from './en.js';
import { content as fr } from './fr.js';

export interface ActivationStep { n: string; text: string; }

export interface EsimEmailContent {
  /** Fonction retournant le sujet de l'email */
  subject:         (p: EsimEmailParams) => string;
  /** Locale BCP 47 pour toLocaleDateString */
  dateLocale:      string;
  heroTitle:       string;
  days:            string;
  summaryLabel:    string;
  activationLabel: string;
  orManual:        string;
  rows: {
    destination: string;
    plan:        string;
    price:       string;
    iccid:       string;
    reference:   string;
    date:        string;
  };
  steps: {
    ios:     { title: string; steps: ActivationStep[] };
    android: { title: string; steps: ActivationStep[] };
  };
  footerHelp: string;
  rights:     string;
}

const LOCALES: Record<string, EsimEmailContent> = { fr, en, de, ar };

export function getEsimEmailContent(lang: string): EsimEmailContent {
  return LOCALES[lang] ?? LOCALES[DEFAULT_LANG];
}
