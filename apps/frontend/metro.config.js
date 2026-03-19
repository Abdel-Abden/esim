const { getDefaultConfig } = require('expo/metro-config');
const path = require('path');

const config = getDefaultConfig(__dirname);

const monorepoRoot = path.resolve(__dirname, '../..');

config.watchFolders = [monorepoRoot];

// Résout les imports .js → .ts pour le package shared
const originalResolver = config.resolver.resolveRequest;
config.resolver.resolveRequest = (context, moduleName, platform) => {
  if (moduleName.endsWith('.js')) {
    const tsVersion = moduleName.slice(0, -3) + '.ts';
    try {
      return context.resolveRequest(context, tsVersion, platform);
    } catch {}
  }
  return context.resolveRequest(context, moduleName, platform);
};

module.exports = config;