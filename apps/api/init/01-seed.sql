-- =============================================================================
-- SEED — Reset complet + données liées aux offres
-- =============================================================================

-- Nettoyage dans l'ordre (FK)
UPDATE esim_inventory SET order_id = NULL, status = 'available', reserved_at = NULL, sold_at = NULL;
DELETE FROM orders;
DELETE FROM discounts;
DELETE FROM esim_inventory;
DELETE FROM offers;
DELETE FROM esims;

-- =============================================================================
-- ESIMS (destinations)
-- =============================================================================

INSERT INTO esims (id, name, type, region, flag) VALUES
  ('00000000-0000-0000-0000-000000000001', 'France',     'country', 'europe', '🇫🇷'),
  ('00000000-0000-0000-0000-000000000002', 'Espagne',    'country', 'europe', '🇪🇸'),
  ('00000000-0000-0000-0000-000000000003', 'Europe',     'region', 'europe',  '🇪🇺'),
  ('00000000-0000-0000-0000-000000000004', 'Japon',      'country', 'asia', '🇯🇵'),
  ('00000000-0000-0000-0000-000000000005', 'États-Unis', 'country', 'americas', '🇺🇸'),
  ('00000000-0000-0000-0000-000000000006', 'Thaïlande',  'country', 'asia', '🇹🇭'),
  ('00000000-0000-0000-0000-000000000007', 'Maroc',      'country', 'asia', '🇲🇦'),
  ('00000000-0000-0000-0000-000000000008', 'Mexique',    'country', 'europe', '🇲🇽'),
  ('00000000-0000-0000-0000-000000000009', 'Singapour',  'country', 'asia', '🇸🇬');

-- =============================================================================
-- OFFERS
-- =============================================================================

INSERT INTO offers (id, esim_id, data_gb, duration_days, base_price, stripe_price_id) VALUES

  -- France : 3 offres
  ('00000000-0000-0000-0001-000000000001', '00000000-0000-0000-0000-000000000001', 1,  7,  4.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn'),
  ('00000000-0000-0000-0001-000000000002', '00000000-0000-0000-0000-000000000001', 5,  15, 9.99,  'price_1T3GBuB2QNNevpYqFuh15L9B'),
  ('00000000-0000-0000-0001-000000000003', '00000000-0000-0000-0000-000000000001', 30, 30, 26.99, 'price_1T3GCGB2QNNevpYqr293pzqf'),

  -- Espagne : 2 offres
  ('00000000-0000-0000-0001-000000000004', '00000000-0000-0000-0000-000000000002', 3,  10, 7.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn'),
  ('00000000-0000-0000-0001-000000000005', '00000000-0000-0000-0000-000000000002', 20, 15, 16.99, 'price_1T3GBuB2QNNevpYqFuh15L9B'),

  -- Europe : 3 offres
  ('00000000-0000-0000-0001-000000000006', '00000000-0000-0000-0000-000000000003', 5,  7,  9.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn'),
  ('00000000-0000-0000-0001-000000000007', '00000000-0000-0000-0000-000000000003', 20, 15, 16.99, 'price_1T3GBuB2QNNevpYqFuh15L9B'),
  ('00000000-0000-0000-0001-000000000008', '00000000-0000-0000-0000-000000000003', 30, 30, 26.99, 'price_1T3GCGB2QNNevpYqr293pzqf'),

  -- Japon : 2 offres, AUCUNE eSIM en inventory → épuisées
  ('00000000-0000-0000-0001-000000000009', '00000000-0000-0000-0000-000000000004', 3,  7,  8.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn'),
  ('00000000-0000-0000-0001-000000000010', '00000000-0000-0000-0000-000000000004', 10, 15, 14.99, 'price_1T3GBuB2QNNevpYqFuh15L9B'),

  -- États-Unis : 3 offres avec stock indépendant par offre
  ('00000000-0000-0000-0001-000000000011', '00000000-0000-0000-0000-000000000005', 1,  7,  5.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn'),
  ('00000000-0000-0000-0001-000000000012', '00000000-0000-0000-0000-000000000005', 5,  15, 11.99, 'price_1T3GBuB2QNNevpYqFuh15L9B'),
  ('00000000-0000-0000-0001-000000000013', '00000000-0000-0000-0000-000000000005', 20, 30, 21.99, 'price_1T3GCGB2QNNevpYqr293pzqf'),

  -- Thaïlande : 2 offres avec réductions actives
  ('00000000-0000-0000-0001-000000000014', '00000000-0000-0000-0000-000000000006', 5,  7,  9.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn'),
  ('00000000-0000-0000-0001-000000000015', '00000000-0000-0000-0000-000000000006', 15, 20, 17.99, 'price_1T3GBuB2QNNevpYqFuh15L9B'),

  -- Maroc : réduction expirée
  ('00000000-0000-0000-0001-000000000016', '00000000-0000-0000-0000-000000000007', 3,  7,  6.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn'),

  -- Mexique : réduction future
  ('00000000-0000-0000-0001-000000000017', '00000000-0000-0000-0000-000000000008', 5,  10, 8.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn'),

  -- Singapour : 1 seul stock
  ('00000000-0000-0000-0001-000000000018', '00000000-0000-0000-0000-000000000009', 10, 14, 15.99, 'price_1T3GBuB2QNNevpYqFuh15L9B');

-- =============================================================================
-- DISCOUNTS
-- =============================================================================

INSERT INTO discounts (offer_id, type, value, active, starts_at, ends_at) VALUES
  -- Thaïlande 5Go/7j - 20%
  ('00000000-0000-0000-0001-000000000014', 'percentage', 20, true,  NOW() - INTERVAL '1 day',  NOW() + INTERVAL '30 days'),

  -- Thaïlande 15Go/20j - 5€
  ('00000000-0000-0000-0001-000000000015', 'fixed',       5, true,  NOW() - INTERVAL '1 day',  NOW() + INTERVAL '30 days'),

  -- Maroc 3Go/7j - 15%
  ('00000000-0000-0000-0001-000000000016', 'percentage', 15, true,  NOW() - INTERVAL '30 days', NOW() - INTERVAL '1 day'),

  -- Mexique 5Go/10j - 10%
  ('00000000-0000-0000-0001-000000000017', 'percentage', 10, true,  NOW() + INTERVAL '1 day',  NOW() + INTERVAL '30 days'),

  -- France 5Go/15j - 25%
  ('00000000-0000-0000-0001-000000000002', 'percentage', 25, false, NOW() - INTERVAL '1 day',  NOW() + INTERVAL '30 days');

-- =============================================================================
-- ESIM INVENTORY — chaque carte liée à une offre précise
-- =============================================================================

INSERT INTO esim_inventory (esim_id, offer_id, iccid, activation_code, status) VALUES

  -- France 1Go/7j
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000001', 'ICCID-FR-1GO-001', 'LPA:1$smdp.transatel.com$FR-1GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000001', 'ICCID-FR-1GO-002', 'LPA:1$smdp.transatel.com$FR-1GO-002', 'available'),

  -- France 5Go/15j
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000002', 'ICCID-FR-5GO-001', 'LPA:1$smdp.transatel.com$FR-5GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000002', 'ICCID-FR-5GO-002', 'LPA:1$smdp.transatel.com$FR-5GO-002', 'available'),
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000002', 'ICCID-FR-5GO-003', 'LPA:1$smdp.transatel.com$FR-5GO-003', 'available'),

  -- France 30Go/30j
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000003', 'ICCID-FR-30GO-001', 'LPA:1$smdp.transatel.com$FR-30GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000003', 'ICCID-FR-30GO-002', 'LPA:1$smdp.transatel.com$FR-30GO-002', 'available'),

  -- Espagne 3Go/10j
  ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0001-000000000004', 'ICCID-ES-3GO-001', 'LPA:1$smdp.transatel.com$ES-3GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0001-000000000004', 'ICCID-ES-3GO-002', 'LPA:1$smdp.transatel.com$ES-3GO-002', 'available'),

  -- Espagne 20Go/15j
  ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0001-000000000005', 'ICCID-ES-20GO-001', 'LPA:1$smdp.transatel.com$ES-20GO-001', 'available'),

  -- Europe 5Go/7j
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000006', 'ICCID-EU-5GO-001', 'LPA:1$smdp.transatel.com$EU-5GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000006', 'ICCID-EU-5GO-002', 'LPA:1$smdp.transatel.com$EU-5GO-002', 'available'),

  -- Europe 20Go/15j
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000007', 'ICCID-EU-20GO-001', 'LPA:1$smdp.transatel.com$EU-20GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000007', 'ICCID-EU-20GO-002', 'LPA:1$smdp.transatel.com$EU-20GO-002', 'available'),

  -- Europe 30Go/30j
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000008', 'ICCID-EU-30GO-001', 'LPA:1$smdp.transatel.com$EU-30GO-001', 'available'),

  -- Japon : AUCUNE entrée → les deux offres seront automatiquement épuisées

  -- États-Unis 1Go/7j
  ('00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0001-000000000011', 'ICCID-US-1GO-001', 'LPA:1$smdp.transatel.com$US-1GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0001-000000000011', 'ICCID-US-1GO-002', 'LPA:1$smdp.transatel.com$US-1GO-002', 'available'),

  -- États-Unis 5Go/15j — 1 seul stock (épuisé après 1 achat)
  ('00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0001-000000000012', 'ICCID-US-5GO-001', 'LPA:1$smdp.transatel.com$US-5GO-001', 'available'),

  -- États-Unis 20Go/30j — épuisé dès le départ
  -- (aucune entrée pour l'offre 00000000-0000-0000-0001-000000000013)

  -- Thaïlande 5Go/7j (promo -20%)
  ('00000000-0000-0000-0000-000000000006', '00000000-0000-0000-0001-000000000014', 'ICCID-TH-5GO-001', 'LPA:1$smdp.transatel.com$TH-5GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000006', '00000000-0000-0000-0001-000000000014', 'ICCID-TH-5GO-002', 'LPA:1$smdp.transatel.com$TH-5GO-002', 'available'),

  -- Thaïlande 15Go/20j (promo -5€)
  ('00000000-0000-0000-0000-000000000006', '00000000-0000-0000-0001-000000000015', 'ICCID-TH-15GO-001', 'LPA:1$smdp.transatel.com$TH-15GO-001', 'available'),

  -- Maroc 3Go/7j
  ('00000000-0000-0000-0000-000000000007', '00000000-0000-0000-0001-000000000016', 'ICCID-MA-3GO-001', 'LPA:1$smdp.transatel.com$MA-3GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000007', '00000000-0000-0000-0001-000000000016', 'ICCID-MA-3GO-002', 'LPA:1$smdp.transatel.com$MA-3GO-002', 'available'),

  -- Mexique 5Go/10j
  ('00000000-0000-0000-0000-000000000008', '00000000-0000-0000-0001-000000000017', 'ICCID-MX-5GO-001', 'LPA:1$smdp.transatel.com$MX-5GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000008', '00000000-0000-0000-0001-000000000017', 'ICCID-MX-5GO-002', 'LPA:1$smdp.transatel.com$MX-5GO-002', 'available'),

  -- Singapour 10Go/14j — 1 seul stock
  ('00000000-0000-0000-0000-000000000009', '00000000-0000-0000-0001-000000000018', 'ICCID-SG-10GO-001', 'LPA:1$smdp.transatel.com$SG-10GO-001', 'available');

-- =============================================================================
-- Vérification — stock par offre
-- =============================================================================

SELECT
  e.flag,
  e.name                                                        AS destination,
  o.data_gb || ' Go / ' || o.duration_days || 'j'              AS offre,
  COUNT(i.id) FILTER (WHERE i.status = 'available')            AS stock
FROM offers o
JOIN esims e ON e.id = o.esim_id
LEFT JOIN esim_inventory i ON i.offer_id = o.id
GROUP BY e.flag, e.name, o.data_gb, o.duration_days, o.base_price
ORDER BY e.name, o.base_price;