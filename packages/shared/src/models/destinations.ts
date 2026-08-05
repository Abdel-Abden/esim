/**
 * Modèles Destination enrichis — résultats de jointures / agrégations SQL
 */
import type { DestinationEntity } from '../entities/destinations.js';
import type { Offer } from './offers.js';

/**
 * Destination avec données agrégées depuis ses offres.
 * Retourné par GET /esims — 1 seul appel réseau pour la liste complète.
 *
 * - minPrice  : prix de l'offre disponible la moins chère (null = aucun stock)
 * - hasPromo  : au moins une offre en promotion avec stock disponible
 * - hasStock  : au moins une offre disponible
 */

export interface Destination extends DestinationEntity {
  offers?: Offer[];
  minPrice: number | null;
  hasPromo: boolean;
}
