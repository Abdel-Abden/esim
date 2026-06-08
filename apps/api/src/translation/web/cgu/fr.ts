/**
 * src/routes/legal/content/fr/cgu.ts
 * Conditions Générales de Vente — HTML en français.
 */

const body = `
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
    en indiquant votre email et/ou la référence de votre commande. ILOTEL s'engage à accuser
    réception sous 48h et à répondre sous 10 jours ouvrés.<br/><br/>
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
`;

const ui = {
  title:  'Conditions Générales de Vente',
  footer: 'Dernière mise à jour : mars 2025',
}

export { body, ui };
