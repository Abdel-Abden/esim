-- =============================================================================
-- INIT — Création des table
-- =============================================================================


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE public.destinations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR NOT NULL,
    featured BOOLEAN NOT NULL DEFAULT false,
    name TEXT,
    type TEXT NOT NULL,
    flag TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    region VARCHAR(50) NOT NULL,
    coverage JSONB NOT NULL DEFAULT '{}',
    available BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE public.offers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    destination_id UUID NOT NULL,
    data_quantity INTEGER NOT NULL,
    data_unit VARCHAR(4) NOT NULL DEFAULT 'Go',
    duration_quantity INTEGER NOT NULL,
    duration_unit VARCHAR(6) NOT NULL DEFAULT 'days',
    base_price NUMERIC(10, 2) NOT NULL,
    stripe_price_id TEXT,
    available BOOLEAN NOT NULL DEFAULT true,
    provider_product_id TEXT,
    created_at TIMESTAMP DEFAULT now(),

    CONSTRAINT offers_destination_id_fkey
        FOREIGN KEY (destination_id)
        REFERENCES public.destinations(id)
        ON DELETE CASCADE,

    CONSTRAINT data_unit_check
        CHECK (data_unit IN ('Go', 'Mo', 'Ko', 'UNLI')),
    
    CONSTRAINT duration_unit_check
        CHECK (duration_unit IN ('days', 'months', 'years'))
);

CREATE TABLE public.discounts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    offer_id UUID NOT NULL,
    type TEXT NOT NULL,
    value NUMERIC(10, 2) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT true,
    starts_at TIMESTAMP,
    ends_at TIMESTAMP,

    CONSTRAINT discounts_type_check
        CHECK (type IN ('percentage', 'fixed')),

    CONSTRAINT discounts_offer_id_fkey
        FOREIGN KEY (offer_id)
        REFERENCES public.offers(id)
        ON DELETE CASCADE
);

CREATE TABLE public.orders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email TEXT,
    lang CHAR(2) not null,
    offer_id UUID NOT NULL,
    status TEXT NOT NULL DEFAULT 'pending',
    stripe_payment_intent_id TEXT UNIQUE,
    final_price NUMERIC(10, 2) NOT NULL,
    base_price NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    reserved_until TIMESTAMP,

    CONSTRAINT orders_status_check
        CHECK (status IN ('pending', 'paid', 'failed', 'provisioned', 'refunding', 'refunded'))
);

CREATE TABLE public.esims (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    iccid TEXT UNIQUE NOT NULL UNIQUE,
    msisdn TEXT UNIQUE NOT NULL,
    activation_code TEXT NOT NULL,
    reserved_at TIMESTAMP,
    sold_at TIMESTAMP,
    status TEXT NOT NULL DEFAULT 'available',

    CONSTRAINT esim_status_check
        CHECK (status IN ('available', 'reserved', 'assigned', 'disabled', 'retired'))
);

CREATE TABLE public.esim_history (
    esim_id UUID NOT NULL,
    order_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT now(),

    CONSTRAINT esim_history_esim_id_fkey
        FOREIGN KEY (esim_id)
        REFERENCES public.esims(id),

    CONSTRAINT esim_history_order_id_fkey
        FOREIGN KEY (order_id)
        REFERENCES public.orders(id)
);

-- =============================================================================
-- Création des index
-- =============================================================================

-- DESTINATION


CREATE UNIQUE INDEX idx_destinations_code_type
    ON public.destinations(code, type);

CREATE INDEX idx_destinations_type
    ON public.destinations(type);

CREATE INDEX idx_destinations_available
    ON public.destinations(available);

CREATE INDEX idx_destinations_featured
    ON public.destinations(featured);

-- OFFERS

CREATE INDEX idx_offers_destination_id
    ON public.offers(destination_id);

CREATE INDEX idx_offers_price
    ON public.offers(base_price);

-- DISCOUNTS

CREATE INDEX idx_discounts_offer_id
    ON public.discounts(offer_id);

-- ORDERS

CREATE INDEX idx_orders_email
    ON public.orders(email);

CREATE INDEX idx_orders_payment_intent
    ON public.orders(stripe_payment_intent_id);

CREATE INDEX idx_orders_reserved_until
    ON public.orders(reserved_until);

CREATE INDEX idx_orders_status
    ON public.orders(status);

-- ESIMS

CREATE INDEX idx_esim_status
    ON public.esims(status);

CREATE INDEX idx_esim_sold_at
    ON public.esims(sold_at);

CREATE INDEX idx_esims_available
    ON public.esims(status, reserved_at);

-- ESIM_HISTORY

CREATE INDEX idx_esim_history_esim
    ON public.esim_history(esim_id);

CREATE INDEX idx_esim_history_order
    ON public.esim_history(order_id);

CREATE INDEX idx_esim_history_created
    ON public.esim_history(created_at DESC);

-- =============================================================================
-- Création des vue
-- =============================================================================

CREATE VIEW public.offers_with_active_discount AS
SELECT
    o.id,
    o.destination_id,
    o.data_quantity,
    o.data_unit,
    o.duration_quantity,
    o.duration_unit,
    o.base_price,
    o.available,
    o.stripe_price_id,
    o.provider_product_id,
    o.created_at,

    d.id AS discount_id,
    d.type AS discount_type,
    d.value AS discount_value,

    dest.code,
    dest.flag,
    dest.type,
    dest.region,

    CASE
        WHEN d.type = 'percentage'
            THEN ROUND(o.base_price * (1 - d.value / 100), 2)

        WHEN d.type = 'fixed'
            THEN GREATEST(0, ROUND(o.base_price - d.value, 2))

        ELSE o.base_price
    END AS final_price

FROM public.offers o

LEFT JOIN public.discounts d
    ON d.offer_id = o.id
   AND d.active = true
   AND (d.starts_at IS NULL OR d.starts_at <= NOW())
   AND (d.ends_at IS NULL OR d.ends_at >= NOW())

JOIN destinations dest
    ON dest.id = o.destination_id;