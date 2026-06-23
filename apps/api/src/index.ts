import { ErrorCode } from '@ilotel/shared';
import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { HTTPException } from 'hono/http-exception';
import { logger } from 'hono/logger';
import { rateLimitMiddleware } from './middleware/rateLimit.js';
import { cron } from './routes/cron.js';
import { esims } from './routes/esims.js';
import { landing } from './routes/landing/landing.js';
import { legal } from './routes/legal/legal.js';
import { orders } from './routes/orders.js';
import { stripeWebhook } from './routes/webhooks/stripe.js';

const app = new Hono();

// ─── Middleware ───────────────────────────────────────────────────────────────

app.use('*', logger());
app.use('*', cors({
  origin: [
    'https://api.ilotel.com',
    'http://localhost:3000'
  ],
  allowMethods: ['GET', 'POST', 'OPTIONS'],
  allowHeaders: ['Content-Type', 'Authorization'],
}));

// ─── Routes ───────────────────────────────────────────────────────────────────

// Landing page vitrine
app.route('/', landing);

// Healthcheck déplacé sur /health — pour Vercel et les monitoring externes
app.get('/health', (c) => c.json({ status: 'ok', service: 'ilotel-api' }));
app.use('/esims/*', rateLimitMiddleware);
app.use('/orders/*', rateLimitMiddleware);

app.route('/esims', esims);
app.route('/orders', orders);
app.route('/cron', cron);
app.route('/legal', legal);
app.route('/webhooks/stripe', stripeWebhook);

// ─── Gestion d'erreurs globale ────────────────────────────────────────────────

app.onError((err, c) => {
  // Erreurs HTTP explicites (ex: 404, 422 levés manuellement)
  if (err instanceof HTTPException) {
    console.error('[http exception]', err.status, err.message);
    return c.json({ code: ErrorCode.INTERNAL_SERVER_ERROR }, err.status);
  }

  // Erreurs inattendues — ne pas exposer le détail en prod
  console.error('[api error]', err);
  return c.json({ code: ErrorCode.INTERNAL_SERVER_ERROR }, 500);
});

app.notFound((c) => {
  console.error('[api error]', c.req.method, c.req.url);
  return c.json({ code: ErrorCode.INTERNAL_SERVER_ERROR }, 500)
});

export default app;