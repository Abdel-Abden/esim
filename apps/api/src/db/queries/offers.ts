import { OfferWithStock } from '@ilotel/shared';
import { sql } from '../client.js';
import { mapOfferWithStock } from '../mappers.js';

// ─── Lecture ──────────────────────────────────────────────────────────────────

/**
 * Récupère les offres d'une destination avec leur réduction active (si existante).
 * Utilise la vue `offers_with_active_discount` définie dans schema.sql.
 */
export async function getOffersByEsimId(esimId: string): Promise<OfferWithStock[]> {
  const rows = await sql`
    SELECT
      o.id,
      o.esim_id,
      o.data_gb,
      o.duration_days,
      o.base_price,
      o.stripe_price_id,
      o.created_at,
      e.id         AS esim_db_id,
      e.name       AS esim_name,
      e.type       AS esim_type,
      e.flag       AS esim_flag,
      e.created_at AS esim_created_at,
      v.discount_id,
      v.discount_type,
      v.discount_value,
      v.final_price,
      -- Compte uniquement les eSIMs disponibles pour cette offre précise
      COUNT(i.id) FILTER (WHERE i.status = 'available') AS available_count
    FROM offers o
    JOIN esims e ON e.id = o.esim_id
    LEFT JOIN offers_with_active_discount v ON v.id = o.id
    LEFT JOIN esim_inventory i ON i.offer_id = o.id
    WHERE o.esim_id = ${esimId}
    GROUP BY o.id, e.id, v.discount_id, v.discount_type, v.discount_value, v.final_price
    ORDER BY o.base_price ASC
  `;
  return rows.map(mapOfferWithStock);
}

/**
 * Récupère une offre unique avec tous ses détails.
 * Utilisé lors de la création d'une commande pour valider le prix côté serveur.
 */
export async function getOfferById(id: string): Promise<OfferWithStock | null> {
  const rows = await sql`
    SELECT
      o.id,
      o.esim_id,
      o.data_gb,
      o.duration_days,
      o.base_price,
      o.stripe_price_id,
      o.created_at,
      e.id         AS esim_db_id,
      e.name       AS esim_name,
      e.type       AS esim_type,
      e.flag       AS esim_flag,
      e.created_at AS esim_created_at,
      v.discount_id,
      v.discount_type,
      v.discount_value,
      v.final_price,
      COUNT(i.id) FILTER (WHERE i.status = 'available') AS available_count
    FROM offers o
    JOIN esims e ON e.id = o.esim_id
    LEFT JOIN offers_with_active_discount v ON v.id = o.id
    LEFT JOIN esim_inventory i ON i.offer_id = o.id
    WHERE o.id = ${id}
    GROUP BY o.id, e.id, v.discount_id, v.discount_type, v.discount_value, v.final_price
    LIMIT 1
  `;
  return rows[0] ? mapOfferWithStock(rows[0]) : null;
}