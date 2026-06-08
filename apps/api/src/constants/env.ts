/**
 * Constantes et helpers liés aux variables d'environnement de l'API.
 *
 * ENVIRONMENT peut valoir : "local" | "preprod" | "prod"
 * Si absent, on considère qu'on est en local.
 */

/** Retourne true si on tourne en environnement local (ou si ENVIRONMENT est absent). */
export function isLocal(): boolean {
  const env = process.env.ENVIRONMENT;
  return !!env && (env === "local") ;
}

/**
 * Retourne l'adresse email réelle du destinataire en production,
 * ou DEV_EMAIL en local — pour éviter d'envoyer des emails aux vrais clients pendant le dev.
 *
 * @example
 *   to: resolveEmailRecipient(order.email)
 */
export function resolveEmailRecipient(realEmail: string): string {
  const email = process.env.EMAIL_FROM
  if (!email) {
    throw Error("EMAIL_FROM is not set")
  }

  return isLocal() ? email : realEmail;
}

// ─── Constantes de marque ─────────────────────────────────────────────────────

/**
 * Constantes globales ILOTEL.
 * Centralisées ici pour éviter toute duplication dans les fichiers de contenu.
 * Un changement ici se répercute sur tous les templates mail et web.
 */
export const BRAND = {
  name:        'ILOTEL',
  appName:     'ILOTEL eSIM',
  support:     'support@ilotel.com',
  dpo:         'dpo@ilotel.com',
  legalUrl:    'https://api.ilotel.com/legal',
  year:        new Date().getFullYear(),
} as const;