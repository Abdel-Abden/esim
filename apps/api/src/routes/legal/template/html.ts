/**
 * src/routes/legal/template/html.ts
 *
 * Shell HTML unique pour toutes les pages légales.
 * Gère automatiquement dir="rtl" pour l'arabe (et toute future langue RTL).
 */

import { buildCss } from './css.js';

export interface PageOptions {
  lang:        string;
  title:       string;
  footerText:  string;
  body:        string;
}

const RTL_LANGS = new Set(['ar', 'he', 'fa', 'ur']);

export function buildPage({ lang, title, footerText, body }: PageOptions): string {
  const css = buildCss(lang);
  const dir = RTL_LANGS.has(lang) ? 'rtl' : 'ltr';

  return `<!DOCTYPE html>
<html lang="${lang}" dir="${dir}">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${title} — ILOTEL eSIM</title>
  <style>${css}</style>
</head>
<body>
<div class="wrap">

  <header>
    <p>📡 ILOTEL eSIM</p>
    <h1>${title}</h1>
  </header>

  ${body}

  <footer>
    ILOTEL — <a href="mailto:support@ilotel.com">support@ilotel.com</a><br/>
    ${footerText}
  </footer>

</div>
</body>
</html>`;
}
