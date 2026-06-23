/**
 * src/translation/web/landing/ar.ts
 * الترجمة العربية لصفحة العرض.
 */

const ui = {
  lang: 'ar',

  nav: {
    home:         'الرئيسية',
    destinations: 'الوجهات',
    plans:        'الأسعار',
    how:          'كيف يعمل',
    download:     'تحميل التطبيق',
  },

  hero: {
    tag:      'ONE ESIM · EVERYWHERE.',
    title:    'تنقّل وأنت متصل\nبدون شريحة فيزيائية',
    subtitle: 'اشترِ شريحتك الإلكترونية. فعّلها في دقيقتين في أكثر من 190 دولة.',
    badge1:   '✓ +190 دولة',
    badge2:   '⚡ دقيقتان',
    badge3:   '🔒 Stripe',
    storeAvailable: 'متاح على',
    storeDownload:  'تحميل من',
  },

  featured: {
    title:   '⭐ العرض المميز',
    sub:     'باقتنا الأكثر شعبية للسفر في كل مكان',
    tag:     '⭐ موصى به',
    name:    'أوروبا',
    details: '+190 دولة · 4G/5G · تفعيل في دقيقتين',
    from:    'ابتداءً من',
    cta:     '← عرض الباقة',
  },

  dest: {
    title:     '🌍 الوجهات',
    sub:       'اختر وجهتك واطلب شريحتك الإلكترونية بنقرات قليلة',
    filterAll: '🌐 الكل',
    europe:    '🇪🇺 أوروبا',
    asia:      '🌏 آسيا',
    americas:  '🌎 الأمريكتان',
    africa:    '🌍 أفريقيا',
    search:    'ابحث عن دولة…',
    empty:     '😕 لا توجد وجهات',
    destinations: [
      { name: 'المغرب',            emoji: '🇲🇦', price: '9.99€',  region: 'africa'   },
      { name: 'الجزائر',           emoji: '🇩🇿', price: '11.99€', region: 'africa'   },
      { name: 'تونس',              emoji: '🇹🇳', price: '11.99€', region: 'africa'   },
      { name: 'فرنسا',             emoji: '🇫🇷', price: '7.99€',  region: 'europe'   },
      { name: 'إسبانيا',           emoji: '🇪🇸', price: '7.99€',  region: 'europe'   },
      { name: 'أوروبا',            emoji: '🇪🇺', price: '11.99€', region: 'europe'   },
      { name: 'اليابان',           emoji: '🇯🇵', price: '11.99€', region: 'asia'     },
      { name: 'تايلاند',           emoji: '🇹🇭', price: '8.99€',  region: 'asia'     },
      { name: 'سنغافورة',          emoji: '🇸🇬', price: '11.99€', region: 'asia'     },
      { name: 'الولايات المتحدة',  emoji: '🇺🇸', price: '14.99€', region: 'americas' },
      { name: 'المكسيك',           emoji: '🇲🇽', price: '9.99€',  region: 'americas' },
    ],
  },

  how: {
    title: '💡 كيف يعمل',
    sub:   'بسيط وسريع وبدون جهد',
    steps: [
      { title: 'اختر',   desc: 'اختر وجهتك والباقة المناسبة لرحلتك.' },
      { title: 'ادفع',   desc: 'ادفع بأمان عبر Stripe. دفع مشفّر وفوري.' },
      { title: 'اتصل',   desc: 'امسح رمز QR الذي تلقّيته وفعّل شريحتك في أقل من دقيقتين.' },
    ],
  },

  plans: {
    title:   '💳 باقاتنا',
    sub:     'اختر الباقة المناسبة لرحلتك',
    popular: '⭐ الأكثر شعبية',
    order:   '← اطلب الآن',
    features: [
      '✅ 4G/5G مشمول',
      '✅ +190 دولة',
      '✅ تفعيل في دقيقتين',
      '✅ دعم 24/7',
    ],
    cards: [
      { data: '10 Go', duration: '⏱ صالحة 15 يوماً', price: '18.99€', popular: true  },
      { data: '30 Go', duration: '⏱ صالحة 30 يوماً', price: '34.99€', popular: false },
    ],
  },

  why: {
    title: '🚀 لماذا ILOTEL eSIM؟',
    sub:   'أفضل طريقة للبقاء متصلاً في الخارج',
    cards: [
      { icon: '🌐', title: '+190 دولة مغطّاة',        desc: 'تغطية عالمية للسفر في كل مكان دون قيود.' },
      { icon: '⚡', title: 'تفعيل في دقيقتين',        desc: 'امسح، فعّل، اتصل. بهذه البساطة.' },
      { icon: '🔒', title: 'دفع آمن عبر Stripe',      desc: 'بياناتك المصرفية مشفّرة ومحمية في كل معاملة.' },
      { icon: '💰', title: 'أسعار تنافسية',           desc: 'لا رسوم خفية. ما تراه هو ما تدفعه.' },
    ],
  },

  download: {
    title: '📱 حمّل تطبيق ILOTEL eSIM',
    sub:   'متاح مجاناً على iOS و Android. اطلب شريحتك في ثوانٍ.',
  },

  footer: {
    tagline: 'ONE ESIM · EVERYWHERE.',
    legal:   'الإشعارات القانونية',
    privacy: 'الخصوصية',
    contact: 'اتصل بنا',
    faq:     'الأسئلة الشائعة',
    copy:    '© 2025 ILOTEL eSIM. جميع الحقوق محفوظة.',
  },
};

export { ui };
