/**
 * Entités liées aux eSIMs — reflètent exactement les tables `esims` et `esim_inventory`
 */

/** Table `esims` — représente une destination / produit eSIM */
export interface Esim {
  id: string;
  name: string;         // ex: "France", "Europe 30 pays"
  code: string;         // ex: "fr", "eu", "af", "ar"
  type: string;         // "country" | "region" | "world"
  flag: string;         // emoji ou code ISO
  region: string;       // "europe" | "asia" | "americas" | "africa" | "global"
  regionCountries?: Record<string, Record<string, CountryNetworkInfo>>; // list des code pays gérer par cette région
  featured: boolean;
}

export interface CountryNetworkInfo {
  '3G': boolean;
  '4G': boolean;
  '5G': boolean;
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
  msisdn: string;
}
