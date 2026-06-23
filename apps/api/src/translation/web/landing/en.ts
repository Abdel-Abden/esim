/**
 * src/translation/web/landing/en.ts
 * English translations for the landing page.
 */

const ui = {
  lang: 'en',

  nav: {
    home:         'Home',
    destinations: 'Destinations',
    plans:        'Plans',
    how:          'How it works',
    download:     'Download the app',
  },

  hero: {
    tag:      'ONE ESIM · EVERYWHERE.',
    title:    'Travel connected,\nno physical SIM needed',
    subtitle: 'Buy your eSIM. Activate in 2 min across 190+ countries.',
    badge1:   '✓ 190+ countries',
    badge2:   '⚡ 2 minutes',
    badge3:   '🔒 Stripe',
    storeAvailable: 'Available on',
    storeDownload:  'Download on',
  },

  featured: {
    title:   '⭐ Featured offer',
    sub:     'Our most popular plan for traveling everywhere',
    tag:     '⭐ RECOMMENDED',
    name:    'Europe',
    details: '190+ countries · 4G/5G · Activate in 2 min',
    from:    'from',
    cta:     'View plan →',
  },

  dest: {
    title:     '🌍 Destinations',
    sub:       'Select your destination and order your eSIM in a few clicks',
    filterAll: '🌐 All',
    europe:    '🇪🇺 Europe',
    asia:      '🌏 Asia',
    americas:  '🌎 Americas',
    africa:    '🌍 Africa',
    search:    'Search a country…',
    empty:     '😕 No destinations found',
    destinations: [
      { name: 'Morocco',        emoji: '🇲🇦', price: '€9.99',  region: 'africa'   },
      { name: 'Algeria',        emoji: '🇩🇿', price: '€11.99', region: 'africa'   },
      { name: 'Tunisia',        emoji: '🇹🇳', price: '€11.99', region: 'africa'   },
      { name: 'France',         emoji: '🇫🇷', price: '€7.99',  region: 'europe'   },
      { name: 'Spain',          emoji: '🇪🇸', price: '€7.99',  region: 'europe'   },
      { name: 'Europe',         emoji: '🇪🇺', price: '€11.99', region: 'europe'   },
      { name: 'Japan',          emoji: '🇯🇵', price: '€11.99', region: 'asia'     },
      { name: 'Thailand',       emoji: '🇹🇭', price: '€8.99',  region: 'asia'     },
      { name: 'Singapore',      emoji: '🇸🇬', price: '€11.99', region: 'asia'     },
      { name: 'United States',  emoji: '🇺🇸', price: '€14.99', region: 'americas' },
      { name: 'Mexico',         emoji: '🇲🇽', price: '€9.99',  region: 'americas' },
    ],
  },

  how: {
    title: '💡 How it works',
    sub:   'Simple, fast, effortless',
    steps: [
      { title: 'Choose',  desc: 'Select your destination and the plan that fits your trip.' },
      { title: 'Pay',     desc: 'Pay securely via Stripe. Encrypted and instant.' },
      { title: 'Connect', desc: 'Scan the QR Code received and activate your eSIM in under 2 minutes.' },
    ],
  },

  plans: {
    title:   '💳 Our plans',
    sub:     'Choose the plan that fits your trip',
    popular: '⭐ POPULAR',
    order:   'Order →',
    features: [
      '✅ 4G/5G included',
      '✅ 190+ countries',
      '✅ Activate in 2 min',
      '✅ 24/7 support',
    ],
    cards: [
      { data: '10 GB', duration: '⏱ 15 days validity', price: '€18.99', popular: true  },
      { data: '30 GB', duration: '⏱ 30 days validity', price: '€34.99', popular: false },
    ],
  },

  why: {
    title: '🚀 Why ILOTEL eSIM?',
    sub:   'The best way to stay connected abroad',
    cards: [
      { icon: '🌐', title: '190+ countries covered',      desc: 'Worldwide coverage to travel anywhere without constraints.' },
      { icon: '⚡', title: '2-minute activation',          desc: 'Scan, activate, connect. As simple as that.' },
      { icon: '🔒', title: 'Secure Stripe payment',        desc: 'Your payment data is encrypted and protected on every transaction.' },
      { icon: '💰', title: 'Competitive prices',           desc: 'No hidden fees. What you see is what you pay.' },
    ],
  },

  download: {
    title: '📱 Download ILOTEL eSIM',
    sub:   'Free on iOS and Android. Order your eSIM in seconds.',
  },

  footer: {
    tagline: 'ONE ESIM · EVERYWHERE.',
    legal:   'Legal notice',
    privacy: 'Privacy',
    contact: 'Contact',
    faq:     'FAQ',
    copy:    '© 2025 ILOTEL eSIM. All rights reserved.',
  },
};

export { ui };
