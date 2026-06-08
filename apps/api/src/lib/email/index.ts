/**
 * src/lib/email/index.ts
 *
 * Service d'envoi d'email via Nodemailer → SMTP OVH.
 * Les templates et traductions sont gérés dans src/translation/.
 *
 * Variables d'environnement requises :
 *   SMTP_HOST        ssl0.ovh.net
 *   SMTP_PORT        465
 *   SMTP_SECURE      true
 *   SMTP_USER        votre@domaine.com
 *   SMTP_PASS        motdepasse
 *   EMAIL_FROM       "ILOTEL eSIM <noreply@ilotel.com>"
 *   ILOTEL_LOGO_B64  base64 du logo PNG (ne pas committer dans le code)
 */

import { getCountryName } from '@ilotel/shared';
import nodemailer from 'nodemailer';
import QRCode from 'qrcode';
import { BRAND } from '../../constants/env.js';
import {
  getEsimContent,
  resolveLang
} from '../../translation/index.js';
import { ILOTEL_LOGO_B64, ILOTEL_LOGO_CID } from './assets/ilotelLogoB64.js';
import { buildDeleteSubject, buildDeleteText } from './delete/html.js';
import { buildEsimHtml } from './esim/html.js';

// ─── Types publics ────────────────────────────────────────────────────────────

export interface EsimEmailParams {
  to:             string;
  orderId:        string;
  code:           string;
  flag:           string;
  dataGb:         number;
  durationDays:   number;
  finalPrice:     number;
  activationCode: string;
  iccid:          string;
  purchasedAt:    string;
  /** fallback sur DEFAULT_LANG si absente */
  lang:          string;
}

export interface LegalDeleteParams {
  customerEmail: string;
  orderId:       string | null;
  reason:        string | null;
}

// ─── Transporter (singleton) ──────────────────────────────────────────────────

const transporter = nodemailer.createTransport({
  host:   process.env.SMTP_HOST   ?? 'ssl0.ovh.net',
  port:   Number(process.env.SMTP_PORT ?? 465),
  secure: process.env.SMTP_SECURE !== 'false',
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASS,
  },
  tls: { rejectUnauthorized: true },
});

// ─── sendEsimEmail ────────────────────────────────────────────────────────────

export async function sendEsimEmail(params: EsimEmailParams): Promise<void> {
  if (!process.env.EMAIL_FROM) {
    throw new Error('EMAIL_FROM is not set');
  }

  const lang    = resolveLang(undefined, params.lang);
  const content = getEsimContent(lang);
  const countryName = getCountryName(params.code, lang);

  const qrDataUrl = await QRCode.toDataURL(params.activationCode, {
    width:  256,
    margin: 2,
    color: { dark: '#2A1508', light: '#FFFFFF' },
  });

  const html = buildEsimHtml({
    params,
    content,
    qrDataUrl,
    logoCid: ILOTEL_LOGO_CID,
    countryName,
    lang,
  });

  // const logoB64 = process.env.ILOTEL_LOGO_B64 ?? '';

  await transporter.sendMail({
    from:    process.env.EMAIL_FROM,
    to:      params.to,
    subject: content.subject(params),
    html,
    attachments: [
      {
        cid:                ILOTEL_LOGO_CID,
        filename:           'logo.png',
        content:            Buffer.from(ILOTEL_LOGO_B64, 'base64'),
        contentType:        'image/png',
        contentDisposition: 'inline',
      },
    ],
  });

  console.log(`[email] eSIM envoyée → ${params.to} (${lang})`);
}

// ─── sendLegalDeleteEmail ─────────────────────────────────────────────────────

export async function sendLegalDeleteEmail(params: LegalDeleteParams): Promise<void> {
  // Email interne vers le DPO — toujours en FR
  const content = {
    subject:     '[RGPD] Demande de suppression',
    notProvided: 'Non renseigné',
    fields: {
      email:  'Email : {value}',
      order:  'Référence commande : {value}',
      reason: 'Motif : {value}',
      date:   'Date de la demande : {value}',
    },
  };
  const text    = buildDeleteText(params, content);

  await transporter.sendMail({
    from:    process.env.EMAIL_FROM ?? process.env.SMTP_USER,
    to:      BRAND.dpo,
    subject: buildDeleteSubject(params),
    text,
  });

  console.log(`[email] Suppression → ${BRAND.dpo} (${params.customerEmail})`);
}
