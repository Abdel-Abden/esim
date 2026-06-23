/**
 * src/translation/web/landing/fr.ts
 * Traductions françaises de la page vitrine.
 */

export const ui = {
  lang: 'fr',

  nav: {
    home:         'Accueil',
    destinations: 'Destinations',
    plans:        'Tarifs',
    how:          'Comment ça marche',
    download:     "Télécharger l'app",
  },

  hero: {
    tag:      'ONE ESIM · EVERYWHERE.',
    title:    'Voyagez connecté,\nsans carte physique',
    subtitle: 'Achetez votre eSIM. Activez en 2 min dans 190+ pays.',
    badge1:   '✓ 190+ pays',
    badge2:   '⚡ 2 minutes',
    badge3:   '🔒 Stripe',
    storeAvailable: 'Disponible sur',
    storeDownload:  'Télécharger sur',
  },

  featured: {
    title:   '⭐ Offre recommandée',
    sub:     'Notre forfait le plus populaire pour voyager partout',
    tag:     '⭐ RECOMMANDÉ',
    name:    'Europe',
    details: '190+ pays · 4G/5G · Activation en 2 min',
    from:    'dès',
    cta:     'Voir le forfait →',
  },

  dest: {
    title:     '🌍 Destinations',
    sub:       'Sélectionnez votre destination et commandez votre eSIM en quelques clics',
    filterAll: '🌐 Tous',
    europe:    '🇪🇺 Europe',
    asia:      '🌏 Asie',
    americas:  '🌎 Amériques',
    africa:    '🌍 Afrique',
    search:    'Rechercher un pays…',
    empty:     '😕 Aucune destination trouvée',
    destinations: [
      { name: 'Maroc',       emoji: '🇲🇦', price: '9.99€',  region: 'africa'   },
      { name: 'Algérie',     emoji: '🇩🇿', price: '11.99€', region: 'africa'   },
      { name: 'Tunisie',     emoji: '🇹🇳', price: '11.99€', region: 'africa'   },
      { name: 'France',      emoji: '🇫🇷', price: '7.99€',  region: 'europe'   },
      { name: 'Espagne',     emoji: '🇪🇸', price: '7.99€',  region: 'europe'   },
      { name: 'Europe',      emoji: '🇪🇺', price: '11.99€', region: 'europe'   },
      { name: 'Japon',       emoji: '🇯🇵', price: '11.99€', region: 'asia'     },
      { name: 'Thaïlande',   emoji: '🇹🇭', price: '8.99€',  region: 'asia'     },
      { name: 'Singapour',   emoji: '🇸🇬', price: '11.99€', region: 'asia'     },
      { name: 'États-Unis',  emoji: '🇺🇸', price: '14.99€', region: 'americas' },
      { name: 'Mexique',     emoji: '🇲🇽', price: '9.99€',  region: 'americas' },
    ],
  },

  how: {
    title: '💡 Comment ça marche',
    sub:   'Simple, rapide, sans effort',
    steps: [
      { title: 'Choisissez',     desc: 'Sélectionnez votre destination et le forfait adapté à votre voyage.' },
      { title: 'Payez',          desc: 'Réglez en toute sécurité via Stripe. Paiement chiffré et instantané.' },
      { title: 'Connectez-vous', desc: 'Scannez le QR Code reçu et activez votre eSIM en moins de 2 minutes.' },
    ],
  },

  plans: {
    title:   '💳 Nos forfaits',
    sub:     'Choisissez la formule qui correspond à votre voyage',
    popular: '⭐ POPULAIRE',
    order:   'Commander →',
    features: [
      '✅ 4G/5G inclus',
      '✅ 190+ pays',
      '✅ Activation en 2 min',
      '✅ Support 24/7',
    ],
    cards: [
      { data: '10 Go', duration: '⏱ 15 jours de validité', price: '18.99€', popular: true  },
      { data: '30 Go', duration: '⏱ 30 jours de validité', price: '34.99€', popular: false },
    ],
  },

  why: {
    title: '🚀 Pourquoi ILOTEL eSIM ?',
    sub:   'La meilleure façon de rester connecté à l'étranger',
    cards: [
      { icon: '🌐', title: '190+ pays couverts',         desc: 'Une couverture mondiale pour voyager partout sans contrainte.' },
      { icon: '⚡', title: 'Activation 2 minutes',       desc: 'Scannez, activez, connectez-vous. Aussi simple que ça.' },
      { icon: '🔒', title: 'Paiement Stripe sécurisé',   desc: 'Vos données bancaires sont chiffrées et protégées à chaque transaction.' },
      { icon: '💰', title: 'Prix compétitifs',           desc: 'Aucun frais cachés. Ce que vous voyez, c'est ce que vous payez.' },
    ],
  },

  download: {
    title: '📱 Téléchargez ILOTEL eSIM',
    sub:   'Disponible gratuitement sur iOS et Android. Commandez votre eSIM en quelques secondes.',
  },

  footer: {
    tagline: 'ONE ESIM · EVERYWHERE.',
    legal:   'Mentions légales',
    privacy: 'Confidentialité',
    contact: 'Contact',
    faq:     'FAQ',
    copy:    '© 2025 ILOTEL eSIM. Tous droits réservés.',
  },
};
