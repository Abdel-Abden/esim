/**
 * src/routes/legal/content/en/mentions.ts
 * Legal Notices — HTML in English.
 */

const body = `
  <p class="muted">Version effective as of March 1, 2025</p>

  <h2>Service Publisher</h2>
  <p>
    <strong>ILOTEL SAS</strong><br/>
    Simplified joint-stock company with share capital of [X] €<br/>
    Registered under number [RCS]<br/>
    Registered office: [Full address], France<br/>
    Intra-community VAT number: FR[XXXXXXXX]<br/><br/>
    Publication director: [Director name]<br/>
    Contact: <a href="mailto:support@ilotel.com">support@ilotel.com</a>
  </p>

  <h2>Hosting</h2>
  <p>
    The API and backend services are hosted by:<br/>
    <strong>Vercel Inc.</strong>, 340 Pine Street Suite 701, San Francisco, CA 94104, USA.<br/>
    Data is processed on servers located in Europe (Frankfurt region).<br/>
    Transfers to Vercel servers outside the EU are governed by Standard Contractual Clauses.
  </p>

  <h2>Regulated Activity</h2>
  <p>
    ILOTEL acts as a reseller of electronic communications services (mobile data roaming).
    ILOTEL may be subject to declaration obligations with the relevant regulatory authorities.
  </p>

  <h2>Intellectual Property</h2>
  <p>
    All elements of the ILOTEL service — logo, brand, source code, texts, illustrations —
    are protected by intellectual property law.<br/><br/>
    Any reproduction or exploitation without prior written authorisation from ILOTEL
    is strictly prohibited and constitutes an infringement punishable under applicable
    intellectual property law.
  </p>

  <h2>Hyperlinks</h2>
  <p>
    The service may contain links to third-party websites. ILOTEL exercises no control
    over these sites and cannot be held responsible for their content or any damages
    resulting from their use.
  </p>

  <h2>Limitation of Liability</h2>
  <p>ILOTEL shall not be held liable for:</p>
  <ul>
    <li>Service interruptions or unavailability for any reason whatsoever.</li>
    <li>Direct or indirect damages resulting from use of the service.</li>
    <li>Network quality or coverage provided by partner operators.</li>
    <li>Temporary unavailability due to maintenance operations.</li>
  </ul>

  <h2>Applicable Law and Jurisdiction</h2>
  <p>
    These legal notices are governed by French law. In the event of an unresolved dispute,
    French courts shall have sole jurisdiction, subject to mandatory provisions applicable
    to consumers residing in another EU Member State (Regulation EC 593/2008 — Rome I).
  </p>

  <h2>Consumer Mediation</h2>
  <p>
    In accordance with applicable regulations, any consumer may resort free of charge
    to a mediator to resolve a dispute amicably.<br/><br/>
    European Online Dispute Resolution platform:<br/>
    <a href="https://ec.europa.eu/consumers/odr" target="_blank">ec.europa.eu/consumers/odr</a>
  </p>
`;

const ui = {
  title:  'Legal Notices',
  footer: 'Last updated: March 2025',
}

export { body, ui };
