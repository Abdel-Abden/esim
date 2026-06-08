/**
 * src/translation/template/web/legal/css.ts
 *
 * Styles des pages légales web.
 * Utilise Colors depuis @ilotel/shared — source unique de vérité pour le thème.
 * Tokens typographiques par langue pour gérer les spécificités (DE, AR).
 */

import { Colors, DEFAULT_LANG } from '@ilotel/shared';

export interface LangTokens {
  fontSize:   string;
  lineHeight: string;
  wordBreak:  string;
  hyphens:    string;
  fontStack?: string;
}

const LANG_TOKENS: Record<string, LangTokens> = {
  fr: { fontSize: '14px', lineHeight: '1.65', wordBreak: 'normal',     hyphens: 'none' },
  en: { fontSize: '14px', lineHeight: '1.65', wordBreak: 'normal',     hyphens: 'none' },
  de: { fontSize: '13px', lineHeight: '1.6',  wordBreak: 'break-word', hyphens: 'auto' },
  ar: {
    fontSize:   '15px',
    lineHeight: '1.8',
    wordBreak:  'normal',
    hyphens:    'none',
    fontStack:  "'Geeza Pro', 'Arabic UI Text', 'Noto Sans Arabic', sans-serif",
  },
};

export function getTokens(lang: string): LangTokens {
  return LANG_TOKENS[lang] ?? LANG_TOKENS[DEFAULT_LANG];
}

function rtlCss(): string {
  return `
    body, h2, .muted, .box, footer { text-align: right; }
    ul, ol { padding-right: 20px; padding-left: 0; }
    th, td, label { text-align: right; }
  `;
}

export function buildCss(lang: string): string {
  const t = getTokens(lang);
  const isRtl = lang === 'ar';
  const fontStack = t.fontStack
    ? `${t.fontStack}, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif`
    : "-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif";

  return `
    :root {
      --font-size-body:   ${t.fontSize};
      --line-height-body: ${t.lineHeight};
      --word-break:       ${t.wordBreak};
      --hyphens:          ${t.hyphens};
    }
    *, *::before, *::after { box-sizing: border-box; }
    body {
      margin: 0; padding: 0;
      background: ${Colors.bg};
      font-family: ${fontStack};
      font-size: var(--font-size-body);
      color: ${Colors.text};
      line-height: var(--line-height-body);
      word-break: var(--word-break);
      hyphens: var(--hyphens);
    }
    .wrap { max-width: 680px; margin: 0 auto; padding: 32px 20px 64px; }
    header {
      background: linear-gradient(135deg, ${Colors.primary}, ${Colors.primaryMid});
      padding: 20px 24px; border-radius: 16px; margin-bottom: 32px;
    }
    header p {
      margin: 0; font-size: 11px; font-weight: 700;
      color: rgba(255,255,255,0.75); letter-spacing: 2px; text-transform: uppercase;
    }
    header h1 { margin: 6px 0 0; font-size: 22px; font-weight: 700; color: #fff; }
    h2 {
      font-size: 16px; font-weight: 700; color: ${Colors.primary};
      margin: 28px 0 6px; border-bottom: 1px solid ${Colors.border}; padding-bottom: 6px;
    }
    p  { margin: 0 0 12px; }
    ul, ol { margin: 0 0 12px; padding-left: 20px; }
    li { margin-bottom: 4px; }
    a  { color: ${Colors.primary}; }
    .muted { color: ${Colors.muted}; font-size: 12px; }
    .box {
      background: ${Colors.surface}; border: 1px solid ${Colors.border};
      border-radius: 10px; padding: 14px 16px; margin-bottom: 20px;
    }
    table { width: 100%; border-collapse: collapse; margin-bottom: 16px; font-size: calc(var(--font-size-body) - 1px); }
    th { background: ${Colors.sand}; padding: 8px 10px; text-align: left; font-weight: 700; font-size: 12px; }
    td { padding: 8px 10px; border-bottom: 1px solid ${Colors.border}; vertical-align: top; }
    footer {
      margin-top: 40px; padding-top: 16px; border-top: 1px solid ${Colors.border};
      font-size: 12px; color: ${Colors.muted}; text-align: center;
    }
    label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 4px; }
    input, textarea {
      width: 100%; padding: 10px 12px; border: 1.5px solid ${Colors.border};
      border-radius: 8px; font-size: var(--font-size-body);
      background: #fff; color: ${Colors.text}; margin-bottom: 16px; font-family: inherit;
    }
    textarea { min-height: 100px; resize: vertical; }
    button {
      background: linear-gradient(135deg, ${Colors.primary}, ${Colors.primaryMid});
      color: #fff; border: none; border-radius: 10px;
      padding: 13px 28px; font-size: 15px; font-weight: 700; cursor: pointer; width: 100%;
    }
    .success {
      background: ${Colors.accentLight}; border: 1px solid ${Colors.accent};
      border-radius: 10px; padding: 16px; color: ${Colors.accent}; font-weight: 600;
    }
    .errors {
      background: ${Colors.surface}; border: 1px solid ${Colors.errorRed};
      border-radius: 10px; padding: 14px 16px; margin-bottom: 20px; color: ${Colors.errorRed};
    }
    ${isRtl ? rtlCss() : ''}
  `;
}
