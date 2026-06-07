// service/api.ts
// Client HTTP de base — tous les appels vers l'API Hono passent par ici

import { ErrorCode } from "@ilotel/shared";
import { t } from "i18next";

const BASE_URL = process.env.EXPO_PUBLIC_API_URL ?? 'http://10.0.2.2:3000'; // localhost pour émulateur android

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
      return { data: null, error: json.message ?? `Erreur ${res.status}` };
    }

    return { data: json as T, error: null };
  } catch (err) {
    console.log(`${BASE_URL}${path}`)
    console.error(`[apiFetch] ${path}`, err);
    return { data: null, error: t(`errors.${ErrorCode.NETWORK_ENAVABLE}`)}; // error: 'Erreur réseau. Vérifiez votre connexion.' 
  }
}