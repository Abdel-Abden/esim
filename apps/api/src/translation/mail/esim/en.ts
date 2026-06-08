import { getCountryName } from '@ilotel/shared';
import type { EsimEmailContent } from './index.js';

export const content: EsimEmailContent = {
  subject:         (p) => `Your eSIM ${p.flag} ${getCountryName(p.code, p.lang)} is ready — ${p.dataGb} GB / ${p.durationDays} days`,
  dateLocale:      'en-GB',
  heroTitle:       'Your eSIM is ready! 🎉',
  days:            'days',
  summaryLabel:    '📋 Order summary',
  activationLabel: '🔑 Activation code',
  orManual:        'or enter manually',
  rows: {
    destination: 'Destination',
    plan:        'Plan',
    price:       'Price paid',
    iccid:       'ICCID',
    reference:   'Reference',
    date:        'Date',
  },
  steps: {
    ios: {
      title: 'Activation on iPhone (iOS)',
      steps: [
        { n: '1', text: 'Settings' },
        { n: '2', text: 'Cellular → Add eSIM' },
        { n: '3', text: 'Enter details manually' },
        { n: '4', text: 'Paste the activation code above' },
      ],
    },
    android: {
      title: 'Activation on Android',
      steps: [
        { n: '1', text: 'Network & internet (or Connections)' },
        { n: '2', text: 'SIM → Add SIM or eSIM' },
        { n: '3', text: 'Enter activation code' },
        { n: '4', text: 'Paste the activation code above' },
      ],
    },
  },
  footerHelp: 'Need help? Contact us at ',
  rights:     'All rights reserved',
};
