/**
 * packages/shared/src/errors.ts
 *
 * Contrat d'erreur partagé entre l'API et le frontend.
 * L'API retourne un { code: ErrorCode }, le frontend traduit via t(`errors.${code}`).
 */

export const ErrorCode = {
  // ─── Offres ──────────────────────────────────────────────────────────────
  OFFER_ID_REQUIRED:    'OFFER_ID_REQUIRED',
  OFFER_NOT_FOUND:      'OFFER_NOT_FOUND',
  OFFER_NOT_FOR_SALE:   'OFFER_NOT_FOR_SALE',
  STOCK_EXHAUSTED:      'STOCK_EXHAUSTED',

  // ─── Commandes ───────────────────────────────────────────────────────────
  ORDER_NOT_FOUND:      'ORDER_NOT_FOUND',
  EMAIL_REQUIRED:       'EMAIL_REQUIRED',
  RESERVATION_EXPIRED:  'RESERVATION_EXPIRED',
  CANCEL_INVALID_STATUS:'CANCEL_INVALID_STATUS',

  // ─── Destinations ────────────────────────────────────────────────────────
  DESTINATION_NOT_FOUND:'DESTINATION_NOT_FOUND',
  INVALID_ID:           'INVALID_ID',

  // ─── Serveur ────────────────────────────────────────────────────────
  INTERNAL_SERVER_ERROR: 'INTERNAL_SERVER_ERROR',
  PATH_NOT_FOUND: 'PATH_NOT_FOUND', 
} as const;

export type ErrorCode = typeof ErrorCode[keyof typeof ErrorCode];

/** Shape retournée par l'API pour toutes les erreurs */
export interface ApiError {
  code: ErrorCode;
}
