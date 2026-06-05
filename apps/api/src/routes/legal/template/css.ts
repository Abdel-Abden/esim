/**
 * src/routes/legal/template/css.ts
 *
 * Styles des pages légales.
 * Les tokens par langue permettent d'adapter la typographie sans dupliquer le HTML.
 * Le bloc RTL est injecté conditionnellement pour l'arabe.
 *
 * Tokens couleur préfixés --color-* : à remplacer par packages/shared/theme.ts plus tard.
 */

export interface LangTokens {
  fontSize:   string;
  lineHeight: string;
  wordBreak:  string;
  hyphens:    string;
  /** Police de secours spécifique à la langue (optionnel) */
  fontStack?: string;
}

const LANG_TOKENS: Record<string, LangTokens> = {
  fr: {
    fontSize:   '14px',
    lineHeight: '1.65',
    wordBreak:  'normal',
    hyphens:    'none',
  },
  en: {
    fontSize:   '14px',
    lineHeight: '1.65',
    wordBreak:  'normal',
    hyphens:    'none',
  },
  de: {
    // Mots composés longs → césure automatique + taille réduite
    fontSize:   '13px',
    lineHeight: '1.6',
    wordBreak:  'break-word',
    hyphens:    'auto',
  },
  ar: {
    // Glyphes arabes plus denses → taille légèrement supérieure
    fontSize:   '15px',
    lineHeight: '1.8',
    wordBreak:  'normal',
    hyphens:    'none',
    fontStack:  "'Geeza Pro', 'Arabic UI Text', 'Noto Sans Arabic', sans-serif",
  },
};

const DEFAULT_TOKENS: LangTokens = LANG_TOKENS.fr;

export function getTokens(lang: string): LangTokens {
  return LANG_TOKENS[lang] ?? DEFAULT_TOKENS;
}

/** Bloc CSS additionnel pour les langues RTL */
function rtlCss(): string {
  return `
    /* ── RTL ─────────────────────────────────────────────────── */
    body  { text-align: right; }
    h2    { text-align: right; }
    .muted, .box, footer { text-align: right; }

    ul, ol {
      padding-right: 20px;
      padding-left:  0;
    }

    th, td { text-align: right; }

    /* Formulaire */
    label { text-align: right; }
  `;
}

export function buildCss(lang: string): string {
  const t = getTokens(lang);
  const isRtl = lang === 'ar';
  const fontStack = t.fontStack
    ? `${t.fontStack}, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif`
    : "-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif";

  return `
    /* ── Variables ───────────────────────────────────────────── */
    :root {
      --font-size-body:   ${t.fontSize};
      --line-height-body: ${t.lineHeight};
      --word-break:       ${t.wordBreak};
      --hyphens:          ${t.hyphens};

      /* Tokens couleur — à remplacer par packages/shared/theme.ts */
      --color-bg:         #FDF8F3;
      --color-text:       #2A1508;
      --color-primary:    #E8622A;
      --color-primary-lt: #F07A44;
      --color-border:     #F0D9C8;
      --color-surface:    #FFF3EA;
      --color-muted:      #9A7A68;
      --color-success-bg: #E0F5F2;
      --color-success-bd: #1A8A7A;
      --color-success-tx: #0E6B5E;
      --color-error-bd:   #DC2626;
      --color-error-tx:   #991B1B;
    }

    /* ── Reset ───────────────────────────────────────────────── */
    *, *::before, *::after { box-sizing: border-box; }

    /* ── Base ────────────────────────────────────────────────── */
    body {
      margin: 0;
      padding: 0;
      background: var(--color-bg);
      font-family: ${fontStack};
      font-size: var(--font-size-body);
      color: var(--color-text);
      line-height: var(--line-height-body);
      word-break: var(--word-break);
      hyphens: var(--hyphens);
    }

    /* ── Layout ──────────────────────────────────────────────── */
    .wrap {
      max-width: 680px;
      margin: 0 auto;
      padding: 32px 20px 64px;
    }

    /* ── Header ──────────────────────────────────────────────── */
    header {
      background: linear-gradient(135deg, var(--color-primary), var(--color-primary-lt));
      padding: 20px 24px;
      border-radius: 16px;
      margin-bottom: 32px;
    }
    header p {
      margin: 0;
      font-size: 11px;
      font-weight: 700;
      color: rgba(255,255,255,0.75);
      letter-spacing: 2px;
      text-transform: uppercase;
    }
    header h1 {
      margin: 6px 0 0;
      font-size: 22px;
      font-weight: 700;
      color: #fff;
    }

    /* ── Typographie ─────────────────────────────────────────── */
    h2 {
      font-size: 16px;
      font-weight: 700;
      color: var(--color-primary);
      margin: 28px 0 6px;
      border-bottom: 1px solid var(--color-border);
      padding-bottom: 6px;
    }
    p  { margin: 0 0 12px; }
    ul, ol { margin: 0 0 12px; padding-left: 20px; }
    li { margin-bottom: 4px; }
    a  { color: var(--color-primary); }
    .muted { color: var(--color-muted); font-size: 12px; }

    /* ── Composants ──────────────────────────────────────────── */
    .box {
      background: var(--color-surface);
      border: 1px solid var(--color-border);
      border-radius: 10px;
      padding: 14px 16px;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 16px;
      font-size: calc(var(--font-size-body) - 1px);
    }
    th {
      background: #F5E0CC;
      padding: 8px 10px;
      text-align: left;
      font-weight: 700;
      font-size: 12px;
    }
    td {
      padding: 8px 10px;
      border-bottom: 1px solid var(--color-border);
      vertical-align: top;
    }

    /* ── Footer ──────────────────────────────────────────────── */
    footer {
      margin-top: 40px;
      padding-top: 16px;
      border-top: 1px solid var(--color-border);
      font-size: 12px;
      color: var(--color-muted);
      text-align: center;
    }

    /* ── Formulaire ──────────────────────────────────────────── */
    label {
      display: block;
      font-size: 13px;
      font-weight: 600;
      margin-bottom: 4px;
    }
    input, textarea {
      width: 100%;
      padding: 10px 12px;
      border: 1.5px solid var(--color-border);
      border-radius: 8px;
      font-size: var(--font-size-body);
      background: #fff;
      color: var(--color-text);
      margin-bottom: 16px;
      font-family: inherit;
    }
    textarea { min-height: 100px; resize: vertical; }
    button {
      background: linear-gradient(135deg, var(--color-primary), var(--color-primary-lt));
      color: #fff;
      border: none;
      border-radius: 10px;
      padding: 13px 28px;
      font-size: 15px;
      font-weight: 700;
      cursor: pointer;
      width: 100%;
    }

    /* ── Alertes ─────────────────────────────────────────────── */
    .success {
      background: var(--color-success-bg);
      border: 1px solid var(--color-success-bd);
      border-radius: 10px;
      padding: 16px;
      color: var(--color-success-tx);
      font-weight: 600;
    }
    .errors {
      background: var(--color-surface);
      border: 1px solid var(--color-error-bd);
      border-radius: 10px;
      padding: 14px 16px;
      margin-bottom: 20px;
      color: var(--color-error-tx);
    }

    ${isRtl ? rtlCss() : ''}
  `;
}
