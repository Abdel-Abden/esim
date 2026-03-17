/**
 * Modèle Order enrichi — jointure complète pour GET /orders/:id
 */
import type { Order } from '../entities/orders.js';
import type { OfferWithDetails } from './offers.js';
import type { EsimInventory } from '../entities/esims.js';

export interface OrderWithDetails extends Order {
  offer: OfferWithDetails;
  esimInventory: EsimInventory | null;
}
