/**
 * src/routes/landing/landing.ts
 *
 * Page vitrine publique — remplace le healthcheck sur GET /.
 * La langue est résolue via Accept-Language ou le query param ?lang=xx.
 * Le healthcheck est déplacé sur GET /health.
 */

import { Hono } from 'hono';
import { getWebLocale } from '../../translation/index.js';
import { buildLandingPage } from './html.js';

export const landing = new Hono();

// ─── GET / ────────────────────────────────────────────────────────────────────

landing.get('/', (c) => {
  const queryLang = c.req.query('lang');
  const { landing: content } = getWebLocale(c.req.header('accept-language'), queryLang);
  return c.html(buildLandingPage(content.ui));
});

// ─── GET /health ──────────────────────────────────────────────────────────────
// Healthcheck déplacé ici — utile pour Vercel et les monitoring externes.

landing.get('/health', (c) => c.json({ status: 'ok', service: 'ilotel-api' }));
