// app/api/orders/[id]+api.ts
// GET — Récupère les détails d'une commande après paiement

import { sql } from '@/db/client';

export async function GET(
  _request: Request,
  { params }: { params: { id: string } }
) {
  try {
    const { id } = params;

    const [order] = await sql`
      SELECT
        o.id,
        o.email,
        o.amount,
        o.status,
        o.paid_at,
        o.created_at,
        inv.iccid,
        e.name  AS esim_name,
        e.flag,
        of.data_gb,
        of.duration_days
      FROM orders o
      JOIN offers of        ON of.id  = o.offer_id
      JOIN esims e          ON e.id   = of.esim_id
      LEFT JOIN esim_inventory inv ON inv.id = o.inventory_id
      WHERE o.id = ${id}
    `;

    if (!order) {
      return Response.json({ error: 'Commande introuvable.' }, { status: 404 });
    }

    // Ne pas exposer l'ICCID si le paiement n'est pas confirmé
    if (order.status !== 'paid') {
      return Response.json({ error: 'Paiement non confirmé.' }, { status: 402 });
    }

    return Response.json({
      id: order.id,
      email: order.email,
      amount: order.amount,
      paidAt: order.paid_at,
      iccid: order.iccid,
      esim: {
        name: order.esim_name,
        flag: order.flag,
        dataGb: order.data_gb,
        durationDays: order.duration_days,
      },
    });
  } catch (err) {
    console.error('[GET /api/orders/:id]', err);
    return Response.json({ error: 'Erreur serveur.' }, { status: 500 });
  }
}
