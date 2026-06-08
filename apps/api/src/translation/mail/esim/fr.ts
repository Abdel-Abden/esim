import { getCountryName } from '@ilotel/shared';
import type { EsimEmailContent } from './index.js';

export const content: EsimEmailContent = {
  subject:         (p) => `Votre eSIM ${p.flag} ${getCountryName(p.code, p.lang)} est prête — ${p.dataGb} Go / ${p.durationDays}j`,
  dateLocale:      'fr-FR',
  heroTitle:       'Votre eSIM est prête ! 🎉',
  days:            'jours',
  summaryLabel:    '📋 Récapitulatif de commande',
  activationLabel: '🔑 Code d\'activation',
  orManual:        'ou saisir manuellement',
  rows: {
    destination: 'Destination',
    plan:        'Forfait',
    price:       'Prix payé',
    iccid:       'ICCID',
    reference:   'Référence',
    date:        'Date',
  },
  steps: {
    ios: {
      title: 'Activation sur iPhone (iOS)',
      steps: [
        { n: '1', text: 'Réglages' },
        { n: '2', text: 'Données cellulaires → Ajouter un forfait' },
        { n: '3', text: 'Entrer les informations manuellement' },
        { n: '4', text: 'Collez le code d\'activation ci-dessus' },
      ],
    },
    android: {
      title: 'Activation sur Android',
      steps: [
        { n: '1', text: 'Réseaux et internet (ou Connexions)' },
        { n: '2', text: 'SIM → Ajouter SIM ou carte eSIM' },
        { n: '3', text: 'Entrer un code d\'activation' },
        { n: '4', text: 'Collez le code d\'activation ci-dessus' },
      ],
    },
  },
  footerHelp: 'Un problème ? Contactez-nous à ',
  rights:     'Tous droits réservés',
};
