/**
 * constants/debugFixtures.ts
 *
 * Données de test réalistes pour le mode debug local.
 * Uniquement importé quand EXPO_PUBLIC_ENVIRONMENT=local (ou absent).
 *
 * Permet de tester la page /details sans passer par le tunnel Stripe.
 */
import { OrderWithDetails } from '@ilotel/shared';

/**
 * Fausse commande complète imitant une réponse réelle de GET /orders/:id.
 *
 * Le activationCode est volontairement long et réaliste —
 * c'est le format LPA: utilisé par les vraies eSIM (RFC 5087).
 */
export const DEBUG_ORDER: OrderWithDetails = {
  // ── Order ────────────────────────────────────────────────────────────────
  id: 'debug-order-00000000-0000-0000-0000-000000000001',
  email: 'dev@ilotel.com',
  offerId: 'debug-offer-001',
  status: 'provisioned',
  stripePaymentIntentId: 'pi_debug_000000000000',
  finalPrice: 12.99,
  discountId: 'debug-discount-001',
  createdAt: new Date().toISOString(),

  // ── Offer + Esim ─────────────────────────────────────────────────────────
  offer: {
    id: 'debug-offer-001',
    esimId: 'debug-esim-jp',
    dataGb: 10,
    durationDays: 15,
    basePrice: 19.99,
    stripePriceId: 'price_debug_000',
    createdAt: new Date().toISOString(),
    finalPrice: 12.99,
    activeDiscount: {
      id: 'debug-discount-001',
      offerId: 'debug-offer-001',
      type: 'percentage',
      value: 35,
      active: true,
      startsAt: null,
      endsAt: null,
    },
    esim: {
      id: 'debug-esim-jp',
      name: 'Japon',
      type: 'country',
      flag: '🇯🇵',
      region: 'asia',
      createdAt: new Date().toISOString(),
    },
  },

  // ── eSIM Inventory ───────────────────────────────────────────────────────
  esimInventory: {
    id: 'debug-inventory-001',
    esimId: 'debug-esim-jp',
    offerId: 'debug-offer-001',
    // Format LPA réaliste (sans être un vrai code utilisable)
    activationCode:
      'LPA:1$smdp.debug.ilotel.com$DEBUGACTIVATIONCODE1234567890ABCDEF',
    iccid: '8933012345678901234',
    status: 'sold',
    reservedAt: new Date().toISOString(),
    soldAt: new Date().toISOString(),
    orderId: 'debug-order-00000000-0000-0000-0000-000000000001',
  },
};
