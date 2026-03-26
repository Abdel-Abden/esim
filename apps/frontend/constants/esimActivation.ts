/**
 * constants/esimActivation.ts
 *
 * Source unique de vérité pour les étapes d'activation eSIM iOS et Android.
 * Utilisé par TutorialModal ET la page details — toute mise à jour ici
 * se répercute automatiquement sur les deux écrans.
 */

export interface ActivationStep {
  /** Numéro affiché dans le badge rond */
  n: string;
  /** Texte de l'étape */
  text: string;
}

/** Chemin d'activation eSIM sur iPhone (iOS) */
export const IOS_ACTIVATION_STEPS: ActivationStep[] = [
  { n: '1', text: 'Réglages' },
  { n: '2', text: 'Données cellulaires → Ajouter un forfait' },
  { n: '3', text: 'Entrer les informations manuellement' },
  { n: '4', text: 'Collez le code d\'activation' },
];

/** Chemin d'activation eSIM sur Android */
export const ANDROID_ACTIVATION_STEPS: ActivationStep[] = [
  { n: '1', text: 'Réseaux et internet (ou Connexions)' },
  { n: '2', text: 'SIM → Ajouter SIM ou carte eSIM' },
  { n: '3', text: 'Entrer un code d\'activation' },
  { n: '4', text: 'Collez le code d\'activation' },
];

/** Tokens de couleur pour le thème iOS (bleu) */
export const IOS_THEME = {
  accent:    '#0EA5E9',
  bg:        '#F0F9FF',
  border:    '#BAE6FD',
  text:      '#0C4A6E',
  title:     '#0369A1',
  badgeBg:   '#F0F9FF',
  badgeBorder: '#BAE6FD',
  badgeText: '#0369A1',
} as const;

/** Tokens de couleur pour le thème Android (vert) */
export const ANDROID_THEME = {
  accent:    '#22C55E',
  bg:        '#F0FDF4',
  border:    '#BBF7D0',
  text:      '#14532D',
  title:     '#15803D',
  badgeBg:   '#F0FDF4',
  badgeBorder: '#BBF7D0',
  badgeText: '#15803D',
} as const;