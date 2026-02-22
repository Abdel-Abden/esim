// ⚠️  SERVER-SIDE uniquement — clé secrète Stripe
// Uniquement importé depuis app/api/**+api.ts

import Stripe from 'stripe';

if (!process.env.STRIPE_SECRET_KEY) {
  throw new Error('STRIPE_SECRET_KEY manquante dans les variables d\'environnement.');
}

export const stripe = new Stripe(process.env.STRIPE_SECRET_KEY, {
  apiVersion: '2025-02-24.acacia',
});
