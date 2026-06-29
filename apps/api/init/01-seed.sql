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

INSERT INTO esims (id, code, name, type, region, flag, region_countries) VALUES
  ('00000000-0000-0000-0000-000000000001', 'fr', 'France',      'country', 'eu', '🇫🇷', '[]'),
  ('00000000-0000-0000-0000-000000000002', 'es', 'Espagne',     'country', 'eu', '🇪🇸', '[]'),
  ('00000000-0000-0000-0000-000000000003', 'eu', 'Europe',      'region',  'eu', '🇪🇺', '["fr","am","ar"]'),
  ('00000000-0000-0000-0000-000000000004', 'jp', 'Japon',       'country', 'as', '🇯🇵', '[]'),
  ('00000000-0000-0000-0000-000000000005', 'us', 'États-Unis',  'country', 'am', '🇺🇸', '[]'),
  ('00000000-0000-0000-0000-000000000006', 'th', 'Thaïlande',   'country', 'as', '🇹🇭', '[]'),
  ('00000000-0000-0000-0000-000000000007', 'ma', 'Maroc',       'country', 'af', '🇲🇦', '[]'),
  ('00000000-0000-0000-0000-000000000008', 'mx', 'Mexique',     'country', 'am', '🇲🇽', '[]'),
  ('00000000-0000-0000-0000-000000000009', 'sg', 'Singapour',   'country', 'as', '🇸🇬', '[]');

-- =============================================================================
-- OFFERS
-- transatel_product_id : à renseigner avec les vrais IDs fournis par Transatel
-- =============================================================================

INSERT INTO offers (id, esim_id, data_gb, duration_days, base_price, stripe_price_id, transatel_product_id) VALUES
  -- France
  ('00000000-0000-0000-0001-000000000001', '00000000-0000-0000-0000-000000000001', 3,  30, 4.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn', 'WW_901O_STACK_ONEOFF_FRA_3GB_30D'),
  ('00000000-0000-0000-0001-000000000002', '00000000-0000-0000-0000-000000000001', 25, 30, 9.99,  'price_1T3GBuB2QNNevpYqFuh15L9B', 'WW_901O_STACK_ONEOFF_FRA_25GB_30D'),
  ('00000000-0000-0000-0001-000000000003', '00000000-0000-0000-0000-000000000001', 50, 30, 26.99, 'price_1T3GCGB2QNNevpYqr293pzqf', 'WW_901O_STACK_ONEOFF_FRA_50GB_30D'),

  -- Espagne
  ('00000000-0000-0000-0001-000000000004', '00000000-0000-0000-0000-000000000002', 10, 7,  7.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn', 'WW_901O_STACK_ONEOFF_ESP_10GB_7D'),
  ('00000000-0000-0000-0001-000000000005', '00000000-0000-0000-0000-000000000002', 25, 30, 16.99, 'price_1T3GBuB2QNNevpYqFuh15L9B', 'WW_901O_STACK_ONEOFF_ESP_25GB_30D'),

  -- Europe
  ('00000000-0000-0000-0001-000000000006', '00000000-0000-0000-0000-000000000003', 1,  7,  9.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn', 'WW_901O_STACK_ONEOFF_EU28PLUS_1GB_7D'),
  ('00000000-0000-0000-0001-000000000007', '00000000-0000-0000-0000-000000000003', 10, 30, 16.99, 'price_1T3GBuB2QNNevpYqFuh15L9B', 'WW_901O_STACK_ONEOFF_EU28PLUS_10GB_30D'),
  ('00000000-0000-0000-0001-000000000008', '00000000-0000-0000-0000-000000000003', 25, 30, 26.99, 'price_1T3GCGB2QNNevpYqr293pzqf', 'WW_901O_STACK_ONEOFF_EU28PLUS_25GB_30D'),

  -- Japon
  ('00000000-0000-0000-0001-000000000009', '00000000-0000-0000-0000-000000000004', 10, 7,  8.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn', 'WW_901O_STACK_ONEOFF_JPN_10GB_7D'),
  ('00000000-0000-0000-0001-000000000010', '00000000-0000-0000-0000-000000000004', 10, 7,  14.99, 'price_1T3GBuB2QNNevpYqFuh15L9B', 'WW_901O_STACK_ONEOFF_JPN_10GB_7D'),

  -- États-Unis
  ('00000000-0000-0000-0001-000000000011', '00000000-0000-0000-0000-000000000005', 1,  7,  5.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn', 'WW_901O_STACK_ONEOFF_USA_1GB_7D'),
  ('00000000-0000-0000-0001-000000000012', '00000000-0000-0000-0000-000000000005', 3,  30, 11.99, 'price_1T3GBuB2QNNevpYqFuh15L9B', 'WW_901O_STACK_ONEOFF_USA_3GB_30D'),
  ('00000000-0000-0000-0001-000000000013', '00000000-0000-0000-0000-000000000005', 25, 30, 21.99, 'price_1T3GCGB2QNNevpYqr293pzqf', 'WW_901O_STACK_ONEOFF_USA_25GB_30D'),

  -- Thaïlande
  ('00000000-0000-0000-0001-000000000014', '00000000-0000-0000-0000-000000000006', 10, 7,  9.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn', 'WW_901O_STACK_ONEOFF_THAILAND_10GB_7D'),
  ('00000000-0000-0000-0001-000000000015', '00000000-0000-0000-0000-000000000006', 10, 7,  17.99, 'price_1T3GBuB2QNNevpYqFuh15L9B', 'WW_901O_STACK_ONEOFF_THAILAND_10GB_7D'),

  -- Maroc
  ('00000000-0000-0000-0001-000000000016', '00000000-0000-0000-0000-000000000007', 3,  15, 6.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn', 'WW_901O_STACK_ONEOFF_MOROCCO_3GB_15D'),

  -- Mexique
  ('00000000-0000-0000-0001-000000000017', '00000000-0000-0000-0000-000000000008', 3,  30, 8.99,  'price_1T3GBEB2QNNevpYqeVBmiWQn', 'WW_901O_STACK_ONEOFF_MEXICO_3GB_30D'),

  -- Singapour
  ('00000000-0000-0000-0001-000000000018', '00000000-0000-0000-0000-000000000009', 10, 7,  15.99, 'price_1T3GBuB2QNNevpYqFuh15L9B', 'WW_901O_STACK_ONEOFF_SINGAPORE_10GB_7D');
-- =============================================================================
-- DISCOUNTS
-- =============================================================================

INSERT INTO discounts (offer_id, type, value, active, starts_at, ends_at) VALUES
  -- Thaïlande 5Go/7j - 20%
  ('00000000-0000-0000-0001-000000000014', 'percentage', 20, true,  NOW() - INTERVAL '1 day',  NOW() + INTERVAL '30 days'),
  -- Thaïlande 15Go/20j - 5€
  ('00000000-0000-0000-0001-000000000015', 'fixed',       5, true,  NOW() - INTERVAL '1 day',  NOW() + INTERVAL '30 days'),
  -- Maroc 3Go/7j - 15% (expirée)
  ('00000000-0000-0000-0001-000000000016', 'percentage', 15, true,  NOW() - INTERVAL '30 days', NOW() - INTERVAL '1 day'),
  -- Mexique 5Go/10j - 10% (future)
  ('00000000-0000-0000-0001-000000000017', 'percentage', 10, true,  NOW() + INTERVAL '1 day',  NOW() + INTERVAL '30 days'),
  -- France 5Go/15j - 25% (inactive)
  ('00000000-0000-0000-0001-000000000002', 'percentage', 25, false, NOW() - INTERVAL '1 day',  NOW() + INTERVAL '30 days');

-- =============================================================================
-- ESIM INVENTORY
-- msisdn    : numéro de la SIM, utilisé pour l'assignation OCS Transatel
-- iccid     : identifiant de la SIM, envoyé au client dans l'email
-- activation_code : code QR/LPA fourni dans le fichier CSV Transatel
--
-- En seed les valeurs sont fictives.
-- En production, importer depuis le fichier CSV livré par Transatel.
-- =============================================================================

INSERT INTO esim_inventory (esim_id, offer_id, iccid, msisdn, activation_code, status) VALUES

  -- France 1Go/7j
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000001', '8988247000132622623', '882470014618545', 'LPA:1$smdp.transatel.com$FR-1GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000001', '8988247000132622631', '882470014618542', 'LPA:1$smdp.transatel.com$FR-1GO-002', 'available'),

  -- France 5Go/15j
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000002', '8988247000132622649', '882470014618576', 'LPA:1$smdp.transatel.com$FR-5GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000002', '8988247000132622656', '882470014618577', 'LPA:1$smdp.transatel.com$FR-5GO-002', 'available'),
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000002', '8988247000132622664', '882470014618552', 'LPA:1$smdp.transatel.com$FR-5GO-003', 'available'),

  -- France 30Go/30j
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000003', '8988247000132622672', '882470014618553', 'LPA:1$smdp.transatel.com$FR-30GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0001-000000000003', '8988247000132622680', '882470014618550', 'LPA:1$smdp.transatel.com$FR-30GO-002', 'available'),

  -- Espagne 3Go/10j
  ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0001-000000000004', '8988247000132622698', '882470014618548', 'LPA:1$smdp.transatel.com$ES-3GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0001-000000000004', '8988247000132622706', '882470014618546', 'LPA:1$smdp.transatel.com$ES-3GO-002', 'available'),

  -- Espagne 20Go/15j
  ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0001-000000000005', '8988247000132622714', '882470014618554', 'LPA:1$smdp.transatel.com$ES-20GO-001', 'available'),

  -- Europe 5Go/7j
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000006', 'ICCID-EU-5GO-001', '88247000001', 'LPA:1$smdp.transatel.com$EU-5GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000006', 'ICCID-EU-5GO-002', '88247000002', 'LPA:1$smdp.transatel.com$EU-5GO-002', 'available'),

  -- Europe 20Go/15j
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000007', 'ICCID-EU-20GO-001', '88247000003', 'LPA:1$smdp.transatel.com$EU-20GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000007', 'ICCID-EU-20GO-002', '88247000004', 'LPA:1$smdp.transatel.com$EU-20GO-002', 'available'),

  -- Europe 30Go/30j
  ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0001-000000000008', 'ICCID-EU-30GO-001', '88247000005', 'LPA:1$smdp.transatel.com$EU-30GO-001', 'available'),

  -- Japon : aucune entrée → épuisé

  -- États-Unis 1Go/7j
  ('00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0001-000000000011', 'ICCID-US-1GO-001', '+18000000001', 'LPA:1$smdp.transatel.com$US-1GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0001-000000000011', 'ICCID-US-1GO-002', '+18000000002', 'LPA:1$smdp.transatel.com$US-1GO-002', 'available'),

  -- États-Unis 5Go/15j — 1 seul stock
  ('00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0001-000000000012', 'ICCID-US-5GO-001', '+18000000003', 'LPA:1$smdp.transatel.com$US-5GO-001', 'available'),

  -- États-Unis 20Go/30j : aucune entrée → épuisé

  -- Thaïlande 5Go/7j (promo -20%)
  ('00000000-0000-0000-0000-000000000006', '00000000-0000-0000-0001-000000000014', 'ICCID-TH-5GO-001', '+66800000001', 'LPA:1$smdp.transatel.com$TH-5GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000006', '00000000-0000-0000-0001-000000000014', 'ICCID-TH-5GO-002', '+66800000002', 'LPA:1$smdp.transatel.com$TH-5GO-002', 'available'),

  -- Thaïlande 15Go/20j (promo -5€)
  ('00000000-0000-0000-0000-000000000006', '00000000-0000-0000-0001-000000000015', 'ICCID-TH-15GO-001', '+66800000003', 'LPA:1$smdp.transatel.com$TH-15GO-001', 'available'),

  -- Maroc 3Go/7j
  ('00000000-0000-0000-0000-000000000007', '00000000-0000-0000-0001-000000000016', 'ICCID-MA-3GO-001', '+21260000001', 'LPA:1$smdp.transatel.com$MA-3GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000007', '00000000-0000-0000-0001-000000000016', 'ICCID-MA-3GO-002', '+21260000002', 'LPA:1$smdp.transatel.com$MA-3GO-002', 'available'),

  -- Mexique 5Go/10j
  ('00000000-0000-0000-0000-000000000008', '00000000-0000-0000-0001-000000000017', 'ICCID-MX-5GO-001', '+52100000001', 'LPA:1$smdp.transatel.com$MX-5GO-001', 'available'),
  ('00000000-0000-0000-0000-000000000008', '00000000-0000-0000-0001-000000000017', 'ICCID-MX-5GO-002', '+52100000002', 'LPA:1$smdp.transatel.com$MX-5GO-002', 'available'),

  -- Singapour 10Go/14j — 1 seul stock
  ('00000000-0000-0000-0000-000000000009', '00000000-0000-0000-0001-000000000018', 'ICCID-SG-10GO-001', '+6580000001', 'LPA:1$smdp.transatel.com$SG-10GO-001', 'available');

-- =============================================================================
-- Vérification — stock par offre
-- =============================================================================

SELECT
  e.flag,
  e.name                                                        AS destination,
  o.data_gb || ' Go / ' || o.duration_days || 'j'              AS offre,
  o.transatel_product_id                                        AS product_transatel,
  COUNT(i.id) FILTER (WHERE i.status = 'available')            AS stock
FROM offers o
JOIN esims e ON e.id = o.esim_id
LEFT JOIN esim_inventory i ON i.offer_id = o.id
GROUP BY e.flag, e.name, o.data_gb, o.duration_days, o.base_price, o.transatel_product_id
ORDER BY e.name, o.base_price;