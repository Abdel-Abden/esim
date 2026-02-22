// service/api.ts
// Helper fetch client — appelle les Expo API Routes (server-side)
// Aucune clé secrète ici, tout passe par /api/*

const BASE_URL = process.env.EXPO_PUBLIC_API_URL ?? '';

type ApiResponse<T> = { data: T; error: null } | { data: null; error: string };

export async function apiFetch<T>(
  path: string,
  options?: RequestInit
): Promise<ApiResponse<T>> {
  try {
    const res = await fetch(`${BASE_URL}${path}`, {
      headers: {
        'Content-Type': 'application/json',
        ...options?.headers,
      },
      ...options,
    });

    const json = await res.json();

    if (!res.ok) {
      return { data: null, error: json.error ?? `Erreur ${res.status}` };
    }

    return { data: json as T, error: null };
  } catch (err) {
    console.error(`[apiFetch] ${path}`, err);
    return { data: null, error: 'Erreur réseau. Vérifiez votre connexion.' };
  }
}
