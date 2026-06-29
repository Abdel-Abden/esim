/**
 * src/translation/web/landing/ar.ts
 * الترجمة العربية لصفحة العرض.
 */

const ui = {
  lang: 'ar',

  nav: {
    home: 'الرئيسية',
    destinations: 'الوجهات',
    plans: 'الباقات',
    how: 'كيف يعمل',
    download: 'تحميل التطبيق',
  },

  hero: {
    tag: 'اتصال واحد · في كل مكان.',
    title: 'ابقَ متصلاً أينما سافرت',
    subtitle: 'ابقَ على اتصال حول العالم مع شرائح SIM وeSIM الدولية الخاصة بنا.',
    badge1: '✓ أكثر من 190 دولة',
    badge2: '⚡ تفعيل خلال دقيقتين',
    badge3: '🔒 دفع آمن',
    storeAvailable: 'متوفر على',
    storeDownload: 'حمّل من',
  },

  featured: {
    title: '⭐ العرض الموصى به',
    sub: 'الباقة الأكثر شعبية للسفر حول العالم.',
    tag: '⭐ الأكثر اختيارًا',
    name: 'أوروبا',
    details: 'أكثر من 190 دولة · 4G/5G · جاهزة خلال دقيقتين',
    from: 'ابتداءً من',
    cta: 'عرض الباقة ←',
  },

  dest: {
    title: '🌍 الوجهات',
    sub: 'اختر وجهتك واطلب بكل سهولة.',
    filterAll: '🌐 الكل',
    europe: '🇪🇺 أوروبا',
    asia: '🌏 آسيا',
    americas: '🌎 الأمريكتان',
    africa: '🌍 أفريقيا',
    search: 'ابحث عن دولة…',
    empty: '😕 لم يتم العثور على أي وجهة',
    destinations: [
      { name: 'المغرب', emoji: '🇲🇦', price: '9.99€', region: 'africa' },
      { name: 'الجزائر', emoji: '🇩🇿', price: '11.99€', region: 'africa' },
      { name: 'تونس', emoji: '🇹🇳', price: '11.99€', region: 'africa' },
      { name: 'فرنسا', emoji: '🇫🇷', price: '7.99€', region: 'europe' },
      { name: 'إسبانيا', emoji: '🇪🇸', price: '7.99€', region: 'europe' },
      { name: 'أوروبا', emoji: '🇪🇺', price: '11.99€', region: 'europe' },
      { name: 'اليابان', emoji: '🇯🇵', price: '11.99€', region: 'asia' },
      { name: 'تايلاند', emoji: '🇹🇭', price: '8.99€', region: 'asia' },
      { name: 'سنغافورة', emoji: '🇸🇬', price: '11.99€', region: 'asia' },
      { name: 'الولايات المتحدة', emoji: '🇺🇸', price: '14.99€', region: 'americas' },
      { name: 'المكسيك', emoji: '🇲🇽', price: '9.99€', region: 'americas' },
    ],
  },

  how: {
    title: '💡 كيف يعمل',
    sub: 'سريع، بسيط، وبدون تعقيد.',
    steps: [
      {
        title: 'اختر الباقة',
        desc: 'حدد وجهتك ثم اختر شريحة SIM أو eSIM المناسبة لجهازك.',
      },
      {
        title: 'ادفع بأمان',
        desc: 'أكمل عملية الدفع بأمان عبر Stripe، وسيتم تجهيز طلبك فورًا.',
      },
      {
        title: 'ابقَ متصلاً',
        desc: 'فعّل eSIM مباشرة أو استلم شريحة SIM الخاصة بك واستمتع بالإنترنت فور وصولك.',
      },
    ],
  },

  plans: {
    title: '💳 باقاتنا',
    sub: 'اختر الباقة المناسبة لرحلتك.',
    popular: '⭐ الأكثر شعبية',
    order: 'اطلب الآن →',
    features: [
      '✅ 4G/5G',
      '✅ أكثر من 190 دولة',
      '✅ جاهزة خلال دقيقتين',
      '✅ دعم 24/7',
    ],
    cards: [
      { data: '10 جيجابايت', duration: '⏱ صالحة لمدة 15 يومًا', price: '18.99€', popular: true },
      { data: '30 جيجابايت', duration: '⏱ صالحة لمدة 30 يومًا', price: '34.99€', popular: false },
    ],
  },

  why: {
    title: '🚀 لماذا ILOTEL؟',
    sub: 'أفضل طريقة للبقاء متصلاً أثناء السفر.',
    cards: [
      {
        icon: '🌍',
        title: 'أكثر من 190 وجهة',
        desc: 'باقات دولية تغطي أكثر من 190 دولة.',
      },
      {
        icon: '📱',
        title: 'SIM و eSIM',
        desc: 'اختر الحل الأنسب لهاتفك أو جهازك اللوحي.',
      },
      {
        icon: '⚡',
        title: 'اتصال سريع',
        desc: 'فعّل خطك خلال دقائق وابقَ متصلاً منذ لحظة وصولك.',
      },
      {
        icon: '🔒',
        title: 'دفع آمن',
        desc: 'اطلب بكل ثقة مع نظام الدفع الآمن عبر Stripe.',
      },
    ],
  },

  download: {
    title: '📱 حمّل تطبيق ILOTEL',
    sub: 'متوفر مجانًا على iOS وAndroid. اطلب شريحة SIM أو eSIM في ثوانٍ.',
  },

  footer: {
    tagline: 'اتصال واحد · في كل مكان.',
    legal: 'الشروط القانونية',
    privacy: 'سياسة الخصوصية',
    contact: 'اتصل بنا',
    faq: 'الأسئلة الشائعة',
    copy: '© 2025 ILOTEL. جميع الحقوق محفوظة.',
  },
};

export { ui };
