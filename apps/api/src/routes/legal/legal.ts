/**
 * src/routes/legal/legal.ts
 *
 * Routes Hono pour les pages légales publiques.
 * Toute la logique de langue est dans content/index.ts.
 * Tout le rendu HTML est dans template/html.ts.
 *
 * Routes :
 *   GET  /legal/cgu      → Conditions Générales de Vente / Terms and Conditions
 *   GET  /legal/privacy  → Politique de confidentialité / Privacy Policy
 *   GET  /legal/mentions → Mentions légales / Legal Notices
 *   GET  /legal/delete   → Formulaire suppression de données
 *   POST /legal/delete   → Traitement de la demande
 */

import { Hono } from 'hono';
import { LegalDeleteParams, sendLegalDeleteEmail } from '../../lib/email.js';
import { getLocale } from './content/index.js';
import { buildPage } from './template/html.js';

export const legal = new Hono();

// ─── GET /legal/cgu ───────────────────────────────────────────────────────────

legal.get('/cgu', (c) => {
  const { lang, cgu, ui } = getLocale(c.req.header('accept-language'));
  return c.html(buildPage({ lang, title: ui.cgu.title, footerText: ui.cgu.footer, body: cgu }));
});

// ─── GET /legal/privacy ───────────────────────────────────────────────────────

legal.get('/privacy', (c) => {
  const { lang, privacy, ui } = getLocale(c.req.header('accept-language'));
  return c.html(buildPage({ lang, title: ui.privacy.title, footerText: ui.privacy.footer, body: privacy }));
});

// ─── GET /legal/mentions ──────────────────────────────────────────────────────

legal.get('/mentions', (c) => {
  const { lang, mentions, ui } = getLocale(c.req.header('accept-language'));
  return c.html(buildPage({ lang, title: ui.mentions.title, footerText: ui.mentions.footer, body: mentions }));
});

// ─── GET /legal/delete ────────────────────────────────────────────────────────

legal.get('/delete', (c) => {
  const { lang, ui } = getLocale(c.req.header('accept-language'));
  const d = ui.delete;

  const body = `
    <p>${d.intro}</p>
    <p class="muted">${d.note}</p>
    <form method="POST" action="/legal/delete">
      <label for="email">${d.labelEmail}</label>
      <input type="email" id="email" name="email" required placeholder="${d.placeholderEmail}" />

      <label for="orderId">${d.labelOrder}</label>
      <input type="text" id="orderId" name="orderId" placeholder="${d.placeholderOrder}" />

      <label for="reason">${d.labelReason}</label>
      <textarea id="reason" name="reason" placeholder="${d.placeholderReason}"></textarea>

      <button type="submit">${d.submit}</button>
    </form>
  `;

  return c.html(buildPage({ lang, title: d.title, footerText: d.footer, body }));
});

// ─── POST /legal/delete ───────────────────────────────────────────────────────

legal.post('/delete', async (c) => {
  const { lang, ui } = getLocale(c.req.header('accept-language'));
  const d = ui.delete;

  const formBody = await c.req.parseBody();
  const params: LegalDeleteParams = {
    customerEmail: String(formBody.email   ?? '').trim(),
    orderId:       String(formBody.orderId ?? '').trim(),
    reason:        String(formBody.reason  ?? '').trim(),
  };

  // Validation email
  if (!params.customerEmail || !params.customerEmail.includes('@')) {
    const body = `
      <div class="errors">${d.errorEmail}</div>
      <p><a href="/legal/delete">${d.backLink}</a></p>
    `;
    return c.html(
      buildPage({ lang, title: d.errorEmailTitle, footerText: d.footer, body }),
      400,
    );
  }

  // Envoi email
  try {
    sendLegalDeleteEmail(params);
  } catch (err) {
    console.error('[legal/delete] Erreur envoi email:', err);
    const body = `
      <div class="errors">${d.errorBody}</div>
      <p style="margin-top:20px;">
        ${d.contact} <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>
      </p>
    `;
    return c.html(buildPage({ lang, title: d.errorTitle, footerText: d.footer, body }));
  }

  // Succès
  const body = `
    <div class="success">
      ${d.successBody.replace('{email}', params.customerEmail)}
    </div>
    <p style="margin-top:20px;">
      ${d.contact} <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>
    </p>
  `;
  return c.html(buildPage({ lang, title: d.successTitle, footerText: d.footer, body }));
});
