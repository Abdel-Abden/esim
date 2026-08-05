/**
 * Entités liées aux Destination
 */

export const DestinationType = {
  LOCAL: 'local',
  REGION: 'region',
  GLOBAL: 'global',
} as const;

export type DestinationType =
  typeof DestinationType[keyof typeof DestinationType];

/** Table `destination` — représente une destination /* groupe produit d'eSIM */
export interface DestinationEntity {
  id: string;
  code: string;           // iso 3166-2, ex: "fr", "eu", "af", "ar"
  featured: boolean;      // offre disponible
  type: DestinationType;
  flag: string;           // emoji drapeaux
  region: string;         // "europe" | "asia" | "americas" | "africa" | "global"
  coverage: Record<string, Record<string, CountryNetworkInfo>>; // <CountryCode, Record<Operator, CountryNetworkInfo>
}

export interface CountryNetworkInfo {
  '3G': boolean;
  '4G': boolean;
  '5G': boolean;
}

// export type InventoryStatus = 'available' | 'reserved' | 'sold';

// /** Table `esim_inventory` — carte eSIM physique assignable à une commande */
// export interface EsimInventory {
//   id: string;
//   esimId: string;
//   offerId: string;
//   iccid: string;
//   status: InventoryStatus;
//   reservedAt: string | null;
//   soldAt: string | null;
//   activationCode: string;
//   orderId: string | null;
//   msisdn: string;
// }
