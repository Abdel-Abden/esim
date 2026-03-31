/**
 * apps/api/src/routes/legal.ts
 *
 * Pages légales publiques accessibles depuis internet.
 * Utilisées par Google Play / App Store pour vérification.
 *
 * Routes :
 *   GET  /legal/cgu      → Conditions Générales de Vente (HTML)
 *   GET  /legal/privacy  → Politique de confidentialité (HTML)
 *   GET  /legal/delete   → Formulaire de demande de suppression (HTML)
 *   POST /legal/delete   → Traitement de la demande (envoie un email)
 */

import { Hono } from 'hono';
import { LegalDeleteParams, sendLegalDeleteEmail } from '../lib/email.js';

export const legal = new Hono();

// ─── Styles communs ───────────────────────────────────────────────────────────

const CSS = `
  *, *::before, *::after { box-sizing: border-box; }
  body {
    margin: 0;
    padding: 0;
    background: #FDF8F3;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
    color: #2A1508;
    line-height: 1.65;
  }
  .wrap {
    max-width: 680px;
    margin: 0 auto;
    padding: 32px 20px 64px;
  }
  header {
    background: linear-gradient(135deg, #E8622A, #F07A44);
    padding: 20px 24px;
    border-radius: 16px;
    margin-bottom: 32px;
  }
  header p { margin: 0; font-size: 11px; font-weight: 700;
    color: rgba(255,255,255,0.75); letter-spacing: 2px; text-transform: uppercase; }
  header h1 { margin: 6px 0 0; font-size: 22px; font-weight: 700; color: #fff; }
  h2 {
    font-size: 16px; font-weight: 700; color: #E8622A;
    margin: 28px 0 6px; border-bottom: 1px solid #F0D9C8; padding-bottom: 6px;
  }
  p { margin: 0 0 12px; font-size: 14px; }
  ul { margin: 0 0 12px; padding-left: 20px; }
  li { font-size: 14px; margin-bottom: 4px; }
  .muted { color: #9A7A68; font-size: 12px; }
  .box {
    background: #FFF3EA; border: 1px solid #F0D9C8;
    border-radius: 10px; padding: 14px 16px; margin-bottom: 20px;
  }
  table { width: 100%; border-collapse: collapse; margin-bottom: 16px; font-size: 13px; }
  th { background: #F5E0CC; padding: 8px 10px; text-align: left; font-weight: 700; font-size: 12px; }
  td { padding: 8px 10px; border-bottom: 1px solid #F0D9C8; vertical-align: top; }
  a { color: #E8622A; }
  footer { margin-top: 40px; padding-top: 16px; border-top: 1px solid #F0D9C8;
    font-size: 12px; color: #9A7A68; text-align: center; }
  /* Formulaire */
  label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 4px; }
  input, textarea, select {
    width: 100%; padding: 10px 12px; border: 1.5px solid #F0D9C8;
    border-radius: 8px; font-size: 14px; background: #fff;
    color: #2A1508; margin-bottom: 16px; font-family: inherit;
  }
  textarea { min-height: 100px; resize: vertical; }
  button {
    background: linear-gradient(135deg, #E8622A, #F07A44);
    color: #fff; border: none; border-radius: 10px;
    padding: 13px 28px; font-size: 15px; font-weight: 700;
    cursor: pointer; width: 100%;
  }
  .success {
    background: #E0F5F2; border: 1px solid #1A8A7A;
    border-radius: 10px; padding: 16px; color: #0E6B5E; font-weight: 600;
  }
  .errors {
    background: #FFF3EA; border: 1px solid #F0D9C8;
    border-radius: 10px; padding: 14px 16px; margin-bottom: 20px;
    border-color: #DC2626;
    color: #991B1B;
  }
`;

function page(title: string, body: string): string {
  return `<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${title} — ILOTEL eSIM</title>
  <style>${CSS}</style>
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
    Dernière mise à jour : mars 2025
  </footer>
</div>
</body>
</html>`;
}

// ─── GET /legal/cgu ───────────────────────────────────────────────────────────

legal.get('/cgu', (c) => {
  const html = page('Conditions Générales de Vente', `
    <p class="muted">Version en vigueur au 1er mars 2025</p>

    <div class="box">
      ILOTEL commercialise des eSIM prépayées permettant d'accéder à des forfaits
      de données mobiles à l'international, via une application mobile iOS et Android.
      Toute commande implique l'acceptation pleine et entière des présentes CGV.
    </div>

    <h2>Article 1 — Identification du vendeur</h2>
    <p>
      Le service ILOTEL est exploité par la société ILOTEL SAS, France.<br/>
      Contact : <a href="mailto:support@ilotel.com">support@ilotel.com</a>
    </p>

    <h2>Article 2 — Objet</h2>
    <p>
      Les présentes CGV régissent la vente de cartes eSIM (Embedded SIM) et de forfaits
      de données mobiles proposés via l'application mobile ILOTEL. Chaque forfait est
      caractérisé par un volume de données (Go), une durée de validité (jours) et une
      zone géographique de couverture.
    </p>

    <h2>Article 3 — Prix</h2>
    <p>
      Les prix sont affichés en euros (€) TTC. ILOTEL se réserve le droit de modifier
      ses prix à tout moment, mais s'engage à facturer au prix affiché au moment de
      la validation de la commande. Des offres promotionnelles peuvent être proposées
      pour une durée et un stock limités.
    </p>

    <h2>Article 4 — Processus de commande</h2>
    <ol>
      <li>Sélection de la destination et de l'offre souhaitée dans l'application.</li>
      <li>Saisie de l'adresse email de confirmation.</li>
      <li>Acceptation des présentes CGV.</li>
      <li>Paiement sécurisé via Stripe.</li>
      <li>Réception du code d'activation eSIM par email.</li>
    </ol>
    <p>
      La commande est confirmée à réception du paiement par Stripe.
      Un email contenant le code d'activation est envoyé immédiatement.
    </p>

    <h2>Article 5 — Paiement</h2>
    <p>
      Le paiement est effectué par carte bancaire (Visa, Mastercard, American Express),
      Apple Pay ou Google Pay, via la solution sécurisée
      <strong>Stripe Payments Europe, Ltd.</strong> (Irlande).<br/><br/>
      Les coordonnées bancaires sont chiffrées (TLS) et ne sont jamais stockées
      sur les serveurs d'ILOTEL. ILOTEL se réserve le droit de refuser toute commande
      présentant un risque de fraude.
    </p>

    <h2>Article 6 — Livraison et activation</h2>
    <p>
      L'eSIM est un contenu numérique livré immédiatement après confirmation du paiement.
      Le client reçoit par email un code d'activation à saisir manuellement dans les
      réglages réseau de son appareil.<br/><br/>
      L'activation requiert un appareil compatible eSIM et déverrouillé opérateur.
      Il appartient au client de vérifier cette compatibilité avant tout achat.
      ILOTEL ne peut être tenu responsable d'un problème de réception d'email
      (filtre anti-spam, boîte pleine, etc.).
    </p>

    <h2>Article 7 — Droit de rétractation</h2>
    <p>
      Conformément à l'article L221-28 12° du Code de la consommation, le droit de
      rétractation <strong>ne s'applique pas</strong> aux contenus numériques dont
      l'exécution a commencé avec l'accord exprès du consommateur.<br/><br/>
      En validant sa commande, le client reconnaît que la fourniture de l'eSIM débute
      immédiatement après le paiement et renonce expressément à son droit de rétractation
      de 14 jours.
    </p>

    <h2>Article 8 — Réclamations</h2>
    <p>
      Pour toute réclamation, contactez <a href="mailto:support@ilotel.com">support@ilotel.com</a>
      en indiquant votre Email et/ou votre eSIM. ILOTEL s'engage à accuser réception
      sous 48h et à répondre sous 10 jours ouvrés.<br/><br/>
      En cas de dysfonctionnement technique imputable à ILOTEL, un remboursement ou
      un échange sera proposé.
    </p>

    <h2>Article 9 — Données personnelles</h2>
    <p>
      ILOTEL collecte uniquement l'adresse email du client, utilisée pour la livraison
      du code d'activation et le service après-vente. Aucune autre donnée personnelle
      n'est collectée directement par ILOTEL. Les données de paiement sont traitées
      exclusivement par Stripe.<br/><br/>
      Consulter la <a href="/legal/privacy">Politique de confidentialité</a> pour le
      détail des traitements et l'exercice de vos droits.
    </p>

    <h2>Article 10 — Qualité de service</h2>
    <p>
      La qualité du réseau (débit, couverture) dépend des opérateurs locaux partenaires
      et ne peut être garantie dans les zones à faible couverture. ILOTEL agit en qualité
      de revendeur de services de roaming data.
    </p>

    <h2>Article 11 — Médiation et litiges</h2>
    <p>
      En cas de litige non résolu à l'amiable, le consommateur peut recourir gratuitement
      à la plateforme européenne de règlement en ligne des litiges :
      <a href="https://ec.europa.eu/consumers/odr" target="_blank">ec.europa.eu/consumers/odr</a>.<br/><br/>
      Les présentes CGV sont soumises au droit français.
    </p>
  `);

  return c.html(html);
});

// ─── GET /legal/privacy ───────────────────────────────────────────────────────

legal.get('/privacy', (c) => {
  const html = page('Politique de confidentialité', `
    <p class="muted">Version en vigueur au 1er mars 2025 · Conforme au RGPD (UE) 2016/679</p>

    <div class="box">
      Chez ILOTEL, nous collectons le strict minimum. Votre adresse email est la seule
      donnée personnelle que nous recevons directement. Vos données de paiement sont
      traitées exclusivement par Stripe et ne transitent jamais par nos serveurs.
    </div>

    <h2>1. Responsable du traitement</h2>
    <p>
      ILOTEL SAS, France.<br/>
      Contact RGPD : <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>
    </p>

    <h2>2. Données collectées, finalités et bases légales</h2>
    <table>
      <thead>
        <tr>
          <th>Finalité</th>
          <th>Données</th>
          <th>Base légale</th>
          <th>Durée</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Exécution de la commande</td>
          <td>Adresse email, offre achetée, référence commande</td>
          <td>Contrat (art. 6.1.b RGPD)</td>
          <td>10 ans (obligations comptables)</td>
        </tr>
        <tr>
          <td>Envoi du code d'activation</td>
          <td>Adresse email, code d'activation eSIM</td>
          <td>Contrat (art. 6.1.b)</td>
          <td>3 ans</td>
        </tr>
        <tr>
          <td>Service après-vente</td>
          <td>Adresse email, historique de commandes</td>
          <td>Intérêt légitime (art. 6.1.f)</td>
          <td>3 ans après dernière interaction</td>
        </tr>
        <tr>
          <td>Prévention de la fraude</td>
          <td>Données techniques de transaction (via Stripe)</td>
          <td>Intérêt légitime (art. 6.1.f)</td>
          <td>13 mois</td>
        </tr>
        <tr>
          <td>Obligations légales</td>
          <td>Données de facturation</td>
          <td>Obligation légale (art. 6.1.c)</td>
          <td>10 ans</td>
        </tr>
      </tbody>
    </table>
    <p>
      <strong>Nous ne collectons pas</strong> : nom, prénom, adresse postale, numéro de téléphone,
      données de localisation, données biométriques, ou tout autre identifiant personnel
      au-delà de l'adresse email.
    </p>

    <h2>3. Destinataires des données</h2>
    <ul>
      <li>
        <strong>Stripe Payments Europe, Ltd.</strong> (Irlande) — traitement exclusif
        des paiements par carte bancaire, Apple Pay et Google Pay. Stripe est certifié
        PCI-DSS niveau 1. Encadré par des Clauses Contractuelles Types pour tout transfert
        hors UE.
      </li>
      <li>
        <strong>Hébergeur API (Vercel Inc.)</strong> — traitement technique des commandes,
        serveurs en Europe.
      </li>
      <li>
        <strong>Opérateurs télécoms partenaires</strong> — uniquement les données techniques
        nécessaires à l'activation de l'eSIM (ICCID), sans données personnelles identifiantes.
      </li>
    </ul>
    <p>
      <strong>Aucune donnée n'est vendue, louée ou cédée à des tiers</strong> à des fins
      commerciales ou publicitaires.
    </p>

    <h2>4. Transferts hors Union Européenne</h2>
    <p>
      Les données traitées par Stripe peuvent être transférées hors UE dans le cadre de
      ses opérations. Ces transferts sont encadrés par des Clauses Contractuelles Types
      (CCT) approuvées par la Commission européenne (Décision 2021/914).
    </p>

    <h2>5. Sécurité</h2>
    <ul>
      <li>Chiffrement des données en transit (TLS 1.2 minimum).</li>
      <li>Aucune donnée de carte bancaire stockée sur nos serveurs (déléguée à Stripe).</li>
      <li>Accès aux données restreint aux seuls services nécessaires.</li>
      <li>Base de données hébergée en Europe.</li>
    </ul>

    <h2>6. Cookies et traceurs</h2>
    <p>
      L'application mobile ILOTEL n'utilise pas de cookies. Aucun traceur publicitaire
      ou de profilage n'est déployé. Des identifiants techniques anonymes peuvent être
      générés uniquement à des fins de stabilité de session (ex. : panier temporaire).
    </p>

    <h2>7. Vos droits RGPD</h2>
    <p>Conformément au Règlement (UE) 2016/679, vous disposez des droits suivants :</p>
    <ul>
      <li><strong>Droit d'accès</strong> (art. 15) — obtenir une copie de vos données.</li>
      <li><strong>Droit de rectification</strong> (art. 16) — corriger des données inexactes.</li>
      <li><strong>Droit à l'effacement</strong> (art. 17) — suppression sous réserve des obligations légales.</li>
      <li><strong>Droit à la limitation</strong> (art. 18) — restreindre un traitement.</li>
      <li><strong>Droit à la portabilité</strong> (art. 20) — recevoir vos données dans un format structuré.</li>
      <li><strong>Droit d'opposition</strong> (art. 21) — s'opposer aux traitements fondés sur l'intérêt légitime.</li>
    </ul>
    <p>
      Pour exercer ces droits ou soumettre une demande de suppression :
      <a href="/legal/delete">formulaire de suppression de données</a> ou
      écrivez à <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>.<br/><br/>
      Vous pouvez également déposer une réclamation auprès de la
      <a href="https://www.cnil.fr" target="_blank">CNIL</a>.
    </p>

    <h2>8. Mineurs</h2>
    <p>
      Le service ILOTEL est destiné aux personnes majeures (18 ans ou plus).
      Nous ne collectons pas sciemment de données relatives à des mineurs.
    </p>

    <h2>9. Modifications</h2>
    <p>
      Cette politique peut être mise à jour. La version en vigueur est toujours accessible
      à l'adresse <a href="https://api.ilotel.com/legal/privacy">api.ilotel.com/legal/privacy</a>.
      En cas de modification substantielle, les utilisateurs en seront informés par email.
    </p>
  `);

  return c.html(html);
});

// ─── GET /legal/delete ────────────────────────────────────────────────────────

legal.get('/delete', (c) => {
  const html = page('Demande de suppression de données', `
    <p>
      Conformément à l'article 17 du RGPD, vous pouvez demander la suppression de vos
      données personnelles. Complétez le formulaire ci-dessous — nous vous répondrons
      sous <strong>30 jours calendaires</strong>.
    </p>
    <p class="muted">
      Note : certaines données peuvent être conservées pour respecter nos obligations
      légales (ex. : données de facturation conservées 10 ans selon le Code de commerce).
    </p>

    <form method="POST" action="/legal/delete">
      <label for="email">Adresse email utilisée lors de la commande *</label>
      <input type="email" id="email" name="email" required placeholder="votre@email.com" />

      <label for="orderId">Référence de commande (optionnel)</label>
      <input type="text" id="orderId" name="orderId" placeholder="ex: a1b2c3d4-..." />

      <label for="reason">Motif de la demande (optionnel)</label>
      <textarea id="reason" name="reason" placeholder="Précisez si nécessaire…"></textarea>

      <button type="submit">Envoyer ma demande de suppression</button>
    </form>
  `);

  return c.html(html);
});

// ─── POST /legal/delete ───────────────────────────────────────────────────────

legal.post('/delete', async (c) => {
  const body = await c.req.parseBody();
  const params: LegalDeleteParams = {
    customerEmail: String(body.email ?? '').trim(),
    orderId: String(body.orderId ?? '').trim(),
    reason: String(body.reason ?? '').trim()
  }

  if (params.customerEmail || !params.customerEmail.includes('@')) {
    return c.html(page('Demande de suppression', `
      <div class="errors">
        ⚠️ Adresse email invalide. Veuillez réessayer.
      </div>
      <p><a href="/legal/delete">← Retour au formulaire</a></p>
    `), 400);
  }

  // Envoi email interne
  try {
    sendLegalDeleteEmail(params)
  } catch (err) {
  console.error('[legal/delete] Erreur envoi email:', err);
  // On confirme quand même à l'utilisateur — log en interne
  const html = page("Une erreur s'est produite", `
    <div class="errors">
      Votre demande de suppression n'a pas pu être transmise.<br/>
      Une erreur est survenue lors de l'envoi de votre demande, merci de réessayer plus tard ou de nous contacter directement.<br/>
    </div>
    <p style="margin-top:20px;">
      Contact : <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>
    </p>
  `);

  return c.html(html);
}

const html = page('Demande enregistrée', `
  <div class="success">
    ✓ Votre demande de suppression a bien été enregistrée.<br/>
    Nous la traiterons dans un délai de 30 jours calendaires et vous répondrons
    à l'adresse <strong>${params.customerEmail}</strong>.
  </div>
  <p style="margin-top:20px;">
    Pour toute question : <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>
  </p>
`);

return c.html(html);
});