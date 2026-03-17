import { Esim, EsimInventory, EsimSummary } from '@ilotel/shared';
import { sql } from '../client.js';
import { mapEsim, mapEsimSummary, mapInventory } from '../mappers.js';

// ─── Lecture ──────────────────────────────────────────────────────────────────

/**
 * GET /esims
 * Retourne toutes les destinations avec prix min et état promo/stock agrégés.
 * Une seule requête SQL, un seul appel réseau côté client.
 *
 * min_price  : prix final le plus bas parmi les offres avec stock disponible
 * has_promo  : true si au moins une offre avec discount actif a du stock
 * has_stock  : true si au moins une offre a du stock
 */
export async function getAllEsims(): Promise<EsimSummary[]> {
  const rows = await sql`
    SELECT
      e.id,
      e.name,
      e.type,
      e.flag,
      e.region,
      e.created_at,
      MIN(v.final_price)
        FILTER (WHERE inv.available_count > 0)           AS min_price,
      BOOL_OR(v.discount_id IS NOT NULL
              AND inv.available_count > 0)               AS has_promo,
      BOOL_OR(inv.available_count > 0)                  AS has_stock
    FROM esims e
    LEFT JOIN offers o ON o.esim_id = e.id
    LEFT JOIN offers_with_active_discount v ON v.id = o.id
    LEFT JOIN (
      SELECT offer_id, COUNT(*) AS available_count
      FROM esim_inventory
      WHERE status = 'available'
      GROUP BY offer_id
    ) inv ON inv.offer_id = o.id
    GROUP BY e.id, e.name, e.type, e.flag, e.region, e.created_at
    ORDER BY e.name ASC
  `;

  return rows.map(mapEsimSummary);
}

export async function getEsimById(id: string): Promise<Esim | null> {
  const rows = await sql`
    SELECT id, name, type, flag, region, created_at
    FROM esims
    WHERE id = ${id}
    LIMIT 1
  `;
  return rows[0] ? mapEsim(rows[0]) : null;
}

// ─── Mutations ────────────────────────────────────────────────────────────────

/**
 * Réserve atomiquement une eSIM disponible pour une offre précise.
 * FOR UPDATE SKIP LOCKED évite les doublons en concurrence.
 */
export async function reserveEsim(
  offerId: string,
  orderId: string
): Promise<EsimInventory | null> {
  const rows = await sql`
    UPDATE esim_inventory
    SET
      status      = 'reserved',
      order_id    = ${orderId},
      reserved_at = NOW()
    WHERE id = (
      SELECT id FROM esim_inventory
      WHERE offer_id = ${offerId}
        AND status   = 'available'
      LIMIT 1
      FOR UPDATE SKIP LOCKED
    )
    RETURNING *
  `;
  return rows[0] ? mapInventory(rows[0]) : null;
}

export async function confirmEsim(orderId: string): Promise<void> {
  await sql`
    UPDATE esim_inventory
    SET status  = 'sold',
        sold_at = NOW()
    WHERE order_id = ${orderId}
      AND status   = 'reserved'
  `;
}

export async function releaseEsim(orderId: string): Promise<void> {
  await sql`
    UPDATE esim_inventory
    SET status      = 'available',
        order_id    = NULL,
        reserved_at = NULL
    WHERE order_id = ${orderId}
      AND status   = 'reserved'
  `;
}
