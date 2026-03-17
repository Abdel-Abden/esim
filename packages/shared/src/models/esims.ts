/**
 * Modèles eSIM enrichis — résultats de jointures / agrégations SQL
 */
import type { Esim } from '../entities/esims.js';

/**
 * eSIM avec données agrégées depuis ses offres.
 * Retourné par GET /esims — 1 seul appel réseau pour la liste complète.
 *
 * - minPrice  : prix de l'offre disponible la moins chère (null = aucun stock)
 * - hasPromo  : au moins une offre en promotion avec stock disponible
 * - hasStock  : au moins une offre disponible
 */
export interface EsimSummary extends Esim {
  minPrice: number | null;
  hasPromo: boolean;
  hasStock: boolean;
}
