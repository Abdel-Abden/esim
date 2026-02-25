// =============================================================================
// ILOTEL — Shared Types
// Source de vérité pour le frontend et l'API
// =============================================================================

export const RESERVATION_DURATION_MINUTES = 5;

// -----------------------------------------------------------------------------
// Entités BDD (reflètent exactement les tables Neon)
// -----------------------------------------------------------------------------

/**
 * Table `esims`
 * Représente une destination / un produit eSIM (ex: "France", "Europe")
 */
export interface Esim {
  id: string;           // uuid
  name: string;         // ex: "France", "Europe 30 pays"
  type: string;         // ex: "country" | "region" | "global"
  flag: string;         // ex: "🇫🇷" ou code ISO "FR"
  createdAt: string;    // timestamp ISO
}

/**
 * Table `offers`
 * Un forfait lié à une destination.
 * ⚠️  stripe_price_id se retrouve sur stripe 
 */
export interface Offer {
  id: string;
  esimId: string;         // FK → esims.id
  dataGb: number;         // ex: 5
  durationDays: number;   // ex: 7
  basePrice: number;      // en euros, ex: 9.99
  stripePriceId: string;  // ex: "price_1Abc..."
  createdAt: string;
}

/**
 * Table `discounts`
 * Réduction applicable sur une offre.
 * type = "percentage" → value = 20 signifie -20%
 * type = "fixed"      → value = 5  signifie -5€
 */
export interface Discount {
  id: string;
  offerId: string;        // FK → offers.id
  type: DiscountType;
  value: number;
  active: boolean;
  startsAt: string | null;
  endsAt: string | null;
}

export type DiscountType = 'percentage' | 'fixed';

/**
 * Table `esim_inventory`
 * Stock physique de cartes eSIM (iccid) assignables à une commande.
 */
export interface EsimInventory {
  id: string;
  esimId: string;           // FK → esims.id
  offerId: string;          // FK → offers.id — carte liée à une offre précise
  iccid: string;            // identifiant unique de la carte eSIM
  status: InventoryStatus;
  reservedAt: string | null;
  soldAt: string | null;
  activationCode: string;
  orderId: string | null;   // FK → orders.id
}

export type InventoryStatus = 'available' | 'reserved' | 'sold';

/**
 * Table `orders`
 * Les différent commande enregistrer et leur état.
 */
export interface Order {
  id: string;
  email: string;
  offerId: string;                // FK → offers.id
  status: OrderStatus;
  stripePaymentIntentId: string;
  finalPrice: number;             // prix payé (après réduction éventuelle)
  discountId: string | null;      // FK → discounts.id
  createdAt: string;
}

export type OrderStatus = 'pending' | 'paid' | 'failed' | 'provisioned';

// -----------------------------------------------------------------------------
// Vues enrichies (jointures → utilisées dans les réponses API)
// -----------------------------------------------------------------------------

/** Offre avec destination + réduction active → GET /esims/:id/offers */
export interface OfferWithDetails extends Offer {
  esim: Esim;
  activeDiscount: Discount | null;
  finalPrice: number; // calculé côté API
}

/** Commande complète → GET /orders/:id */
export interface OrderWithDetails extends Order {
  offer: OfferWithDetails;
  esimInventory: EsimInventory | null; // null si pas encore provisionné
}

// -----------------------------------------------------------------------------
// Contrats API (Request / Response)
// -----------------------------------------------------------------------------

// POST /orders
export interface CreateOrderRequest {
  offerId: string;
  email: string;
}

export interface CreateOrderResponse {
  orderId: string;
  customerId: string;   // Stripe Customer ID
  ephemeralKey: string; // Stripe EphemeralKey secret
  clientSecret: string; // Stripe PaymentIntent client_secret
  finalPrice: number;
}

// POST /orders/:id/cancel
export interface CancelOrderResponse {
  success: boolean;
}

// GET /esims
export type GetEsimsResponse = Esim[];

// GET /esims/:id/offers
export type GetOffersResponse = OfferWithStock[];

// GET /orders/:id
export type GetOrderResponse = OrderWithDetails;

// -----------------------------------------------------------------------------
// Types UI — frontend uniquement (pas de BDD)
// -----------------------------------------------------------------------------

/** Panier Zustand */
export interface CartItem {
  offerId: string;
  esimId: string;
  country: string;
  flag: string;
  offer: string;      // ex: "5 Go / 7 jours"
  basePrice: number;
  finalPrice: number; // après réduction
  isPromo: boolean;
}

/** eSIM activée affichée dans l'espace client */
export interface ActiveEsim {
  orderId: string;
  country: string;
  flag: string;
  offer: string;
  price: number;
  iccid: string;
  activatedAt: string;
}

// -----------------------------------------------------------------------------
// Helpers — utilisables côté API et frontend
// -----------------------------------------------------------------------------

/** Formate une offre en label lisible */
export function formatOfferLabel(
  offer: Pick<Offer, 'dataGb' | 'durationDays'>
): string {
  return `${offer.dataGb} Go / ${offer.durationDays} jours`;
}

/** Calcule le prix final après réduction */
export function applyDiscount(
  basePrice: number,
  discount: Discount | null
): number {
  if (!discount || !discount.active) return basePrice;
  if (discount.type === 'percentage') {
    return Math.round(basePrice * (1 - discount.value / 100) * 100) / 100;
  }
  return Math.max(0, Math.round((basePrice - discount.value) * 100) / 100);
}

// ─── Stock ────────────────────────────────────────────────────────────────────

/** Offre avec disponibilité — étend OfferWithDetails */
export interface OfferWithStock extends OfferWithDetails {
  availableCount: number; // 0 = épuisé
}

// POST /orders/reserve
export interface ReserveOrderRequest {
  offerId: string;
}

export interface ReserveOrderResponse {
  orderId: string;
  expiresAt: string; // timestamp ISO — réservation valide 5 minutes
}

// POST /orders/:id/checkout
export interface CheckoutOrderRequest {
  email: string;
}

export interface CheckoutOrderResponse {
  orderId: string;
  customerId: string;
  ephemeralKey: string;
  clientSecret: string;
  finalPrice: number;
}

// GET /esims/:id/offers — remplace GetOffersResponse
export type GetOffersWithStockResponse = OfferWithStock[];