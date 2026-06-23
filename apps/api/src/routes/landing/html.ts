/**
 * src/routes/landing/html.ts
 *
 * Génère le HTML de la page vitrine à partir des traductions.
 * Même pattern que routes/legal/html.ts — RTL automatique pour l'arabe.
 */

import { Colors, RTL_LANGS } from '@ilotel/shared';
import { BRAND } from '../../constants/env.js';

export function buildLandingPage(ui: any): string {
  const lang = ui.lang as string;
  const dir  = RTL_LANGS.has(lang) ? 'rtl' : 'ltr';
  const isRtl = dir === 'rtl';

  const dests = ui.dest.destinations as { name: string; emoji: string; price: string; region: string }[];
  const destsJson = JSON.stringify(dests);

  return `<!DOCTYPE html>
<html lang="${lang}" dir="${dir}">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${BRAND.appName} — ${ui.hero.tag}</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet" />
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --orange:  ${Colors.primary};
      --beige:   ${Colors.sand};
      --text:    ${Colors.text};
      --white:   #FFFFFF;
      --gray:    #F5F5F5;
      --border:  ${Colors.border};
      --muted:   ${Colors.muted};
      --surface: ${Colors.surface};
    }

    html { scroll-behavior: smooth; }

    body {
      font-family: ${isRtl ? "'Geeza Pro','Arabic UI Text','Noto Sans Arabic',sans-serif" : "'Inter',sans-serif"};
      color: var(--text);
      background: var(--white);
      overflow-x: hidden;
    }

    h1, h2, h3, h4 { font-family: 'Poppins', sans-serif; }

    /* ── Lang switcher ── */
    .lang-switcher { display: flex; gap: 0.4rem; align-items: center; }

    .lang-btn {
      background: rgba(255,255,255,0.2);
      color: var(--white);
      border: 1px solid rgba(255,255,255,0.4);
      padding: 0.25rem 0.6rem;
      border-radius: 6px;
      font-size: 0.78rem;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.2s;
    }

    .lang-btn:hover, .lang-btn.active {
      background: var(--white);
      color: var(--orange);
      border-color: var(--white);
    }

    #header.scrolled .lang-btn {
      background: var(--gray);
      color: var(--text);
      border-color: var(--border);
    }

    #header.scrolled .lang-btn:hover,
    #header.scrolled .lang-btn.active {
      background: var(--orange);
      color: var(--white);
      border-color: var(--orange);
    }

    /* ── Header ── */
    #header {
      position: fixed; top: 0; left: 0; right: 0; z-index: 1000;
      padding: 0 5%; height: 68px;
      display: flex; align-items: center; justify-content: space-between;
      background: transparent;
      transition: background 0.35s ease, box-shadow 0.35s ease;
    }

    #header.scrolled { background: var(--white); box-shadow: 0 2px 16px rgba(0,0,0,0.08); }

    .logo {
      font-family: 'Poppins', sans-serif;
      font-weight: 800; font-size: 1.5rem;
      color: var(--orange); letter-spacing: -0.5px; text-decoration: none;
    }

    .logo span { color: var(--white); transition: color 0.35s; }
    #header.scrolled .logo span { color: var(--orange); }

    .header-right { display: flex; align-items: center; gap: 2rem; }

    nav { display: flex; align-items: center; gap: 2rem; }

    nav a {
      font-weight: 500; font-size: 0.9rem;
      color: var(--white); text-decoration: none;
      transition: color 0.2s, opacity 0.2s; opacity: 0.9;
    }

    nav a:hover { opacity: 1; color: var(--orange); }
    #header.scrolled nav a { color: var(--text); }
    #header.scrolled nav a:hover { color: var(--orange); }

    .btn-header {
      background: var(--orange) !important; color: var(--white) !important;
      padding: 0.5rem 1.2rem; border-radius: 8px;
      font-weight: 600 !important; opacity: 1 !important;
      transition: background 0.2s, transform 0.15s !important;
    }

    .btn-header:hover { background: #b8521a !important; transform: translateY(-1px); }

    .burger { display: none; flex-direction: column; gap: 5px; cursor: pointer; padding: 4px; }
    .burger span { display: block; width: 24px; height: 2px; background: var(--white); border-radius: 2px; transition: background 0.35s; }
    #header.scrolled .burger span { background: var(--text); }

    .mobile-nav {
      display: none; position: fixed;
      top: 68px; left: 0; right: 0;
      background: var(--white); padding: 1.5rem 5%;
      flex-direction: column; gap: 1.2rem;
      box-shadow: 0 8px 24px rgba(0,0,0,0.1); z-index: 999;
    }

    .mobile-nav.open { display: flex; }
    .mobile-nav a { font-weight: 500; color: var(--text); text-decoration: none; font-size: 1rem; }
    .mobile-nav .lang-btn { background: var(--gray); color: var(--text); border-color: var(--border); }
    .mobile-lang { display: flex; gap: 0.5rem; }

    /* ── Hero ── */
    #hero {
      position: relative; min-height: 100vh;
      background: linear-gradient(135deg, ${Colors.primary} 0%, ${Colors.primaryMid} 50%, #C04A10 100%);
      display: flex; align-items: center; justify-content: center;
      text-align: center; padding: 100px 5% 120px; overflow: hidden;
    }

    .hero-content { max-width: 700px; position: relative; z-index: 1; }

    .hero-tag {
      display: inline-block; background: rgba(255,255,255,0.2);
      color: var(--white); font-size: 0.8rem; font-weight: 600;
      letter-spacing: 1.5px; text-transform: uppercase;
      padding: 0.35rem 1rem; border-radius: 100px; margin-bottom: 1.5rem;
    }

    #hero h1 { font-size: clamp(2rem, 5vw, 3.2rem); color: var(--white); font-weight: 800; line-height: 1.15; margin-bottom: 1rem; }
    #hero p.subtitle { font-style: italic; color: rgba(255,255,255,0.9); font-size: clamp(1rem, 2.5vw, 1.2rem); margin-bottom: 2rem; }

    .badges { display: flex; flex-wrap: wrap; gap: 0.75rem; justify-content: center; margin-bottom: 2.5rem; }

    .badge {
      background: rgba(255,255,255,0.2); backdrop-filter: blur(6px);
      color: var(--white); padding: 0.4rem 1rem;
      border-radius: 100px; font-size: 0.85rem; font-weight: 600;
    }

    .store-buttons { display: flex; flex-wrap: wrap; gap: 1rem; justify-content: center; }

    .btn-store {
      display: flex; align-items: center; gap: 0.6rem;
      background: var(--white); color: var(--text);
      padding: 0.75rem 1.5rem; border-radius: 12px;
      text-decoration: none; font-family: 'Poppins', sans-serif;
      font-weight: 600; font-size: 0.95rem;
      transition: transform 0.2s, box-shadow 0.2s;
      box-shadow: 0 4px 16px rgba(0,0,0,0.15);
    }

    .btn-store:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(0,0,0,0.2); }
    .btn-store .icon { font-size: 1.4rem; }

    .wave { position: absolute; bottom: -2px; left: 0; width: 100%; overflow: hidden; line-height: 0; }
    .wave svg { display: block; width: 100%; }

    /* ── Sections ── */
    section { padding: 5rem 5%; }
    .section-title { font-size: clamp(1.6rem, 3.5vw, 2.2rem); font-weight: 700; text-align: center; margin-bottom: 0.5rem; }
    .section-sub { text-align: center; color: var(--muted); font-size: 1rem; margin-bottom: 3rem; }

    /* ── Featured ── */
    #offre { background: var(--beige); padding: 4rem 5%; }
    .offre-inner { max-width: 480px; margin: 0 auto; }

    .offre-card {
      background: var(--white); border-radius: 20px;
      padding: 2rem 2.5rem;
      display: flex; align-items: center; justify-content: space-between;
      flex-wrap: wrap; gap: 1.5rem;
      box-shadow: 0 8px 32px rgba(212,98,26,0.12);
      border: 2px solid rgba(212,98,26,0.1);
    }

    .offre-left { flex: 1; min-width: 180px; }
    .offre-star { font-size: 0.85rem; color: var(--orange); font-weight: 600; margin-bottom: 0.4rem; }
    .offre-title { font-family: 'Poppins', sans-serif; font-weight: 700; font-size: 1.3rem; margin-bottom: 0.3rem; }
    .offre-details { color: var(--muted); font-size: 0.9rem; }
    .offre-right { text-align: ${isRtl ? 'left' : 'right'}; }
    .offre-price { font-family: 'Poppins', sans-serif; font-size: 1.8rem; font-weight: 800; color: var(--orange); margin-bottom: 0.8rem; }
    .offre-price small { font-size: 1rem; font-weight: 600; }

    .btn-orange {
      display: inline-block; background: var(--orange); color: var(--white);
      padding: 0.6rem 1.4rem; border-radius: 10px; text-decoration: none;
      font-family: 'Poppins', sans-serif; font-weight: 600; font-size: 0.95rem;
      transition: background 0.2s, transform 0.15s; cursor: pointer; border: none;
    }

    .btn-orange:hover { background: #b8521a; transform: translateY(-1px); }

    /* ── Destinations ── */
    #destinations { background: var(--white); }

    .dest-controls { display: flex; flex-wrap: wrap; gap: 0.6rem; justify-content: center; margin-bottom: 1.5rem; }

    .filter-btn {
      background: var(--gray); border: 2px solid var(--border);
      color: var(--text); padding: 0.5rem 1.1rem;
      border-radius: 100px; font-size: 0.85rem; font-weight: 500;
      cursor: pointer; transition: all 0.2s;
    }

    .filter-btn:hover, .filter-btn.active {
      background: var(--orange); border-color: var(--orange); color: var(--white);
    }

    .search-wrap { max-width: 360px; margin: 0 auto 2.5rem; position: relative; }

    .search-wrap .search-icon {
      position: absolute;
      ${isRtl ? 'right: 1rem' : 'left: 1rem'};
      top: 50%; transform: translateY(-50%);
      font-size: 1rem; pointer-events: none;
    }

    #search-input {
      width: 100%;
      padding: ${isRtl ? '0.75rem 2.8rem 0.75rem 1rem' : '0.75rem 1rem 0.75rem 2.8rem'};
      border: 2px solid var(--border); border-radius: 100px;
      font-size: 0.9rem; outline: none; transition: border-color 0.2s;
    }

    #search-input:focus { border-color: var(--orange); }

    .dest-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 1rem; max-width: 640px; margin: 0 auto; }

    .dest-card {
      background: var(--white); border: 2px solid var(--border);
      border-radius: 14px; padding: 1.2rem 1.4rem;
      display: flex; justify-content: space-between; align-items: center;
      transition: border-color 0.2s, box-shadow 0.2s, transform 0.2s; cursor: pointer;
    }

    .dest-card:hover { border-color: var(--orange); box-shadow: 0 4px 16px rgba(212,98,26,0.1); transform: translateY(-2px); }
    .dest-name { font-family: 'Poppins', sans-serif; font-weight: 600; font-size: 0.95rem; display: flex; align-items: center; gap: 0.4rem; }
    .dest-price { font-family: 'Poppins', sans-serif; font-weight: 700; color: var(--orange); font-size: 1rem; }
    .dest-no-result { text-align: center; color: var(--muted); grid-column: 1/-1; padding: 2rem 0; font-size: 0.95rem; }

    /* ── How ── */
    #how { background: var(--beige); }
    .steps { display: flex; flex-wrap: wrap; gap: 2rem; justify-content: center; max-width: 900px; margin: 0 auto; }
    .step { flex: 1; min-width: 220px; max-width: 260px; text-align: center; }
    .step-num {
      width: 60px; height: 60px; background: var(--orange); border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
      font-family: 'Poppins', sans-serif; font-weight: 800; font-size: 1.4rem;
      color: var(--white); margin: 0 auto 1rem;
    }
    .step h3 { font-size: 1.05rem; font-weight: 700; margin-bottom: 0.5rem; }
    .step p { color: #555; font-size: 0.9rem; line-height: 1.6; }
    .step-arrow { display: flex; align-items: center; font-size: 1.5rem; color: var(--orange); padding-top: 30px; ${isRtl ? 'transform: scaleX(-1);' : ''} }

    /* ── Plans ── */
    #forfaits { background: var(--white); }
    .forfaits-grid { display: flex; flex-wrap: wrap; gap: 1.5rem; justify-content: center; max-width: 640px; margin: 0 auto; }

    .forfait-card {
      flex: 1; min-width: 240px; max-width: 280px;
      background: var(--white); border: 2px solid var(--border);
      border-radius: 20px; padding: 2rem 1.8rem;
      text-align: center; position: relative;
      transition: transform 0.2s, box-shadow 0.2s;
    }

    .forfait-card:hover { transform: translateY(-4px); box-shadow: 0 12px 40px rgba(212,98,26,0.12); }
    .forfait-card.popular { border-color: var(--orange); }

    .popular-badge {
      position: absolute; top: -14px; left: 50%; transform: translateX(-50%);
      background: var(--orange); color: var(--white);
      font-size: 0.75rem; font-weight: 700; letter-spacing: 1px; text-transform: uppercase;
      padding: 0.3rem 1rem; border-radius: 100px; white-space: nowrap;
    }

    .forfait-data { font-family: 'Poppins', sans-serif; font-size: 2rem; font-weight: 800; color: var(--orange); }
    .forfait-duration { color: var(--muted); font-size: 0.9rem; margin: 0.3rem 0 1rem; }
    .forfait-price { font-family: 'Poppins', sans-serif; font-size: 2rem; font-weight: 800; margin-bottom: 1.5rem; }
    .forfait-features { list-style: none; margin-bottom: 2rem; display: flex; flex-direction: column; gap: 0.5rem; }
    .forfait-features li { color: #555; font-size: 0.88rem; display: flex; align-items: center; gap: 0.5rem; justify-content: center; }

    /* ── Why ── */
    #avantages { background: var(--beige); }
    .avantages-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.5rem; max-width: 700px; margin: 0 auto; }
    .avantage-card {
      background: var(--white); border-radius: 16px; padding: 1.8rem; text-align: center;
      box-shadow: 0 2px 12px rgba(0,0,0,0.04); transition: transform 0.2s, box-shadow 0.2s;
    }
    .avantage-card:hover { transform: translateY(-3px); box-shadow: 0 8px 24px rgba(212,98,26,0.08); }
    .avantage-icon { font-size: 2.2rem; margin-bottom: 0.8rem; }
    .avantage-card h3 { font-size: 1rem; font-weight: 700; margin-bottom: 0.4rem; }
    .avantage-card p { color: var(--muted); font-size: 0.85rem; line-height: 1.5; }

    /* ── Download ── */
    #download {
      background: linear-gradient(135deg, ${Colors.primary} 0%, ${Colors.primaryMid} 100%);
      text-align: center; padding: 5rem 5%;
    }
    #download h2 { color: var(--white); font-size: clamp(1.6rem, 4vw, 2.4rem); margin-bottom: 0.8rem; }
    #download p { color: rgba(255,255,255,0.85); font-size: 1rem; margin-bottom: 2.5rem; }

    /* ── Footer ── */
    footer { background: #1A1A1A; color: rgba(255,255,255,0.7); padding: 3rem 5%; }
    .footer-inner {
      max-width: 900px; margin: 0 auto;
      display: flex; flex-wrap: wrap; gap: 2rem;
      justify-content: space-between; align-items: flex-start; margin-bottom: 2rem;
    }
    .footer-brand .logo { color: var(--orange); }
    .footer-brand .logo span { color: var(--white); }
    .footer-brand p { margin-top: 0.5rem; font-size: 0.85rem; color: rgba(255,255,255,0.5); font-style: italic; }
    .footer-links { display: flex; flex-wrap: wrap; gap: 1.5rem; }
    .footer-links a { color: rgba(255,255,255,0.6); text-decoration: none; font-size: 0.88rem; transition: color 0.2s; }
    .footer-links a:hover { color: var(--orange); }
    .footer-copy { text-align: center; border-top: 1px solid rgba(255,255,255,0.08); padding-top: 1.5rem; font-size: 0.82rem; color: rgba(255,255,255,0.35); }

    /* ── Fade-in ── */
    .fade-in { opacity: 0; transform: translateY(30px); transition: opacity 0.6s ease, transform 0.6s ease; }
    .fade-in.visible { opacity: 1; transform: translateY(0); }

    /* ── Scroll top ── */
    .scroll-top {
      position: fixed; bottom: 2rem; ${isRtl ? 'left: 2rem' : 'right: 2rem'};
      background: var(--orange); color: var(--white);
      width: 44px; height: 44px; border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
      font-size: 1.2rem; cursor: pointer; border: none;
      box-shadow: 0 4px 16px rgba(212,98,26,0.35);
      opacity: 0; transform: translateY(20px);
      transition: opacity 0.3s, transform 0.3s; z-index: 998;
    }
    .scroll-top.show { opacity: 1; transform: translateY(0); }
    .scroll-top:hover { background: #b8521a; }

    @media (max-width: 768px) {
      nav { display: none; }
      .burger { display: flex; }
      .step-arrow { display: none; }
      .avantages-grid, .dest-grid { grid-template-columns: 1fr 1fr; }
      .offre-card { flex-direction: column; align-items: flex-start; }
      .offre-right { text-align: ${isRtl ? 'right' : 'left'}; }
    }

    @media (max-width: 420px) {
      .dest-grid, .avantages-grid { grid-template-columns: 1fr; }
      .forfaits-grid { flex-direction: column; align-items: center; }
    }
  </style>
</head>
<body>

  <header id="header">
    <a href="#" class="logo">ILOTEL<span> eSIM</span></a>
    <div class="header-right">
      <nav>
        <a href="#hero">${ui.nav.home}</a>
        <a href="#destinations">${ui.nav.destinations}</a>
        <a href="#forfaits">${ui.nav.plans}</a>
        <a href="#how">${ui.nav.how}</a>
        <a href="#download" class="btn-header">${ui.nav.download}</a>
      </nav>
      <div class="lang-switcher">
        <button class="lang-btn ${lang === 'fr' ? 'active' : ''}" onclick="switchLang('fr')">FR</button>
        <button class="lang-btn ${lang === 'ar' ? 'active' : ''}" onclick="switchLang('ar')">ع</button>
        <button class="lang-btn ${lang === 'en' ? 'active' : ''}" onclick="switchLang('en')">EN</button>
      </div>
    </div>
    <div class="burger" id="burger"><span></span><span></span><span></span></div>
  </header>

  <div class="mobile-nav" id="mobile-nav">
    <a href="#hero"         class="mobile-link">${ui.nav.home}</a>
    <a href="#destinations" class="mobile-link">${ui.nav.destinations}</a>
    <a href="#forfaits"     class="mobile-link">${ui.nav.plans}</a>
    <a href="#how"          class="mobile-link">${ui.nav.how}</a>
    <a href="#download"     class="btn-header mobile-link">${ui.nav.download}</a>
    <div class="mobile-lang">
      <button class="lang-btn ${lang === 'fr' ? 'active' : ''}" onclick="switchLang('fr')">FR</button>
      <button class="lang-btn ${lang === 'ar' ? 'active' : ''}" onclick="switchLang('ar')">ع</button>
      <button class="lang-btn ${lang === 'en' ? 'active' : ''}" onclick="switchLang('en')">EN</button>
    </div>
  </div>

  <section id="hero">
    <div class="hero-content fade-in">
      <span class="hero-tag">${ui.hero.tag}</span>
      <h1>${ui.hero.title.replace(/\n/g, '<br>')}</h1>
      <p class="subtitle">${ui.hero.subtitle}</p>
      <div class="badges">
        <span class="badge">${ui.hero.badge1}</span>
        <span class="badge">${ui.hero.badge2}</span>
        <span class="badge">${ui.hero.badge3}</span>
      </div>
      <div class="store-buttons">
        <a href="#download" class="btn-store">
          <span class="icon">🍎</span>
          <div><div style="font-size:0.7rem;font-weight:400;opacity:0.7">${ui.hero.storeAvailable}</div>App Store</div>
        </a>
        <a href="#download" class="btn-store">
          <span class="icon">▶️</span>
          <div><div style="font-size:0.7rem;font-weight:400;opacity:0.7">${ui.hero.storeAvailable}</div>Google Play</div>
        </a>
      </div>
    </div>
    <div class="wave">
      <svg viewBox="0 0 1440 80" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">
        <path d="M0,40 C360,80 1080,0 1440,40 L1440,80 L0,80 Z" fill="#FFFFFF"/>
      </svg>
    </div>
  </section>

  <section id="offre">
    <h2 class="section-title fade-in">${ui.featured.title}</h2>
    <p class="section-sub fade-in">${ui.featured.sub}</p>
    <div class="offre-inner">
      <div class="offre-card fade-in">
        <div class="offre-left">
          <div class="offre-star">${ui.featured.tag}</div>
          <div class="offre-title">🌎 ${ui.featured.name}</div>
          <div class="offre-details">${ui.featured.details}</div>
        </div>
        <div class="offre-right">
          <div class="offre-price">${ui.featured.from} <small>18.99€</small></div>
          <a href="#forfaits" class="btn-orange">${ui.featured.cta}</a>
        </div>
      </div>
    </div>
  </section>

  <section id="destinations">
    <h2 class="section-title fade-in">${ui.dest.title}</h2>
    <p class="section-sub fade-in">${ui.dest.sub}</p>
    <div class="dest-controls fade-in">
      <button class="filter-btn active" data-filter="all">${ui.dest.filterAll}</button>
      <button class="filter-btn" data-filter="europe">${ui.dest.europe}</button>
      <button class="filter-btn" data-filter="asia">${ui.dest.asia}</button>
      <button class="filter-btn" data-filter="americas">${ui.dest.americas}</button>
      <button class="filter-btn" data-filter="africa">${ui.dest.africa}</button>
    </div>
    <div class="search-wrap fade-in">
      <span class="search-icon">🔍</span>
      <input type="text" id="search-input" autocomplete="off" placeholder="${ui.dest.search}" />
    </div>
    <div class="dest-grid" id="dest-grid"></div>
  </section>

  <section id="how">
    <h2 class="section-title fade-in">${ui.how.title}</h2>
    <p class="section-sub fade-in">${ui.how.sub}</p>
    <div class="steps">
      ${ui.how.steps.map((s: any, i: number) => `
        ${i > 0 ? '<div class="step-arrow fade-in">→</div>' : ''}
        <div class="step fade-in">
          <div class="step-num">${i + 1}</div>
          <h3>${s.title}</h3>
          <p>${s.desc}</p>
        </div>
      `).join('')}
    </div>
  </section>

  <section id="forfaits">
    <h2 class="section-title fade-in">${ui.plans.title}</h2>
    <p class="section-sub fade-in">${ui.plans.sub}</p>
    <div class="forfaits-grid">
      ${ui.plans.cards.map((card: any) => `
        <div class="forfait-card${card.popular ? ' popular' : ''} fade-in">
          ${card.popular ? `<div class="popular-badge">${ui.plans.popular}</div>` : ''}
          <div class="forfait-data">${card.data}</div>
          <div class="forfait-duration">${card.duration}</div>
          <div class="forfait-price">${card.price}</div>
          <ul class="forfait-features">
            ${ui.plans.features.map((f: string) => `<li>${f}</li>`).join('')}
          </ul>
          <a href="#download" class="btn-orange" style="width:100%;text-align:center${!card.popular ? ';background:#555' : ''}">${ui.plans.order}</a>
        </div>
      `).join('')}
    </div>
  </section>

  <section id="avantages">
    <h2 class="section-title fade-in">${ui.why.title}</h2>
    <p class="section-sub fade-in">${ui.why.sub}</p>
    <div class="avantages-grid">
      ${ui.why.cards.map((c: any) => `
        <div class="avantage-card fade-in">
          <div class="avantage-icon">${c.icon}</div>
          <h3>${c.title}</h3>
          <p>${c.desc}</p>
        </div>
      `).join('')}
    </div>
  </section>

  <section id="download">
    <h2 class="fade-in">${ui.download.title}</h2>
    <p class="fade-in">${ui.download.sub}</p>
    <div class="store-buttons fade-in">
      <a href="#" class="btn-store">
        <span class="icon">🍎</span>
        <div><div style="font-size:0.7rem;font-weight:400;opacity:0.7">${ui.hero.storeDownload}</div>App Store</div>
      </a>
      <a href="#" class="btn-store">
        <span class="icon">▶️</span>
        <div><div style="font-size:0.7rem;font-weight:400;opacity:0.7">${ui.hero.storeDownload}</div>Google Play</div>
      </a>
    </div>
  </section>

  <footer>
    <div class="footer-inner">
      <div class="footer-brand">
        <a href="#" class="logo">ILOTEL<span> eSIM</span></a>
        <p>${ui.footer.tagline}</p>
      </div>
      <div class="footer-links">
        <a href="/legal/mentions">${ui.footer.legal}</a>
        <a href="/legal/privacy">${ui.footer.privacy}</a>
        <a href="mailto:${BRAND.support}">${ui.footer.contact}</a>
        <a href="#">${ui.footer.faq}</a>
      </div>
    </div>
    <div class="footer-copy">${ui.footer.copy}</div>
  </footer>

  <button class="scroll-top" id="scroll-top">↑</button>

  <script>
    // Changement de langue → recharge avec ?lang=xx
    function switchLang(lang) {
      const url = new URL(window.location.href);
      url.searchParams.set('lang', lang);
      window.location.href = url.toString();
    }

    // Destinations
    const ALL_DESTS = ${destsJson};
    let activeFilter = 'all';
    let searchQuery  = '';
    const emptyMsg   = ${JSON.stringify(ui.dest.empty)};
    const grid       = document.getElementById('dest-grid');

    function render() {
      let data = ALL_DESTS;
      if (activeFilter !== 'all') data = data.filter(d => d.region === activeFilter);
      if (searchQuery.trim()) {
        const q = searchQuery.trim().toLowerCase();
        data = data.filter(d => d.name.toLowerCase().includes(q));
      }
      grid.innerHTML = '';
      if (!data.length) {
        grid.innerHTML = '<p class="dest-no-result">' + emptyMsg + '</p>';
        return;
      }
      data.forEach(d => {
        const c = document.createElement('div');
        c.className = 'dest-card';
        c.innerHTML = '<span class="dest-name">' + d.emoji + ' ' + d.name + '</span><span class="dest-price">' + d.price + '</span>';
        grid.appendChild(c);
      });
    }

    document.querySelectorAll('.filter-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        activeFilter = btn.dataset.filter;
        render();
      });
    });

    document.getElementById('search-input').addEventListener('input', function() {
      searchQuery = this.value;
      render();
    });

    render();

    // Header scroll
    const header = document.getElementById('header');
    const scrollBtn = document.getElementById('scroll-top');
    window.addEventListener('scroll', () => {
      header.classList.toggle('scrolled', window.scrollY > 60);
      scrollBtn.classList.toggle('show', window.scrollY > 400);
    }, { passive: true });
    scrollBtn.addEventListener('click', () => window.scrollTo({ top: 0, behavior: 'smooth' }));

    // Burger
    const burger = document.getElementById('burger');
    const mobileNav = document.getElementById('mobile-nav');
    burger.addEventListener('click', () => mobileNav.classList.toggle('open'));
    document.querySelectorAll('.mobile-link').forEach(l => l.addEventListener('click', () => mobileNav.classList.remove('open')));

    // Fade-in
    const obs = new IntersectionObserver(entries => {
      entries.forEach(e => { if (e.isIntersecting) { e.target.classList.add('visible'); obs.unobserve(e.target); } });
    }, { threshold: 0.15 });
    document.querySelectorAll('.fade-in').forEach(el => obs.observe(el));
  </script>
</body>
</html>`;
}
