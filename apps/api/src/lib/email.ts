/**
 * Service d'envoi d'email via Nodemailer → SMTP OVH
 *
 * Installation :
 *   npm install nodemailer @types/nodemailer qrcode @types/qrcode
 *
 * Variables d'environnement requises :
 *   SMTP_HOST=ssl0.ovh.net          # ou pro2.mail.ovh.net selon votre offre
 *   SMTP_PORT=465                   # 465 (SSL) ou 587 (STARTTLS)
 *   SMTP_SECURE=true                # true pour port 465, false pour 587
 *   SMTP_USER=votre@domaine.com     # adresse email OVH complète
 *   SMTP_PASS=motdepasse            # mot de passe de la boîte mail OVH
 *   EMAIL_FROM="ILOTEL eSIM <noreply@votre-domaine.com>"
 */

import nodemailer from 'nodemailer';
import QRCode from 'qrcode';

// ─── Transporter (singleton) ──────────────────────────────────────────────────

const transporter = nodemailer.createTransport({
  host: process.env.SMTP_HOST ?? 'ssl0.ovh.net',
  port: Number(process.env.SMTP_PORT ?? 465),
  secure: process.env.SMTP_SECURE !== 'false',
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASS,
  },
  tls: { rejectUnauthorized: true },
});

// ─── Logo ILOTEL (logo_with_tagline.png) ──────────────────────────────────────
//
// Image pré-traitée : fond blanc, redimensionnée à 240×240px, optimisée (8 KB).
// Source originale : apps/frontend/assets/images/logo_with_tagline.png
//
// Encodée en base64 ici pour être déployable sur Vercel (serverless, pas de FS)
// et injectée comme pièce jointe inline via Content-ID (CID) — méthode la plus
// compatible avec tous les clients mail (Gmail, Apple Mail, Outlook Web…).

const ILOTEL_LOGO_CID = 'ilotel_logo';


// ─── Types ────────────────────────────────────────────────────────────────────

export interface EsimEmailParams {
  to: string;
  orderId: string;
  country: string;
  flag: string;
  dataGb: number;
  durationDays: number;
  finalPrice: number;
  activationCode: string;
  iccid: string;
  purchasedAt: string;
}

export interface LegalDeleteParams {
  customerEmail: string;
  orderId: string | null;
  reason: string | null;
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

function stepRow(n: string, text: string, bg: string, textColor: string): string {
  const badge = `<span style="display:inline-block;background:${bg};color:#fff;font-size:10px;font-weight:700;border-radius:50%;width:18px;height:18px;text-align:center;line-height:18px;">${n}</span>`;
  return `
    <tr>
      <td style="padding:2px 8px 4px 0;vertical-align:top;">${badge}</td>
      <td style="font-size:12px;color:${textColor};line-height:1.6;">${text}</td>
    </tr>`;
}

// ─── Template HTML ────────────────────────────────────────────────────────────

async function buildHtml(p: EsimEmailParams): Promise<string> {
  const dateStr = new Date(p.purchasedAt).toLocaleDateString('fr-FR', {
    day: '2-digit', month: 'long', year: 'numeric',
  });

  const qrDataUrl = await QRCode.toDataURL(p.activationCode, {
    width: 160,
    margin: 2,
    color: { dark: '#2A1508', light: '#FFFFFF' },
  });

  return `
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Votre eSIM ${p.flag} ${p.country}</title>
</head>
<body style="margin:0;padding:0;background:#FDF8F3;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',sans-serif;">
<table width="100%" cellpadding="0" cellspacing="0" style="background:#FDF8F3;padding:32px 16px;">
  <tr><td align="center">
  <table width="540" cellpadding="0" cellspacing="0" style="max-width:540px;width:100%;">

    <!-- ── BANDE BLANCHE (logo) ── -->
    <tr>
      <td style="
        background:#FFFFFF;
        padding:18px 24px 10px;
        border-bottom:2px solid #EDE5DC;
        border-radius:20px 20px 0 0;
      " align="center">

        <!-- Logo crop comme app -->
        <div style="width:180;height:90px;">
          <img
            src="cid:${ILOTEL_LOGO_CID}"
            style="
              width:180px;
              height:90px;
              position:relative;
            "
          />
        </div>

      </td>
    </tr>

    <!-- ── HERO (ton contenu + style app) ── -->
    <tr>
      <td style="
        background:#E8622A;
        background:linear-gradient(135deg,#E8622A,#F07A44);
        padding:28px 24px;
        color:#FFFFFF;
      ">

        <!-- Titre -->
        <h1 style="
          margin:0 0 8px;
          font-size:24px;
          font-weight:700;
          color:#fff;
          line-height:1.3;
        ">
          Votre eSIM est prête ! 🎉
        </h1>

        <!-- Infos -->
        <p style="
          margin:0;
          font-size:14px;
          color:rgba(255,255,255,0.9);
        ">
          ${p.flag} ${p.country} &nbsp;·&nbsp; ${p.dataGb} Go / ${p.durationDays} jours
        </p>

      </td>
    </tr>

    <!-- ── Récapitulatif de commande ── -->
    <tr><td style="background:#fff;padding:24px 32px 8px;">
      <p style="margin:0 0 12px;font-size:11px;font-weight:700;color:#9A7A68;letter-spacing:1.5px;text-transform:uppercase;">📋 Récapitulatif de commande</p>
      <table width="100%" cellpadding="0" cellspacing="0" style="border-collapse:collapse;">
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="font-size:13px;color:#9A7A68;padding:7px 0;">Destination</td>
          <td align="right" style="font-size:13px;font-weight:600;color:#2A1508;">${p.flag} ${p.country}</td>
        </tr>
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="font-size:13px;color:#9A7A68;padding:7px 0;">Forfait</td>
          <td align="right" style="font-size:13px;font-weight:600;color:#2A1508;">${p.dataGb} Go / ${p.durationDays} jours</td>
        </tr>
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="font-size:13px;color:#9A7A68;padding:7px 0;">Prix payé</td>
          <td align="right" style="font-size:13px;font-weight:700;color:#E8622A;">${p.finalPrice.toFixed(2)} €</td>
        </tr>
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="font-size:13px;color:#9A7A68;padding:7px 0;">ICCID</td>
          <td align="right" style="font-size:11px;font-family:'Courier New',monospace;color:#2A1508;">${p.iccid}</td>
        </tr>
        <tr style="border-bottom:1px solid #F0D9C8;">
          <td style="font-size:13px;color:#9A7A68;padding:7px 0;">Référence</td>
          <td align="right" style="font-size:11px;font-family:'Courier New',monospace;color:#9A7A68;">${p.orderId}</td>
        </tr>
        <tr>
          <td style="font-size:13px;color:#9A7A68;padding:7px 0;">Date</td>
          <td align="right" style="font-size:13px;color:#2A1508;">${dateStr}</td>
        </tr>
      </table>
    </td></tr>

    <!-- ── Séparateur ── -->
    <tr><td style="background:#fff;padding:0 32px 8px;"><div style="height:1px;background:#F0D9C8;"></div></td></tr>

    <!-- ── Code d'activation ── -->
    <tr><td style="background:#fff;padding:20px 32px 8px;">
      <p style="margin:0 0 14px;font-size:11px;font-weight:700;color:#9A7A68;letter-spacing:1.5px;text-transform:uppercase;">🔑 Code d'activation</p>

      <!-- QR code -->
      <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" style="padding-bottom:12px;">
            <img src="${qrDataUrl}" width="160" height="160" alt="" style="display:block;border-radius:8px;border:2px solid #F0D9C8;" />
          </td>
        </tr>
      </table>

      <!-- Séparateur ou -->
      <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:12px;">
        <tr>
          <td style="border-bottom:1px solid #F0D9C8;width:44%;"></td>
          <td align="center" style="font-size:11px;color:#9A7A68;white-space:nowrap;padding:0 10px;">ou saisir manuellement</td>
          <td style="border-bottom:1px solid #F0D9C8;width:44%;"></td>
        </tr>
      </table>

      <!-- Code texte -->
      <div style="background:#FFF3EA;border:2px dashed #F0D9C8;border-radius:12px;padding:16px 20px;word-break:break-all;">
        <p style="margin:0;font-family:'Courier New',Courier,monospace;font-size:13px;font-weight:700;color:#E8622A;line-height:1.7;letter-spacing:0.5px;">${p.activationCode}</p>
      </div>
    </td></tr>

    <!-- ── Instructions iOS ── -->
    <tr><td style="background:#fff;padding:20px 32px 24px;">
      <div style="background:#F0F9FF;border-left:3px solid #0EA5E9;border-radius:0 10px 10px 0;padding:14px 16px;margin-bottom:12px;">
        <table cellpadding="0" cellspacing="0" style="margin-bottom:8px;">
          <tr>
            <td style="font-size:13px;font-weight:700;color:#0369A1;vertical-align:middle;">Activation sur iPhone (iOS)</td>
          </tr>
        </table>
        <table cellpadding="0" cellspacing="0">
          ${stepRow('1', 'Réglages', '#0EA5E9', '#0C4A6E')}
          ${stepRow('2', 'Données cellulaires → Ajouter un forfait', '#0EA5E9', '#0C4A6E')}
          ${stepRow('3', 'Entrer les informations manuellement', '#0EA5E9', '#0C4A6E')}
          ${stepRow('4', "Collez le code d'activation ci-dessus", '#0EA5E9', '#0C4A6E')}
        </table>
      </div>

      <div style="background:#F0FDF4;border-left:3px solid #22C55E;border-radius:0 10px 10px 0;padding:14px 16px;">
        <table cellpadding="0" cellspacing="0" style="margin-bottom:8px;">
          <tr>
            <td style="font-size:13px;font-weight:700;color:#15803D;vertical-align:middle;">Activation sur Android</td>
          </tr>
        </table>
        <table cellpadding="0" cellspacing="0">
          ${stepRow('1', 'Réseaux et internet (ou Connexions)', '#22C55E', '#14532D')}
          ${stepRow('2', 'SIM → Ajouter SIM ou carte eSIM', '#22C55E', '#14532D')}
          ${stepRow('3', "Entrer un code d'activation", '#22C55E', '#14532D')}
          ${stepRow('4', "Collez le code d'activation ci-dessus", '#22C55E', '#14532D')}
        </table>
      </div>
    </td></tr>

    <!-- ── Pied de page ── -->
    <tr><td style="background:#F5E0CC;border-radius:0 0 20px 20px;padding:20px 32px;text-align:center;">
      <p style="margin:0 0 4px;font-size:12px;color:#9A7A68;">
        Un problème ? Contactez-nous à
        <a href="mailto:support@ilotel.com" style="color:#E8622A;text-decoration:none;">support@ilotel.com</a>
      </p>
      <p style="margin:0;font-size:11px;color:#B8957E;">© ${new Date().getFullYear()} ILOTEL · Tous droits réservés</p>
    </td></tr>

  </table>
  </td></tr>
</table>
</body>
</html>`.trim();
}

// ─── Envoi ────────────────────────────────────────────────────────────────────

export async function sendEsimEmail(params: EsimEmailParams): Promise<void> {
  if (!process.env.EMAIL_FROM) {
    throw new Error('EMAIL_FROM is not set');
  }
  console.log(`EMAIL FROM : ${process.env.EMAIL_FROM}`)

  const html = await buildHtml(params);

  await transporter.sendMail({
    from: process.env.EMAIL_FROM,
    to: params.to,
    subject: `Votre eSIM ${params.flag} ${params.country} est prête — ${params.dataGb} Go / ${params.durationDays}j`,
    html,
    attachments: [
      {
        cid: ILOTEL_LOGO_CID,
        filename: 'logo.png',
        content: Buffer.from(ILOTEL_LOGO_B64, 'base64'),
        contentType: 'image/png',
        contentDisposition: 'inline',
      },
    ],
  });
}

export async function sendLegalDeleteEmail(params: LegalDeleteParams) {
  await transporter.sendMail({
    from: process.env.EMAIL_FROM ?? process.env.SMTP_USER,
    to: "dpo@ilotel.com",
    subject: `[RGPD] Demande de suppression — ${params.customerEmail}`,
    text: [
      `Email : ${params.customerEmail}`,
      `Référence commande : ${params.orderId || 'non renseignée'}`,
      `Motif : ${params.reason || 'non renseigné'}`,
      `Date : ${new Date().toISOString()}`,
    ].join('\n'),
  });
}