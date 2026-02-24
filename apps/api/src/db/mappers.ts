import {
  applyDiscount,
  Discount,
  Esim,
  EsimInventory,
  OfferWithDetails,
  OfferWithStock,
  Order,
  OrderStatus
} from '@ilotel/shared';

export function mapEsim(row: Record<string, unknown>): Esim {
  return {
    id: row.id as string,
    name: row.name as string,
    type: row.type as string,
    flag: row.flag as string,
    createdAt: String(row.created_at),
  };
}

export function mapOfferWithDetails(row: Record<string, unknown>): OfferWithDetails {
  const esim: Esim = {
    id: row.esim_db_id as string,
    name: row.esim_name as string,
    type: row.esim_type as string,
    flag: row.esim_flag as string,
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
    durationDays: Number(row.duration_days),
    basePrice,
    stripePriceId: (row.stripe_price_id as string) ?? '',
    createdAt: String(row.created_at),
    esim,
    activeDiscount,
    finalPrice,
  };
}

export function mapInventory(row: Record<string, unknown>): EsimInventory {
  return {
    id: row.id as string,
    esimId: row.esim_id as string,
    iccid: row.iccid as string,
    status: row.status as 'available' | 'reserved' | 'sold',
    reservedAt: row.reserved_at ? String(row.reserved_at) : null,
    soldAt: row.sold_at ? String(row.sold_at) : null,
    orderId: (row.order_id as string) ?? null,
    activationCode: row.activationCode as string
  };
}

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

export function mapOfferWithStock(row: Record<string, unknown>): OfferWithStock {
  const esim: Esim = {
    id: row.esim_db_id as string,
    name: row.esim_name as string,
    type: row.esim_type as string,
    flag: row.esim_flag as string,
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
    durationDays: Number(row.duration_days),
    basePrice,
    stripePriceId: (row.stripe_price_id as string) ?? '',
    createdAt: String(row.created_at),
    esim,
    activeDiscount,
    finalPrice,
    availableCount: Number(row.available_count ?? 0),
  };
}