import { Esim, EsimInventory } from '@ilotel/shared';
import { sql } from '../client.js';
import { mapEsim, mapInventory } from "../mappers.js";

// ─── Lecture ──────────────────────────────────────────────────────────────────

export async function getAllEsims(): Promise<Esim[]> {
  const rows = await sql`
    SELECT id, name, type, flag, created_at
    FROM esims
    ORDER BY name ASC
  `;

  return rows.map(mapEsim);
}

export async function getEsimById(id: string): Promise<Esim | null> {
  const rows = await sql`
    SELECT id, name, type, flag, created_at
    FROM esims
    WHERE id = ${id}
    LIMIT 1
  `;

  return rows[0] ? mapEsim(rows[0]) : null;
}

// ─── Mise à jour ──────────────────────────────────────────────────────────────

/**
 * Réserve atomiquement une eSIM disponible pour une destination.
 * Utilise FOR UPDATE SKIP LOCKED pour éviter les doublons en concurrence.
 * Retourne null si plus de stock.
 */
export async function reserveEsim(
  esimId: string,
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
      WHERE esim_id = ${esimId}
        AND status  = 'available'
      LIMIT 1
      FOR UPDATE SKIP LOCKED
    )
    RETURNING *
  `;

  return rows[0] ? mapInventory(rows[0]) : null;
}

/**
 * Confirme la vente d'une eSIM réservée après paiement.
 */
export async function confirmEsim(orderId: string): Promise<void> {
  await sql`
    UPDATE esim_inventory
    SET status   = 'sold',
        sold_at  = NOW()
    WHERE order_id = ${orderId}
      AND status   = 'reserved'
  `;
}

/**
 * Libère une eSIM réservée si le paiement échoue.
 */
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
