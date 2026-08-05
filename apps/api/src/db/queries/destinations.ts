import { Destination } from '@ilotel/shared';
import { sql } from '../client.js';
import { mapDestination } from '../mappers.js';

// ─── Lecture ──────────────────────────────────────────────────────────────────

/**
 * GET /destinations
 * Retourne toutes les destinations avec prix min et état promo/stock agrégés.
 * Une seule requête SQL, un seul appel réseau côté client.
 *
 * min_price  : prix final le plus bas parmi les offres avec stock disponible
 * has_promo  : true si au moins une offre avec discount actif a du stock
 * has_stock  : true si au moins une offre a du stock
 */
export async function getAllDestinations(): Promise<Destination[]> {
  const rows = await sql`
    SELECT
      e.id,
      e.code,
      e.type,
      e.flag,
      e.featured,
      e.region,
      e.coverage,
      MIN(COALESCE(v.final_price, o.base_price)) AS min_price,
      BOOL_OR(v.discount_id IS NOT NULL)          AS has_promo
    FROM destinations e
    LEFT JOIN offers o ON o.destination_id = e.id
    LEFT JOIN offers_with_active_discount v ON v.id = o.id
    WHERE e.available = true
    GROUP BY e.id
    ORDER BY e.code ASC
  `;
  return rows.map(mapDestination);
}

export async function getDestinationById(id: string): Promise<Destination | null> {
  const rows = await sql`
    SELECT
      e.id,
      e.code,
      e.type,
      e.flag,
      e.featured,
      e.region,
      e.coverage,
      MIN(COALESCE(v.final_price, o.base_price)) AS min_price,
      BOOL_OR(v.discount_id IS NOT NULL) AS has_promo
    FROM destinations e
    LEFT JOIN offers o ON o.destination_id = e.id
    LEFT JOIN offers_with_active_discount v ON v.id = o.id
    WHERE e.id = ${id}
    GROUP BY
      e.id,
      e.code,
      e.type,
      e.flag,
      e.featured,
      e.region,
      e.coverage
  `;
  return rows[0] ? mapDestination(rows[0]) : null;
}