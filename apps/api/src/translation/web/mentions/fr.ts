/**
 * src/routes/legal/content/fr/mentions.ts
 * Mentions légales — HTML en français.
 */

const body = `
  <p class="muted">Version en vigueur au 1er mars 2025</p>

  <h2>Éditeur du service</h2>
  <p>
    <strong>ILOTEL SAS</strong><br/>
    Société par actions simplifiée au capital de [X] €<br/>
    Immatriculée au RCS sous le numéro [RCS]<br/>
    Siège social : [Adresse complète], France<br/>
    Numéro de TVA intracommunautaire : FR[XXXXXXXX]<br/><br/>
    Directeur de la publication : [Nom du dirigeant]<br/>
    Contact : <a href="mailto:support@ilotel.com">support@ilotel.com</a>
  </p>

  <h2>Hébergement</h2>
  <p>
    L'API et les services backend sont hébergés par :<br/>
    <strong>Vercel Inc.</strong>, 340 Pine Street Suite 701, San Francisco, CA 94104, USA.<br/>
    Les données sont traitées sur des serveurs situés en Europe (région Frankfurt).<br/>
    Les transferts vers les serveurs Vercel hors UE sont encadrés par des Clauses Contractuelles Types.
  </p>

  <h2>Activité réglementée</h2>
  <p>
    ILOTEL agit en qualité de revendeur de services de communications électroniques
    (données mobiles en itinérance) au sens du Code des postes et des communications
    électroniques (CPCE). ILOTEL peut être soumise à des obligations de déclaration
    auprès de l'ARCEP.
  </p>

  <h2>Propriété intellectuelle</h2>
  <p>
    L'ensemble des éléments du service ILOTEL — logo, marque, code source, textes,
    illustrations — est protégé par le droit de la propriété intellectuelle.<br/><br/>
    Toute reproduction ou exploitation sans autorisation écrite préalable d'ILOTEL
    est strictement interdite et constituerait une contrefaçon sanctionnée par les
    articles L335-2 et suivants du Code de la propriété intellectuelle.
  </p>

  <h2>Liens hypertextes</h2>
  <p>
    Le service peut contenir des liens vers des sites tiers. ILOTEL n'exerce aucun
    contrôle sur ces sites et ne saurait être tenu responsable de leur contenu ou
    des dommages pouvant résulter de leur utilisation.
  </p>

  <h2>Limitation de responsabilité</h2>
  <p>ILOTEL ne saurait être tenu responsable :</p>
  <ul>
    <li>Des interruptions ou indisponibilités du service pour quelque cause que ce soit.</li>
    <li>Des dommages directs ou indirects résultant de l'utilisation du service.</li>
    <li>De la qualité du réseau ou de la couverture fournie par les opérateurs partenaires.</li>
    <li>D'une impossibilité temporaire d'accès liée à des opérations de maintenance.</li>
  </ul>

  <h2>Droit applicable et juridiction</h2>
  <p>
    Les présentes mentions légales sont régies par le droit français. En cas de litige
    non résolu à l'amiable, les tribunaux français seront seuls compétents, sous réserve
    des dispositions impératives applicables aux consommateurs résidant dans un autre
    État membre de l'Union Européenne (Règlement CE 593/2008 — Rome I).
  </p>

  <h2>Médiation de la consommation</h2>
  <p>
    Conformément aux articles L611-1 et suivants du Code de la consommation, tout
    consommateur peut recourir gratuitement à un médiateur pour résoudre un litige
    à l'amiable.<br/><br/>
    Plateforme européenne de règlement en ligne des litiges :<br/>
    <a href="https://ec.europa.eu/consumers/odr" target="_blank">ec.europa.eu/consumers/odr</a>
  </p>
`;

const ui = {
  title:  'Mentions légales',
  footer: 'Dernière mise à jour : mars 2025',
}

export { body, ui };
