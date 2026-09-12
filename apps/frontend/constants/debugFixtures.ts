/**
 * constants/debugFixtures.ts
 *
 * Données de test réalistes pour le mode debug local.
 * Uniquement importé quand EXPO_PUBLIC_ENVIRONMENT=local (ou absent).
 *
 * Permet de tester la page /details sans passer par le tunnel Stripe.
 */
import { DestinationType, Order } from '@ilotel/shared';

/**
 * Fausse commande complète imitant une réponse réelle de GET /orders/:id.
 *
 * Le activationCode est volontairement long et réaliste —
 * c'est le format LPA: utilisé par les vraies eSIM (RFC 5087).
 */
export const DEBUG_ORDER: Order = {
  // ── Order ────────────────────────────────────────────────────────────────
  id: 'debug-order-00000000-0000-0000-0000-000000000001',
  email: 'dev@ilotel.com',
  status: 'provisioned',
  stripePaymentIntentId: 'pi_debug_000000000000',
  finalPrice: 12.99,
  createdAt: new Date().toISOString(),

  // ── Offer + Esim ─────────────────────────────────────────────────────────
  offer: {
    id: 'debug-offer-001',
    dataQuantity: 10,
    durationQuantity: 15,
    basePrice: 19.99,
    stripePriceId: 'price_debug_000',
    finalPrice: 12.99,
    dataUnit: 'Go',
    durationUnit: 'days',
    providerProductId: '',
    available: true
  },

  destination: {
    id: 'debug-esim-jp',
    code: 'jp',
    type: DestinationType.REGION,
    flag: '🇯🇵',
    region: 'asia',
    minPrice: null,
    hasPromo: false,
    featured: false,
    coverage: JSON.parse('{"jp": {"KDDI": {"2G": false, "3G": false, "4G": true, "5G": true}, "NTT Docomo": {"2G": false, "3G": true, "4G": true, "5G": true}}}')
  },

  esim: {
    id: '1',
    iccid: '47528665896641628125',
    msisdn: '604940259407746',
    activationCode: 'LPA:1$code.demo.com$TDNZAGLPJJLNK96907FCGPXE22FUHUKK',
    reservedAt: null,
    soldAt: null,
    status: 'assigned'
  },
  lang: 'fr'
};
