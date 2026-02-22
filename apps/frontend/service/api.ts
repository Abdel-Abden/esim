// service/api.ts
// Client HTTP de base — tous les appels vers l'API Hono passent par ici

const BASE_URL = process.env.EXPO_PUBLIC_API_URL ?? 'http://localhost:3000';

type ApiResponse<T> = { data: T; error: null } | { data: null; error: string };

export async function apiFetch<T>(
  path: string,
  options?: RequestInit
): Promise<ApiResponse<T>> {
  try {
    console.log(`DEBUG: url = ${BASE_URL}${path}`)
    const res = await fetch(`${BASE_URL}${path}`, {
      headers: {
        'Content-Type': 'application/json',
        ...options?.headers,
      },
      ...options,
    });

    const json = await res.json();

    if (!res.ok) {
      return { data: null, error: json.message ?? `Erreur ${res.status}` };
    }

    return { data: json as T, error: null };
  } catch (err) {
    console.error(`[apiFetch] ${path}`, err);
    return { data: null, error: 'Erreur réseau. Vérifiez votre connexion.' };
  }
}