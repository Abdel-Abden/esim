import {
  applyDiscount,
  Discount,
  Esim,
  EsimInventory,
  EsimSummary,
  OfferWithDetails,
  OfferWithStock,
  Order,
  OrderStatus,
} from '@ilotel/shared';

// ─── Esim ─────────────────────────────────────────────────────────────────────

export function mapEsim(row: Record<string, unknown>): Esim {
  return {
    id: row.id as string,
    name: row.name as string,
    type: row.type as string,
    flag: row.flag as string,
    region: (row.region as string) ?? '',
    createdAt: String(row.created_at),
  };
}

/**
 * Mappe une ligne de la requête agrégée GET /esims
 * vers EsimSummary (minPrice, hasPromo, hasStock inclus).
 */
export function mapEsimSummary(row: Record<string, unknown>): EsimSummary {
  return {
    id: row.id as string,
    name: row.name as string,
    type: row.type as string,
    flag: row.flag as string,
    region: (row.region as string) ?? '',
    createdAt: String(row.created_at),
    minPrice: row.min_price != null ? Number(row.min_price) : null,
    hasPromo: Boolean(row.has_promo),
    hasStock: Boolean(row.has_stock),
  };
}

// ─── Offer ────────────────────────────────────────────────────────────────────

export function mapOfferWithDetails(row: Record<string, unknown>): OfferWithDetails {
  const esim: Esim = {
    id: row.esim_db_id as string,
    name: row.esim_name as string,
    type: row.esim_type as string,
    flag: row.esim_flag as string,
    region: (row.esim_region as string) ?? '',
    createdAt: String(row.esim_created_at),
  };

  const activeDiscount: Discount | null = row.discount_id
    ? {
        id: row.discount_id as string,
        offerId: row.id as string,
        type: row.discount_type as 'percentage' | 'fixed',
        value: Number(row.discount_value),
        active: true,
        startsAt: null,
        endsAt: null,
      }
    : null;

  const basePrice = Number(row.base_price);
  const finalPrice = row.final_price
    ? Number(row.final_price)
    : applyDiscount(basePrice, activeDiscount);

  return {
    id: row.id as string,
    esimId: row.esim_id as string,
    dataGb: Number(row.data_gb),
    esim: esim,
    durationDays: Number(row.duration_days),
    basePrice,
    stripePriceId: (row.stripe_price_id as string) ?? '',
    createdAt: String(row.created_at),
    activeDiscount,
    finalPrice,
  };
}

export function mapOfferWithStock(row: Record<string, unknown>): OfferWithStock {
  return {
    ...mapOfferWithDetails(row),
    availableCount: Number(row.available_count ?? 0),
  };
}

// ─── Inventory ────────────────────────────────────────────────────────────────

export function mapInventory(row: Record<string, unknown>): EsimInventory {
  return {
    id: row.id as string,
    esimId: row.esim_id as string,
    offerId: row.offer_id as string,
    iccid: row.iccid as string,
    status: row.status as 'available' | 'reserved' | 'sold',
    reservedAt: row.reserved_at ? String(row.reserved_at) : null,
    soldAt: row.sold_at ? String(row.sold_at) : null,
    orderId: (row.order_id as string) ?? null,
    activationCode: row.activation_code as string,
  };
}

// ─── Order ────────────────────────────────────────────────────────────────────

export function mapOrder(row: Record<string, unknown>): Order {
  return {
    id: row.id as string,
    email: row.email as string,
    offerId: row.offer_id as string,
    status: row.status as OrderStatus,
    stripePaymentIntentId: row.stripe_payment_intent_id as string,
    finalPrice: Number(row.final_price),
    discountId: (row.discount_id as string) ?? null,
    createdAt: String(row.created_at),
  };
}
