// app/api/esims+api.ts
// GET — Liste tous les eSIM produits avec leurs offres

import { sql } from '@/db/client';

export async function GET() {
  try {
    // Tous les esims avec leurs offres
    const rows = await sql`
      SELECT
        e.id        AS esim_id,
        e.name,
        e.type,
        e.flag,
        o.id        AS offer_id,
        o.data_gb,
        o.duration_days,
        o.base_price,
        o.is_promo,
        -- Stock disponible pour cette offre
        COUNT(inv.id) FILTER (WHERE inv.status = 'available') AS stock
      FROM esims e
      JOIN offers o           ON o.esim_id = e.id
      LEFT JOIN esim_inventory inv ON inv.esim_id = e.id
      GROUP BY e.id, e.name, e.type, e.flag, o.id, o.data_gb, o.duration_days, o.base_price, o.is_promo
      ORDER BY e.name, o.base_price
    `;

    // Grouper les offres par eSIM
    const esimsMap: Record<string, any> = {};

    for (const row of rows) {
      if (!esimsMap[row.esim_id]) {
        esimsMap[row.esim_id] = {
          id: row.esim_id,
          name: row.name,
          type: row.type,
          flag: row.flag,
          offers: [],
        };
      }

      esimsMap[row.esim_id].offers.push({
        id: row.offer_id,
        dataGb: row.data_gb,
        durationDays: row.duration_days,
        price: Number(row.base_price),
        isPromo: row.is_promo,
        inStock: Number(row.stock) > 0,
      });
    }

    return Response.json(Object.values(esimsMap));
  } catch (err) {
    console.error('[GET /api/esims]', err);
    return Response.json({ error: 'Erreur serveur.' }, { status: 500 });
  }
}
