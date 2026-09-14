const { withAndroidManifest } = require('@expo/config-plugins');

/**
 * Ajoute un élément <queries> dans AndroidManifest.xml pour déclarer
 * le package WhatsApp, requis par Android 11+ pour que
 * Linking.canOpenURL('whatsapp://...') fonctionne correctement.
 */
const withAndroidWhatsappQuery = (config) => {
  return withAndroidManifest(config, (config) => {
    const manifest = config.modResults.manifest;

    if (!manifest.queries) {
      manifest.queries = [{}];
    }

    const queries = manifest.queries[0];

    if (!queries.package) {
      queries.package = [];
    }

    const alreadyDeclared = queries.package.some(
      (p) => p.$ && p.$['android:name'] === 'com.whatsapp',
    );

    if (!alreadyDeclared) {
      queries.package.push({
        $: { 'android:name': 'com.whatsapp' },
      });
    }

    return config;
  });
};

module.exports = withAndroidWhatsappQuery;
