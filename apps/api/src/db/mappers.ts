import {
  CountryNetworkInfo,
  Destination,
  DestinationEntity,
  DestinationType,
  Discount,
  DiscountType,
  Esim,
  EsimStatus,
  Offer,
  OfferDataUnit,
  OfferDurationUnit,
  Order,
  OrderEntity,
  OrderStatus
} from '@ilotel/shared';

// ─── Destination ─────────────────────────────────────────────────────────────────────

export function mapDestinationEntity(row: Record<string, unknown>): DestinationEntity {
  return {
    id: row.id as string,
    code: row.code as string,
    type: row.type as DestinationType,
    flag: row.flag as string,
    region: (row.region as string) ?? '',
    coverage: row.region_countries as Record<string, Record<string, CountryNetworkInfo>>,
    featured: Boolean(row.featured),
  };
}

/**
 * Mappe une ligne de la requête agrégée GET /destinations
 * vers Destination (minPrice, hasPromo, hasStock inclus).
 */
export function mapDestination(row: Record<string, unknown>): Destination {
  return {
    id: row.id as string,
    code: row.code as string,
    type: row.type as DestinationType,
    flag: row.flag as string,
    region: (row.region as string) ?? '',
    minPrice: row.min_price != null ? Number(row.min_price) : null,
    hasPromo: Boolean(row.has_promo),
    coverage: row.coverage as Record<string, Record<string, CountryNetworkInfo>>,
    featured: Boolean(row.featured),
  };
}

// ─── Offer ────────────────────────────────────────────────────────────────────

export function mapOffer(row: Record<string, unknown>): Offer {
  const basePrice = Number(row.base_price);
  let finalPrice: number = basePrice;

  if (row.discount_id) {
    switch (row.discount_type) {
      case DiscountType.PERCENTAGE:
        finalPrice = Math.round(
          Number(row.base_price) - (Number(row.base_price) * Number(row.discount_value) / 100)
        );
        break;

      case DiscountType.FIXED:
        finalPrice = Math.max(
          0,
          Number(row.base_price) - Number(row.discount_value)
        );
        break;
    }
  }

  const discount: Discount = {
    value: row.discount_value as number,
    type: row.discount_type as DiscountType,
  };

  return {
    id: row.id as string,
    dataQuantity: row.data_quantity as number,
    dataUnit: row.data_unit as OfferDataUnit,
    durationQuantity: row.duration_quantity as number,
    durationUnit: row.duration_unit as OfferDurationUnit,
    basePrice: Number(row.base_price),
    available: row.available as boolean,
    stripePriceId: row.stripe_price_id as string,
    discount,
    finalPrice,
    providerProductId: row.provider_product_id as string,
  };
}

// ─── Inventory ────────────────────────────────────────────────────────────────

export function mapEsim(row: Record<string, unknown>): Esim {
  return {
    id: row.id as string,
    iccid: row.iccid as string,
    status: row.status as EsimStatus,
    reservedAt: row.reserved_at ? String(row.reserved_at) : null,
    soldAt: row.sold_at ? String(row.sold_at) : null,
    activationCode: row.activation_code as string,
    msisdn: row.msisdn as string,
  };
}

// ─── Order ────────────────────────────────────────────────────────────────────

export function mapOrder(row: Record<string, unknown>): OrderEntity {
  return {
  id: row.id as string,
  email: row.email as string,
  status: row.status as OrderStatus,
  lang: row.lang as string,
  stripePaymentIntentId: row.stripe_payment_intent_id as string,
  finalPrice: Number(row.final_price),
  createdAt: String(row.created_at),
  offerId: row.offer_id as string,
};
}

export function mapOrderDetails(row: Record<string, unknown>): Order {
  const basePrice = Number(row.base_price);

  let finalOfferPrice = basePrice;

  if (row.discount_id) {
    switch (row.discount_type) {
      case DiscountType.PERCENTAGE:
        finalOfferPrice = Math.round(
          basePrice * (1 - Number(row.discount_value) / 100)
        );
        break;

      case DiscountType.FIXED:
        finalOfferPrice = Math.max(
          0,
          basePrice - Number(row.discount_value)
        );
        break;
    }
  }

  return {
    id: row.order_id as string,
    email: row.email as string,
    lang: row.lang as string,
    status: row.status as OrderStatus,
    stripePaymentIntentId: row.stripe_payment_intent_id as string,
    finalPrice: Number(row.final_price),
    createdAt: String(row.created_at),

    offer: {
      id: row.offer_id as string,
      dataQuantity: Number(row.data_quantity),
      dataUnit: row.data_unit as OfferDataUnit,
      durationQuantity: Number(row.duration_quantity),
      durationUnit: row.duration_unit as OfferDurationUnit,
      basePrice,
      finalPrice: finalOfferPrice,
      available: Boolean(row.available),
      stripePriceId: row.stripe_price_id as string,
      discount: row.discount_id
        ? {
          value: Number(row.discount_value),
          type: row.discount_type as DiscountType,
        }
        : undefined,
      providerProductId: row.provider_product_id as string,
    },

    destination: {
      id: row.destination_id as string,
      code: row.code as string,
      type: row.type as DestinationType,
      flag: row.flag as string,
      featured: Boolean(row.featured),
      region: row.region as string,
      coverage: row.coverage as Record<
        string,
        Record<string, CountryNetworkInfo>
      >,
      minPrice:
        row.destination_min_price != null
          ? Number(row.destination_min_price)
          : null,
      hasPromo: Boolean(row.destination_has_promo),
    },

    esim: row.esim_id
      ? {
          id: row.esim_id as string,
          iccid: row.iccid as string,
          msisdn: row.msisdn as string,
          activationCode: row.activation_code as string,
          reservedAt: row.reserved_at != null ? String(row.reserved_at) : null,
          soldAt: row.sold_at != null ? String(row.sold_at) : null,
          status: row.esim_status as EsimStatus,
        }
      : undefined,
  };
}
