/**
 * Entités liées aux eSIMs — reflètent exactement les tables `esims` et `esim_inventory`
 */

/** Table `esims` — représente une destination / produit eSIM */
export interface Esim {
  id: string;
  name: string;         // ex: "France", "Europe 30 pays"
  type: string;         // "country" | "region" | "global"
  flag: string;         // emoji ou code ISO
  region: string;       // "europe" | "asia" | "americas" | "africa" | "global"
  createdAt: string;
}

export type InventoryStatus = 'available' | 'reserved' | 'sold';

/** Table `esim_inventory` — carte eSIM physique assignable à une commande */
export interface EsimInventory {
  id: string;
  esimId: string;
  offerId: string;
  iccid: string;
  status: InventoryStatus;
  reservedAt: string | null;
  soldAt: string | null;
  activationCode: string;
  orderId: string | null;
}
