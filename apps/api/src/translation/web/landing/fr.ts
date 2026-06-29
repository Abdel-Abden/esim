/**
 * src/translation/web/landing/fr.ts
 * Traductions françaises de la page vitrine.
 */

const ui = {
  lang: 'fr',

  nav: {
    home:         'Accueil',
    destinations: 'Destinations',
    plans:        'Tarifs',
    how:          'Comment ça marche',
    download:     "Télécharger l'app",
  },

  hero: {
    tag:      'ONE CONNECTION · EVERYWHERE.',
    title:    'Voyagez connecté',
    subtitle: 'Restez connecté partout dans le monde avec nos cartes SIM et eSIM.',
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
    sub:       'Sélectionnez votre destination et commandez en quelques clics',
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
      {
        title: 'Choisissez votre offre',
        desc: 'Sélectionnez votre destination puis choisissez une carte SIM ou une eSIM selon votre appareil.'
      },
      {
        title: 'Commande sécuriser',
        desc: 'Payez en quelques secondes grâce à Stripe. Votre commande est traitée immédiatement.'
      },
      {
        title: 'Restez connecté',
        desc: 'Installez votre eSIM instantanément ou recevez votre carte SIM, puis profitez d’Internet dès votre arrivée.'
      }
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
    title: '🚀 Pourquoi ILOTEL ?',
    sub:   'La meilleure façon de rester connecté à l\'étranger',
    cards: [
      {
        icon:'🌍',
        title:'190+ destinations',
        desc:'Des forfaits internationaux utilisables dans plus de 190 pays.'
      },
      {
        icon:'📱',
        title:'SIM et eSIM',
        desc:'Choisissez la solution la mieux adaptée à votre smartphone ou tablette.'
      },
      {
        icon:'⚡',
        title:'Connexion rapide',
        desc:'Activez votre ligne en quelques minutes et restez connecté dès votre arrivée.'
      },
      {
        icon:'🔒',
        title:'Paiement sécurisé',
        desc:'Commandez en toute confiance grâce au paiement sécurisé par Stripe.'
      }
    ],
  },

  download: {
    title: '📱 Téléchargez ILOTEL',
    sub:   'Disponible gratuitement sur iOS et Android. Commandez votre eSIM en quelques secondes.',
  },

  footer: {
    tagline: 'ONE CONNECTION · EVERYWHERE.',
    legal:   'Mentions légales',
    privacy: 'Confidentialité',
    contact: 'Contact',
    faq:     'FAQ',
    copy:    '© 2025 ILOTEL. Tous droits réservés.',
  },
};

export { ui };
