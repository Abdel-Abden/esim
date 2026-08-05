import { Offer } from '@ilotel/shared';
import { sql } from '../client.js';
import { mapOffer } from '../mappers.js';

// ─── Lecture ──────────────────────────────────────────────────────────────────

/**
 * Récupère les offres d'une destination avec leur réduction active (si existante).
 * Utilise la vue `offers_with_active_discount` définie dans schema.sql.
 */
export async function getOffersByDestinationId(destinationId: string): Promise<Offer[]> {
  const rows = await sql`
    SELECT
      o.id,
      o.destination_id,
      o.data_quantity,
      o.data_unit,
      o.duration_quantity,
      o.duration_unit,
      o.base_price,
      o.stripe_price_id,
      o.created_at,
      o.provider_product_id,
      e.id         AS destination_db_id,
      e.code       AS destination_code,
      e.type       AS destination_type,
      e.flag       AS destination_flag,
      v.discount_id,
      v.discount_type,
      v.discount_value
    FROM offers o
    JOIN destinations e ON e.id = o.destination_id
    LEFT JOIN offers_with_active_discount v ON v.id = o.id
    WHERE o.destination_id = ${destinationId}
    GROUP BY o.id, e.id, v.discount_id, v.discount_type, v.discount_value, v.final_price
    ORDER BY o.base_price ASC
  `;
  return rows.map(mapOffer);
}

/**
 * Récupère une offre unique avec tous ses détails.
 * Utilisé lors de la création d'une commande pour valider le prix côté serveur.
 */
export async function getOfferById(id: string): Promise<Offer | null> {
  const rows = await sql`
    SELECT
      o.id,
      o.destination_id,
      o.data_quantity,
      o.data_unit,
      o.duration_quantity,
      o.duration_unit,
      o.base_price,
      o.stripe_price_id,
      o.created_at,
      o.provider_product_id,
      e.id         AS destination_db_id,
      e.code       AS destination_code,
      e.type       AS destination_type,
      e.flag       AS destination_flag,
      v.discount_id,
      v.discount_type,
      v.discount_value
    FROM offers o
    JOIN destinations e ON e.id = o.destination_id
    LEFT JOIN offers_with_active_discount v ON v.id = o.id
    WHERE o.id = ${id}
    GROUP BY o.id, e.id, v.discount_id, v.discount_type, v.discount_value, v.final_price
    LIMIT 1
  `;
  return rows[0] ? mapOffer(rows[0]) : null;
}