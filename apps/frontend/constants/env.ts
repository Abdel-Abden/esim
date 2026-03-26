/**
 * constants/env.ts
 *
 * Helper côté frontend pour lire les variables d'environnement Expo.
 * Les variables exposées au bundle doivent commencer par EXPO_PUBLIC_.
 *
 * Dans .env.local  →  EXPO_PUBLIC_ENVIRONMENT=local
 * En staging       →  EXPO_PUBLIC_ENVIRONMENT=staging
 * En production    →  EXPO_PUBLIC_ENVIRONMENT=production  (ou absent)
 */

/** Valeur brute de la variable d'environnement. */
const RAW_ENV = process.env.EXPO_PUBLIC_ENVIRONMENT;

/** Valeur normalisée de l'environnement courant. */
type Env = 'local' | 'preprod' | 'prod';

export const ENVIRONMENT: Env =
  RAW_ENV === 'local' || RAW_ENV === 'preprod' || RAW_ENV === 'prod'
    ? RAW_ENV
    : 'prod';

export const IS_LOCAL = ENVIRONMENT === 'local';

/** Identifiant sentinelle utilisé comme orderId pour le mode debug. */
export const DEBUG_ORDER_ID = '__debug__';
