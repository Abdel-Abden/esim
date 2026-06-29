/**
 * src/translation/web/landing/en.ts
 * English translations for the landing page.
 */

const ui = {
  lang: 'en',

  nav: {
    home: 'Home',
    destinations: 'Destinations',
    plans: 'Plans',
    how: 'How it works',
    download: 'Download the app',
  },

  hero: {
    tag: 'ONE CONNECTION · EVERYWHERE.',
    title: 'Stay Connected Wherever You Travel',
    subtitle: 'Stay connected around the world with our international SIM and eSIM plans.',
    badge1: '✓ 190+ countries',
    badge2: '⚡ 2-minute setup',
    badge3: '🔒 Secure payments',
    storeAvailable: 'Available on',
    storeDownload: 'Download on',
  },

  featured: {
    title: '⭐ Recommended Plan',
    sub: 'Our most popular plan for traveling anywhere.',
    tag: '⭐ BEST VALUE',
    name: 'Europe',
    details: '190+ countries · 4G/5G · Ready in 2 minutes',
    from: 'from',
    cta: 'View plan →',
  },

  dest: {
    title: '🌍 Destinations',
    sub: 'Choose your destination and order in just a few clicks.',
    filterAll: '🌐 All',
    europe: '🇪🇺 Europe',
    asia: '🌏 Asia',
    americas: '🌎 Americas',
    africa: '🌍 Africa',
    search: 'Search a country…',
    empty: '😕 No destination found',
    destinations: [
      { name: 'Morocco', emoji: '🇲🇦', price: '9.99€', region: 'africa' },
      { name: 'Algeria', emoji: '🇩🇿', price: '11.99€', region: 'africa' },
      { name: 'Tunisia', emoji: '🇹🇳', price: '11.99€', region: 'africa' },
      { name: 'France', emoji: '🇫🇷', price: '7.99€', region: 'europe' },
      { name: 'Spain', emoji: '🇪🇸', price: '7.99€', region: 'europe' },
      { name: 'Europe', emoji: '🇪🇺', price: '11.99€', region: 'europe' },
      { name: 'Japan', emoji: '🇯🇵', price: '11.99€', region: 'asia' },
      { name: 'Thailand', emoji: '🇹🇭', price: '8.99€', region: 'asia' },
      { name: 'Singapore', emoji: '🇸🇬', price: '11.99€', region: 'asia' },
      { name: 'United States', emoji: '🇺🇸', price: '14.99€', region: 'americas' },
      { name: 'Mexico', emoji: '🇲🇽', price: '9.99€', region: 'americas' },
    ],
  },

  how: {
    title: '💡 How it works',
    sub: 'Fast, simple and hassle-free.',
    steps: [
      {
        title: 'Choose your plan',
        desc: 'Select your destination, then choose a SIM card or an eSIM depending on your device.',
      },
      {
        title: 'Secure checkout',
        desc: 'Pay securely with Stripe. Your order is processed instantly.',
      },
      {
        title: 'Stay connected',
        desc: 'Install your eSIM instantly or receive your SIM card and enjoy mobile data as soon as you arrive.',
      },
    ],
  },

  plans: {
    title: '💳 Our Plans',
    sub: 'Choose the plan that fits your trip.',
    popular: '⭐ MOST POPULAR',
    order: 'Order now →',
    features: [
      '✅ 4G/5G included',
      '✅ 190+ countries',
      '✅ Ready in 2 minutes',
      '✅ 24/7 support',
    ],
    cards: [
      { data: '10 GB', duration: '⏱ Valid for 15 days', price: '18.99€', popular: true },
      { data: '30 GB', duration: '⏱ Valid for 30 days', price: '34.99€', popular: false },
    ],
  },

  why: {
    title: '🚀 Why ILOTEL?',
    sub: 'The easiest way to stay connected abroad.',
    cards: [
      {
        icon: '🌍',
        title: '190+ destinations',
        desc: 'International plans available in more than 190 countries.',
      },
      {
        icon: '📱',
        title: 'SIM & eSIM',
        desc: 'Choose the solution that best matches your smartphone or tablet.',
      },
      {
        icon: '⚡',
        title: 'Instant connectivity',
        desc: 'Activate your line within minutes and stay connected from the moment you arrive.',
      },
      {
        icon: '🔒',
        title: 'Secure payments',
        desc: 'Order with confidence thanks to Stripe secure payment.',
      },
    ],
  },

  download: {
    title: '📱 Download ILOTEL',
    sub: 'Available for free on iOS and Android. Order your SIM or eSIM in just a few taps.',
  },

  footer: {
    tagline: 'ONE CONNECTION · EVERYWHERE.',
    legal: 'Legal Notice',
    privacy: 'Privacy Policy',
    contact: 'Contact',
    faq: 'FAQ',
    copy: '© 2025 ILOTEL. All rights reserved.',
  },
};

export { ui };
