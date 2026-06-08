/**
 * src/translation/template/mail/esim/html.ts
 *
 * Shell HTML table-based pour l'email de confirmation eSIM.
 * Reçoit le contenu traduit et les données dynamiques — aucune string hardcodée.
 */

import { BRAND } from '../../../constants/env.js';
import type { EsimEmailContent } from '../../../translation/mail/esim/index.js';
import type { EsimEmailParams } from '../index.js';
import { getMailTokens, getStyles } from './css.js';

function stepRow(n: string, text: string, badgeStyle: string, textStyle: string): string {
  return `
    <tr>
      <td style="padding:2px 8px 4px 0;vertical-align:top;">
        <span style="${badgeStyle}">${n}</span>
      </td>
      <td style="${textStyle}">${text}</td>
    </tr>`;
}

export interface BuildMailOptions {
  params:       EsimEmailParams;
  content:      EsimEmailContent;
  qrDataUrl:    string;
  logoCid:      string;
  countryName:  string;
  lang:         string;
}

export function buildEsimHtml({ params, content, qrDataUrl, logoCid, countryName, lang }: BuildMailOptions): string {
  const s = getStyles(lang);
  const t = getMailTokens(lang);

  const dateStr = new Date(params.purchasedAt).toLocaleDateString(
    content.dateLocale,
    { day: '2-digit', month: 'long', year: 'numeric' },
  );

  return `<!DOCTYPE html>
<html lang="${lang}" dir="${t.dir}">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${content.subject(params)}</title>
</head>
<body style="${s.body}">
<table width="100%" cellpadding="0" cellspacing="0" style="${s.wrap}">
  <tr><td align="center">
  <table width="540" cellpadding="0" cellspacing="0" style="${s.card}">

    <!-- Logo -->
    <tr>
      <td style="${s.logoCell}" align="center">
        <img src="cid:${logoCid}" width="180" height="90" alt="${BRAND.appName}" style="display:block;" />
      </td>
    </tr>

    <!-- Hero -->
    <tr>
      <td style="${s.hero}">
        <h1 style="${s.heroTitle}">${content.heroTitle}</h1>
        <p style="${s.heroSub}">${params.flag} ${countryName} &nbsp;·&nbsp; ${params.dataGb} Go / ${params.durationDays} ${content.days}</p>
      </td>
    </tr>

    <!-- Récapitulatif -->
    <tr><td style="${s.section}">
      <p style="${s.label}">${content.summaryLabel}</p>
      <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="${s.rowLabel};padding:7px 0;">${content.rows.destination}</td>
          <td align="${s.align}" style="${s.rowValue}">${params.flag} ${countryName}</td>
        </tr>
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="${s.rowLabel};padding:7px 0;">${content.rows.plan}</td>
          <td align="${s.align}" style="${s.rowValue}">${params.dataGb} Go / ${params.durationDays} ${content.days}</td>
        </tr>
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="${s.rowLabel};padding:7px 0;">${content.rows.price}</td>
          <td align="${s.align}" style="${s.rowPrice}">${params.finalPrice.toFixed(2)} €</td>
        </tr>
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="${s.rowLabel};padding:7px 0;">${content.rows.iccid}</td>
          <td align="${s.align}" style="${s.rowMono}">${params.iccid}</td>
        </tr>
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="${s.rowLabel};padding:7px 0;">${content.rows.reference}</td>
          <td align="${s.align}" style="${s.rowMonoMuted}">${params.orderId}</td>
        </tr>
        <tr>
          <td style="${s.rowLabel};padding:7px 0;">${content.rows.date}</td>
          <td align="${s.align}" style="${s.rowValue}">${dateStr}</td>
        </tr>
      </table>
    </td></tr>

    <!-- Séparateur -->
    <tr><td style="${s.divider}"><div style="${s.dividerLine}"></div></td></tr>

    <!-- Code d'activation -->
    <tr><td style="${s.section}">
      <p style="${s.label}">${content.activationLabel}</p>
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" style="padding-bottom:12px;">
            <img src="${qrDataUrl}" width="160" height="160" alt="" style="${s.qrCode}" />
          </td>
        </tr>
      </table>
      <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:12px;">
        <tr>
          <td style="${s.orSepLine}"></td>
          <td align="center" style="${s.orSepLabel}">${content.orManual}</td>
          <td style="${s.orSepLine}"></td>
        </tr>
      </table>
      <div style="${s.codeBox}">
        <p style="${s.codeText}">${params.activationCode}</p>
      </div>
    </td></tr>

    <!-- Étapes d'activation -->
    <tr><td style="${s.sectionLast}">
      <div style="${s.iosBlock}">
        <table cellpadding="0" cellspacing="0" style="margin-bottom:8px;">
          <tr><td style="${s.iosTitle}">${content.steps.ios.title}</td></tr>
        </table>
        <table cellpadding="0" cellspacing="0">
          ${content.steps.ios.steps.map(step =>
            stepRow(step.n, step.text, s.iosBadge, s.iosStep)
          ).join('')}
        </table>
      </div>
      <div style="${s.androidBlock}">
        <table cellpadding="0" cellspacing="0" style="margin-bottom:8px;">
          <tr><td style="${s.androidTitle}">${content.steps.android.title}</td></tr>
        </table>
        <table cellpadding="0" cellspacing="0">
          ${content.steps.android.steps.map(step =>
            stepRow(step.n, step.text, s.androidBadge, s.androidStep)
          ).join('')}
        </table>
      </div>
    </td></tr>

    <!-- Footer -->
    <tr><td style="${s.footer}">
      <p style="${s.footerText}">
        ${content.footerHelp}
        <a href="mailto:${BRAND.support}" style="${s.footerLink}">${BRAND.support}</a>
      </p>
      <p style="${s.footerCopy}">© ${BRAND.year} ${BRAND.name} · ${content.rights}</p>
    </td></tr>

  </table>
  </td></tr>
</table>
</body>
</html>`.trim();
}
