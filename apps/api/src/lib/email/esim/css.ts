/**
 * src/translation/template/mail/esim/css.ts
 *
 * Styles inline pour l'email eSIM.
 * Les emails utilisent uniquement des styles inline ou des attributs HTML —
 * pas de CSS moderne (compatibilité Gmail, Outlook, Apple Mail).
 * Colors importé depuis @ilotel/shared.
 */

import { Colors } from '@ilotel/shared';

/** Tokens par langue pour adapter la typographie */
export interface MailLangTokens {
  fontSize:     string;
  lineHeight:   string;
  fontStack:    string;
  dir:          'ltr' | 'rtl';
  align:        'left' | 'right';
  listPadding:  string;
}

const MAIL_LANG_TOKENS: Record<string, MailLangTokens> = {
  fr: { fontSize: '14px', lineHeight: '1.6',  fontStack: "-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif", dir: 'ltr', align: 'left',  listPadding: 'padding-left:16px;' },
  en: { fontSize: '14px', lineHeight: '1.6',  fontStack: "-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif", dir: 'ltr', align: 'left',  listPadding: 'padding-left:16px;' },
  de: { fontSize: '13px', lineHeight: '1.55', fontStack: "-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif", dir: 'ltr', align: 'left',  listPadding: 'padding-left:16px;' },
  ar: { fontSize: '15px', lineHeight: '1.8',  fontStack: "'Geeza Pro','Arabic UI Text','Noto Sans Arabic',sans-serif", dir: 'rtl', align: 'right', listPadding: 'padding-right:16px;' },
};

const DEFAULT_TOKENS = MAIL_LANG_TOKENS.fr;

export function getMailTokens(lang: string): MailLangTokens {
  return MAIL_LANG_TOKENS[lang] ?? DEFAULT_TOKENS;
}

/** Styles réutilisables en inline — objet pour éviter la duplication */
export function getStyles(lang: string) {
  const t = getMailTokens(lang);
  return {
    body:        `margin:0;padding:0;background:${Colors.bg};font-family:${t.fontStack};`,
    wrap:        `background:${Colors.bg};padding:32px 16px;`,
    card:        `max-width:540px;width:100%;`,
    logoCell:    `background:${Colors.card};padding:18px 24px 10px;border-bottom:2px solid ${Colors.border};border-radius:20px 20px 0 0;`,
    hero:        `background:linear-gradient(135deg,${Colors.primary},${Colors.primaryMid});padding:28px 24px;color:#fff;`,
    heroTitle:   `margin:0 0 8px;font-size:24px;font-weight:700;color:#fff;line-height:1.3;`,
    heroSub:     `margin:0;font-size:14px;color:rgba(255,255,255,0.9);`,
    section:     `background:${Colors.card};padding:24px 32px 8px;`,
    sectionLast: `background:${Colors.card};padding:20px 32px 24px;`,
    label:       `margin:0 0 12px;font-size:11px;font-weight:700;color:${Colors.muted};letter-spacing:1.5px;text-transform:uppercase;`,
    divider:     `background:${Colors.card};padding:0 32px 8px;`,
    dividerLine: `height:1px;background:${Colors.border};`,
    rowLabel:    `font-size:13px;color:${Colors.muted};padding:7px 0;`,
    rowValue:    `font-size:13px;font-weight:600;color:${Colors.text};`,
    rowPrice:    `font-size:13px;font-weight:700;color:${Colors.primary};`,
    rowMono:     `font-size:11px;font-family:'Courier New',monospace;color:${Colors.text};`,
    rowMonoMuted:`font-size:11px;font-family:'Courier New',monospace;color:${Colors.muted};`,
    qrCode:      `display:block;border-radius:8px;border:2px solid ${Colors.border};`,
    orSepLabel:  `font-size:11px;color:${Colors.muted};white-space:nowrap;padding:0 10px;`,
    orSepLine:   `border-bottom:1px solid ${Colors.border};width:44%;`,
    codeBox:     `background:${Colors.surface};border:2px dashed ${Colors.border};border-radius:12px;padding:16px 20px;word-break:break-all;`,
    codeText:    `margin:0;font-family:'Courier New',Courier,monospace;font-size:13px;font-weight:700;color:${Colors.primary};line-height:1.7;letter-spacing:0.5px;`,
    iosBlock:    `background:#F0F9FF;border-left:3px solid #0EA5E9;border-radius:0 10px 10px 0;padding:14px 16px;margin-bottom:12px;`,
    iosTitle:    `font-size:13px;font-weight:700;color:#0369A1;vertical-align:middle;`,
    iosBadge:    `display:inline-block;background:#0EA5E9;color:#fff;font-size:10px;font-weight:700;border-radius:50%;width:18px;height:18px;text-align:center;line-height:18px;`,
    iosStep:     `font-size:12px;color:#0C4A6E;line-height:1.6;`,
    androidBlock:`background:#F0FDF4;border-left:3px solid #22C55E;border-radius:0 10px 10px 0;padding:14px 16px;`,
    androidTitle:`font-size:13px;font-weight:700;color:#15803D;vertical-align:middle;`,
    androidBadge:`display:inline-block;background:#22C55E;color:#fff;font-size:10px;font-weight:700;border-radius:50%;width:18px;height:18px;text-align:center;line-height:18px;`,
    androidStep: `font-size:12px;color:#14532D;line-height:1.6;`,
    footer:      `background:${Colors.sand};border-radius:0 0 20px 20px;padding:20px 32px;text-align:center;`,
    footerText:  `margin:0 0 4px;font-size:12px;color:${Colors.muted};`,
    footerCopy:  `margin:0;font-size:11px;color:#B8957E;`,
    footerLink:  `color:${Colors.primary};text-decoration:none;`,
    align:       t.align,
    dir:         t.dir,
  } as const;
}
