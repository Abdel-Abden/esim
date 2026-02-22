-- ============================================================
-- ILOTEL eSIM — Schéma Neon (PostgreSQL)
-- ============================================================
-- À exécuter dans le SQL Editor de Neon Dashboard

-- Extension UUID
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ------------------------------------------------------------
-- 1. esims — produits (pays / régions)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS esims (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name        TEXT NOT NULL,           -- ex: "France", "Monde"
  type        TEXT NOT NULL,           -- ex: "country" | "region"
  flag        TEXT NOT NULL,           -- ex: "🇫🇷"
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- ------------------------------------------------------------
-- 2. offers — offres rattachées à un eSIM produit
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS offers (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  esim_id       UUID NOT NULL REFERENCES esims(id) ON DELETE CASCADE,
  data_gb       INT NOT NULL,          -- ex: 5, 20, 30
  duration_days INT NOT NULL,          -- ex: 7, 15, 30
  base_price    NUMERIC(8,2) NOT NULL, -- ex: 9.99
  is_promo      BOOLEAN DEFAULT FALSE,
  created_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ------------------------------------------------------------
-- 3. esim_inventory — stock de vrais ICCIDs
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS esim_inventory (
  id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  esim_id      UUID NOT NULL REFERENCES esims(id) ON DELETE CASCADE,
  iccid        TEXT NOT NULL UNIQUE,
  status       TEXT NOT NULL DEFAULT 'available', -- available | reserved | sold
  reserved_at  TIMESTAMPTZ,
  sold_at      TIMESTAMPTZ,
  order_id     UUID                              -- FK vers orders (ajoutée après)
);

-- ------------------------------------------------------------
-- 4. orders — commandes (ajout par rapport au schéma initial)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS orders (
  id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  offer_id            UUID NOT NULL REFERENCES offers(id),
  inventory_id        UUID REFERENCES esim_inventory(id),
  email               TEXT NOT NULL,
  stripe_payment_intent TEXT NOT NULL UNIQUE,
  amount              NUMERIC(8,2) NOT NULL,
  currency            TEXT NOT NULL DEFAULT 'eur',
  status              TEXT NOT NULL DEFAULT 'pending', -- pending | paid | failed
  discount_id         UUID,                            -- FK vers discounts
  created_at          TIMESTAMPTZ DEFAULT NOW(),
  paid_at             TIMESTAMPTZ
);

-- FK circulaire order_id dans esim_inventory
ALTER TABLE esim_inventory
  ADD CONSTRAINT fk_inventory_order
  FOREIGN KEY (order_id) REFERENCES orders(id);

-- ------------------------------------------------------------
-- 5. discounts — codes promo
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS discounts (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  offer_id    UUID REFERENCES offers(id),  -- NULL = applicable à toutes les offres
  code        TEXT NOT NULL UNIQUE,
  type        TEXT NOT NULL,               -- 'percent' | 'fixed'
  value       NUMERIC(8,2) NOT NULL,
  active      BOOLEAN DEFAULT TRUE,
  starts_at   TIMESTAMPTZ,
  ends_at     TIMESTAMPTZ
);

ALTER TABLE orders
  ADD CONSTRAINT fk_orders_discount
  FOREIGN KEY (discount_id) REFERENCES discounts(id);

-- ------------------------------------------------------------
-- Données de démo
-- ------------------------------------------------------------
INSERT INTO esims (id, name, type, flag) VALUES
  ('00000000-0000-0000-0000-000000000001', 'Monde',        'region',  '🌍'),
  ('00000000-0000-0000-0000-000000000002', 'France',       'country', '🇫🇷'),
  ('00000000-0000-0000-0000-000000000003', 'Japon',        'country', '🇯🇵'),
  ('00000000-0000-0000-0000-000000000004', 'Espagne',      'country', '🇪🇸'),
  ('00000000-0000-0000-0000-000000000005', 'États-Unis',   'country', '🇺🇸')
ON CONFLICT DO NOTHING;

INSERT INTO offers (esim_id, data_gb, duration_days, base_price, is_promo) VALUES
  ('00000000-0000-0000-0000-000000000001', 5,  7,  9.99,  FALSE),
  ('00000000-0000-0000-0000-000000000001', 20, 15, 15.99, TRUE),
  ('00000000-0000-0000-0000-000000000001', 30, 30, 24.99, FALSE),
  ('00000000-0000-0000-0000-000000000002', 5,  7,  9.99,  FALSE),
  ('00000000-0000-0000-0000-000000000002', 20, 15, 15.99, TRUE),
  ('00000000-0000-0000-0000-000000000002', 30, 30, 24.99, FALSE),
  ('00000000-0000-0000-0000-000000000003', 5,  7,  12.99, FALSE),
  ('00000000-0000-0000-0000-000000000003', 20, 15, 21.99, FALSE),
  ('00000000-0000-0000-0000-000000000004', 5,  7,  9.99,  FALSE),
  ('00000000-0000-0000-0000-000000000004', 20, 15, 16.99, FALSE),
  ('00000000-0000-0000-0000-000000000004', 30, 30, 26.99, FALSE),
  ('00000000-0000-0000-0000-000000000005', 5,  7,  14.99, FALSE),
  ('00000000-0000-0000-0000-000000000005', 20, 15, 24.99, FALSE),
  ('00000000-0000-0000-0000-000000000005', 30, 30, 34.99, FALSE)
ON CONFLICT DO NOTHING;
