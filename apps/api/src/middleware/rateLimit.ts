import { Context, Next } from 'hono';

/**
 * Rate limiter in-memory — fonctionne en dev local.
 *
 * ⚠️  Sur Vercel serverless chaque invocation est isolée,
 * donc ce store ne persiste pas entre les requêtes en production.
 * Pour la prod, remplacer par Upstash Redis :
 * https://upstash.com/docs/redis/sdks/ratelimit-ts/overview
 *
 * Installation : npm install @upstash/ratelimit @upstash/redis
 * Variables à ajouter : UPSTASH_REDIS_REST_URL, UPSTASH_REDIS_REST_TOKEN
 */

const store = new Map<string, { count: number; resetAt: number }>();

const WINDOW_MS = 60_000; // 1 minute glissante

// Limites par route (requêtes/minute/IP)
const LIMITS: Record<string, number> = {
  '/orders':  20,
  '/esims':   60,
  default:    60,
};

function getLimit(path: string): number {
  // Cas spécial pour les sous-routes
  if (path.includes('/reserve'))  return 10;
  if (path.includes('/checkout')) return 10;
  if (path.includes('/cancel'))   return 10;

  const base = '/' + path.split('/')[1];
  return LIMITS[base] ?? LIMITS.default;
}

export async function rateLimitMiddleware(c: Context, next: Next) {
  const ip =
    c.req.header('x-forwarded-for')?.split(',')[0].trim() ??
    c.req.header('x-real-ip') ??
    'unknown';

  const path = c.req.path;
  const limit = getLimit(path);
  const key = `${ip}:${path}`;
  const now = Date.now();

  const entry = store.get(key);

  if (!entry || now > entry.resetAt) {
    store.set(key, { count: 1, resetAt: now + WINDOW_MS });
    await next();
    return;
  }

  if (entry.count >= limit) {
    const retryAfter = Math.ceil((entry.resetAt - now) / 1000);
    c.header('Retry-After', String(retryAfter));
    return c.json({ message: 'Trop de requêtes, réessayez dans un instant.' }, 429);
  }

  entry.count++;
  await next();
}