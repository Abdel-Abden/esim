/**
 * src/translation/template/web/legal/html.ts
 *
 * Shell HTML unique pour toutes les pages légales web.
 * Gère automatiquement dir="rtl" pour les langues RTL.
 */

import { RTL_LANGS } from '@ilotel/shared';
import { BRAND } from '../../constants/env.js';
import { buildCss } from './css.js';

export interface PageOptions {
  lang:       string;
  title:      string;
  footerText: string;
  body:       string;
}

export function buildPage({ lang, title, footerText, body }: PageOptions): string {
  const css = buildCss(lang);
  const dir = RTL_LANGS.has(lang) ? 'rtl' : 'ltr';

  return `<!DOCTYPE html>
<html lang="${lang}" dir="${dir}">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${title} — ${BRAND.appName}</title>
  <style>${css}</style>
</head>
<body>
<div class="wrap">
  <header>
    <p>📡 ${BRAND.appName}</p>
    <h1>${title}</h1>
  </header>
  ${body}
  <footer>
    ${BRAND.name} — <a href="mailto:${BRAND.support}">${BRAND.support}</a><br/>
    ${footerText}
  </footer>
</div>
</body>
</html>`;
}
