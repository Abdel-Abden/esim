/**
 * Modèle Order enrichi — jointure complète pour GET /orders/:id
 */
import type { OrderEntity } from '../entities/orders.js';
import { Destination } from './destinations.js';
import { Esim } from './esims.js';
import type { Offer } from './offers.js';

export interface Order extends Omit<OrderEntity, "offerId"> {
  offer: Offer;
  destination: Destination;
  esim?: Esim
}
