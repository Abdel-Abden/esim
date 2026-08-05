import { Esim } from '@ilotel/shared';
import { sql } from '../client.js';
import { mapEsim } from '../mappers.js';


// ─── Création ─────────────────────────────────────────────────────────────────

export async function createEsimHistory(esimId: string, orderId: string): Promise<boolean> {
    const row = await sql`
        INSERT INTO esim_history (esim_id, order_id)
        VALUES (${esimId}, ${orderId})
        RETURNING created_at
    `;

    return row.length > 0;
}

// ─── Lecture ──────────────────────────────────────────────────────────────────

export async function getEsimByOrderId(
  orderId: string
): Promise<Esim | null> {
  const rows = await sql`
    SELECT * FROM esims
    WHERE id = ( SELECT id from esim_history where order_id = ${orderId} LIMIT 1)
    LIMIT 1
  `;
  return rows[0] ? mapEsim(rows[0]) : null;
}

// ─── Mise à jour ──────────────────────────────────────────────────────────────

/**
 * Réserve atomiquement une eSIM disponible pour une offre précise.
 * FOR UPDATE SKIP LOCKED évite les doublons en concurrence.
 */
export async function reserveEsim(): Promise<Esim | null> {
  const rows = await sql`
    UPDATE esims
    SET
      status      = 'reserved',
      reserved_at = NOW()
    WHERE id = (
      SELECT id FROM esims
      WHERE status   = 'available'
      LIMIT 1
      FOR UPDATE SKIP LOCKED
    )
    RETURNING *
  `;
  return rows[0] ? mapEsim(rows[0]) : null;
}

export async function confirmEsim(esimId: string): Promise<void> {
  await sql`
    UPDATE esims
    SET status  = 'sold',
        sold_at = NOW()
    WHERE id = ${esimId}
      AND status   = 'reserved'
  `;
}

export async function releaseEsim(esimId: string): Promise<void> {
  await sql`
    WITH deleted_history AS (
      DELETE FROM esim_history
      WHERE esim_id = ${esimId}
      RETURNING order_id
    ),
    deleted_order AS (
      DELETE FROM orders
      WHERE id IN (SELECT order_id FROM deleted_history)
      RETURNING id
    ),
    updated_esim AS (
      UPDATE esims
      SET status = 'available',
          reserved_at = NULL
      WHERE id = ${esimId}
        AND status = 'reserved'
      RETURNING id
    )
    SELECT 1
  `;
}

export async function releaseEsimByOrderId(orderId: string): Promise<void> {
  await sql`
    WITH deleted_history AS (
      DELETE FROM esim_history
      WHERE order_id = ${orderId}
      RETURNING esim_id
    ),
    updated_esim AS (
      UPDATE esims
      SET status = 'available',
          reserved_at = NULL
      WHERE id IN (SELECT esim_id FROM deleted_history)
        AND status = 'reserved'
      RETURNING id
    ),
    deleted_order AS (
      DELETE FROM orders
      WHERE id = ${orderId}
      RETURNING id
    )
    SELECT 1
  `
}