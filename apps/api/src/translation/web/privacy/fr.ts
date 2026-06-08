/**
 * src/routes/legal/content/fr/privacy.ts
 * Politique de confidentialité — HTML en français, conforme au RGPD.
 */

const body = `
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
      des paiements. Certifié PCI-DSS niveau 1. Encadré par des Clauses Contractuelles
      Types pour tout transfert hors UE.
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
    Pour exercer ces droits :
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
`;

const ui = {
  title:  'Politique de confidentialité',
  footer: 'Dernière mise à jour : mars 2025',
}

export { body, ui };
