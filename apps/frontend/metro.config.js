const { getDefaultConfig } = require('expo/metro-config');
const path = require('path');

const monorepoRoot = path.resolve(__dirname, '../..');
const config = getDefaultConfig(__dirname);

// ─── Monorepo watchFolders ─────────────────────────────────────────────────
config.watchFolders = [
  ...(config.watchFolders || []),
  monorepoRoot,
];

// ─── Résolution .js → .ts pour le package shared ──────────────────────────
const originalResolveRequest = config.resolver.resolveRequest;

// ─── Stub de production pour les fichiers debug ───────────────────────────
//
// En production (EXPO_PUBLIC_ENVIRONMENT !== 'local'), on remplace
// debugFixtures et DebugPanel par des stubs vides avant même le bundling.
// Résultat : ces modules n'apparaissent PAS dans le bundle final, même
// après décompilation. Aucune donnée de test, aucun code de debug exposé.
//
// Les stubs sont dans constants/debugFixtures.stub.ts et
// components/DebugPanel/DebugPanel.stub.ts — des exports vides/null.

const IS_LOCAL = !process.env.EXPO_PUBLIC_ENVIRONMENT
  || process.env.EXPO_PUBLIC_ENVIRONMENT === 'local';

const DEBUG_MODULE_STUBS = IS_LOCAL ? {} : {
  // Chemin résolu → chemin du stub
  [path.resolve(__dirname, 'constants/debugFixtures.ts')]:
    path.resolve(__dirname, 'constants/debugFixtures.stub.ts'),
  [path.resolve(__dirname, 'components/DebugPanel/DebugPanel.tsx')]:
    path.resolve(__dirname, 'components/DebugPanel/DebugPanel.stub.ts'),
};

config.resolver.resolveRequest = (context, moduleName, platform) => {
  // ── Remplacement par stub en production ──────────────────────────────
  if (!IS_LOCAL) {
    // Résout d'abord le chemin absolu du module demandé
    let resolved;
    try {
      resolved = originalResolveRequest
        ? originalResolveRequest(context, moduleName, platform)
        : context.resolveRequest(context, moduleName, platform);
    } catch {
      resolved = null;
    }

    if (resolved?.type === 'sourceFile' && DEBUG_MODULE_STUBS[resolved.filePath]) {
      return { type: 'sourceFile', filePath: DEBUG_MODULE_STUBS[resolved.filePath] };
    }

    if (resolved) return resolved;
  }

  // ── Résolution .js → .ts pour le shared package ──────────────────────
  if (moduleName.endsWith('.js')) {
    const tsVersion = moduleName.slice(0, -3) + '.ts';
    try {
      return context.resolveRequest(context, tsVersion, platform);
    } catch {}
  }

  if (originalResolveRequest) {
    return originalResolveRequest(context, moduleName, platform);
  }
  return context.resolveRequest(context, moduleName, platform);
};

module.exports = config;