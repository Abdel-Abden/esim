-- =============================================================================
-- INIT — Création des table
-- =============================================================================


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE public.esims (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    type TEXT NOT NULL DEFAULT 'country',
    flag TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    region VARCHAR(50) NOT NULL
);

CREATE TABLE public.offers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    esim_id UUID NOT NULL,
    data_gb INTEGER NOT NULL,
    duration_days INTEGER NOT NULL,
    base_price NUMERIC(10, 2) NOT NULL,
    stripe_price_id TEXT,
    created_at TIMESTAMP DEFAULT now(),

    CONSTRAINT offers_esim_id_fkey
        FOREIGN KEY (esim_id)
        REFERENCES public.esims(id)
        ON DELETE CASCADE
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
    offer_id UUID NOT NULL,
    status TEXT NOT NULL DEFAULT 'pending',
    stripe_payment_intent_id TEXT UNIQUE,
    final_price NUMERIC(10, 2) NOT NULL,
    discount_id UUID,
    created_at TIMESTAMP DEFAULT now(),
    reserved_until TIMESTAMP,

    CONSTRAINT orders_status_check
        CHECK (status IN ('pending', 'paid', 'failed', 'provisioned')),

    CONSTRAINT orders_offer_id_fkey
        FOREIGN KEY (offer_id)
        REFERENCES public.offers(id),

    CONSTRAINT orders_discount_id_fkey
        FOREIGN KEY (discount_id)
        REFERENCES public.discounts(id)
);

CREATE TABLE public.esim_inventory (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    esim_id UUID NOT NULL,
    iccid TEXT NOT NULL UNIQUE,
    status TEXT NOT NULL DEFAULT 'available',
    reserved_at TIMESTAMP,
    sold_at TIMESTAMP,
    order_id UUID,
    activation_code TEXT NOT NULL,
    offer_id UUID NOT NULL,

    CONSTRAINT esim_inventory_status_check
        CHECK (status IN ('available', 'reserved', 'sold')),

    CONSTRAINT esim_inventory_esim_id_fkey
        FOREIGN KEY (esim_id)
        REFERENCES public.esims(id)
        ON DELETE CASCADE,

    CONSTRAINT esim_inventory_offer_id_fkey
        FOREIGN KEY (offer_id)
        REFERENCES public.offers(id)
        ON DELETE SET NULL,

    CONSTRAINT esim_inventory_order_id_fkey
        FOREIGN KEY (order_id)
        REFERENCES public.orders(id)
);

CREATE INDEX idx_discounts_offer_id
    ON public.discounts (offer_id);

CREATE INDEX idx_offers_esim_id
    ON public.offers (esim_id);

CREATE INDEX idx_orders_email
    ON public.orders (email);

CREATE INDEX idx_orders_payment_intent
    ON public.orders (stripe_payment_intent_id);

CREATE INDEX idx_orders_reserved_until
    ON public.orders (reserved_until);

CREATE INDEX idx_esim_inventory_offer_id
    ON public.esim_inventory (offer_id, status);

CREATE INDEX idx_inventory_esim_id
    ON public.esim_inventory (esim_id);

CREATE INDEX idx_inventory_order_id
    ON public.esim_inventory (order_id);

CREATE INDEX idx_inventory_status
    ON public.esim_inventory (status);

CREATE VIEW public.offers_with_active_discount AS
SELECT
    o.id,
    o.esim_id,
    o.data_gb,
    o.duration_days,
    o.base_price,
    o.stripe_price_id,
    o.created_at,
    d.id AS discount_id,
    d.type AS discount_type,
    d.value AS discount_value,
    CASE
        WHEN d.type = 'percentage'
            THEN round(o.base_price * (1::numeric - d.value / 100::numeric), 2)
        WHEN d.type = 'fixed'
            THEN GREATEST(0::numeric, round(o.base_price - d.value, 2))
        ELSE o.base_price
    END AS final_price
FROM public.offers o
LEFT JOIN public.discounts d
    ON d.offer_id = o.id
   AND d.active = true
   AND (d.starts_at IS NULL OR d.starts_at <= now())
   AND (d.ends_at IS NULL OR d.ends_at >= now());