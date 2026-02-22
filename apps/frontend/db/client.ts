// ⚠️  Ce fichier est SERVER-SIDE uniquement.
// Il ne doit jamais être importé depuis un composant React ou une page Expo.
// Uniquement depuis app/api/**+api.ts

import { neon } from '@neondatabase/serverless';

if (!process.env.DATABASE_URL) {
  throw new Error('DATABASE_URL manquante dans les variables d\'environnement.');
}

export const sql = neon(process.env.DATABASE_URL);
