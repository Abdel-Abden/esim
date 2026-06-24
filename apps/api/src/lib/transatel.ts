// =============================================================================
// Transatel API client
//
// Gestion :
//   - Auth OAuth2 client_credentials avec cache + refresh automatique sur 401
//   - OCS : assignation d'un forfait à une eSIM au moment de la commande
// =============================================================================

const BASE_URL = process.env.TRANSATEL_API_URL!; // https://api.transatel.com
const MVNO_REF = process.env.TRANSATEL_MVNO_REF!;

// ─── Auth ─────────────────────────────────────────────────────────────────────

let cachedToken: { value: string; expiresAt: number } | null = null;

/**
 * Lit le champ `exp` directement depuis le payload JWT sans lib externe.
 * Retourne le timestamp en millisecondes.
 */
function getTokenExpiry(jwt: string): number {
  try {
    const payload = jwt.split('.')[1];
    const decoded = JSON.parse(Buffer.from(payload, 'base64url').toString('utf-8'));
    return decoded.exp * 1000;
  } catch {
    return 0; // JWT malformé → considéré expiré
  }
}

async function fetchNewToken(): Promise<string> {
  const credentials = Buffer.from(
    `${process.env.TRANSATEL_CLIENT_ID}:${process.env.TRANSATEL_CLIENT_SECRET}`
  ).toString('base64');

  const res = await fetch(`${BASE_URL}/authentication/api/token`, {
    method: 'POST',
    headers: {
      Authorization: `Basic ${credentials}`,
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: 'grant_type=client_credentials',
  });

  if (!res.ok) {
    throw new Error(`Transatel auth failed: HTTP ${res.status}`);
  }

  const data = await res.json();
  return data.access_token as string;
}

/**
 * Retourne un token valide.
 * Vérifie l'expiration via le champ `exp` du JWT avec 60s de marge.
 * Si expiré ou absent : en redemande un nouveau.
 */
async function getAccessToken(): Promise<string> {
  const MARGIN_MS = 60_000;

  if (cachedToken && Date.now() < cachedToken.expiresAt - MARGIN_MS) {
    return cachedToken.value;
  }

  const token = await fetchNewToken();
  cachedToken = { value: token, expiresAt: getTokenExpiry(token) };
  console.log(`[transatel] 🔑 Nouveau token, expire à ${new Date(cachedToken.expiresAt).toISOString()}`);
  return cachedToken.value;
}

// ─── Fetch avec retry automatique sur 401 ────────────────────────────────────

/**
 * Wrapper autour de fetch qui :
 * 1. Récupère un token valide avant chaque appel
 * 2. Si 401 reçu malgré tout (race condition, révocation) :
 *    invalide le cache, obtient un nouveau token et retente une seule fois
 */
async function transatelFetch(
  path: string,
  options: Omit<RequestInit, 'headers'>
): Promise<Response> {
  const doRequest = async (): Promise<Response> => {
    const token = await getAccessToken();
    return fetch(`${BASE_URL}${path}`, {
      ...options,
      headers: {
        Authorization: `Bearer ${token}`,
        'Content-Type': 'application/json',
      },
    });
  };

  let res = await doRequest();

  if (res.status === 401) {
    console.warn('[transatel] 401 reçu — token invalidé, nouvelle tentative d\'auth');
    cachedToken = null;
    res = await doRequest();
  }

  return res;
}

// ─── OCS : assignation d'un forfait à une eSIM ───────────────────────────────

export interface AssignOfferResult {
  subscriptionId: string;
}

/**
 * Assigne un forfait Transatel à une eSIM via l'API OCS.
 *
 * Utilise orderType "preload" : la SIM reste pre-activée jusqu'à l'utilisation.
 * Le forfait est activé automatiquement au premier attach réseau du client.
 *
 * @param msisdn             MSISDN de la SIM (depuis esim_inventory)
 * @param transatelProductId Identifiant du forfait Transatel (depuis offers)
 */
export async function assignOfferToEsim(
  msisdn: string,
  transatelProductId: string
): Promise<AssignOfferResult> {
  const foo = JSON.stringify({
      bind:      { msisdn },
      product:   { productId: transatelProductId },
      payment:   { provider: process.env.TRANSATEL_PAYMENT_PROVIDER ?? 'customer' },
      source:    'api',
      orderType: 'preload',
      mvnoRef:   MVNO_REF,
    })
  console.log(`[ DEBUG ] ${foo}`)
  const res = await transatelFetch('/ocs/subscriptions/api/orders/products', {
    method: 'POST',
    body: foo,
  });

  if (!res.ok) {
    const body = await res.text();
    throw new Error(
      `Transatel OCS assign failed for MSISDN ${msisdn}: HTTP ${res.status} — ${body}`
    );
  }

  const data = await res.json();
  return { subscriptionId: data.subscriptionId };
}
