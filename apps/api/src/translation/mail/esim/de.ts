import { getDisplayName } from '@ilotel/shared';
import type { EsimEmailContent } from './index.js';

export const content: EsimEmailContent = {
  subject:         (p) => `Ihre eSIM ${p.flag} ${getDisplayName(p.code, p.lang)} ist bereit — ${p.dataGb} GB / ${p.durationDays} Tage`,
  dateLocale:      'de-DE',
  heroTitle:       'Ihre eSIM ist bereit! 🎉',
  days:            'Tage',
  summaryLabel:    '📋 Bestellübersicht',
  activationLabel: '🔑 Aktivierungscode',
  orManual:        'oder manuell eingeben',
  rows: {
    destination: 'Reiseziel',
    plan:        'Tarif',
    price:       'Bezahlter Preis',
    iccid:       'ICCID',
    reference:   'Referenz',
    date:        'Datum',
  },
  steps: {
    ios: {
      title: 'Aktivierung auf iPhone (iOS)',
      steps: [
        { n: '1', text: 'Einstellungen' },
        { n: '2', text: 'Mobile Daten → Tarif hinzufügen' },
        { n: '3', text: 'Daten manuell eingeben' },
        { n: '4', text: 'Aktivierungscode von oben einfügen' },
      ],
    },
    android: {
      title: 'Aktivierung auf Android',
      steps: [
        { n: '1', text: 'Netzwerk & Internet (oder Verbindungen)' },
        { n: '2', text: 'SIM → SIM oder eSIM hinzufügen' },
        { n: '3', text: 'Aktivierungscode eingeben' },
        { n: '4', text: 'Aktivierungscode von oben einfügen' },
      ],
    },
  },
  footerHelp: 'Haben Sie Fragen? Kontaktieren Sie uns unter ',
  rights:     'Alle Rechte vorbehalten',
};
