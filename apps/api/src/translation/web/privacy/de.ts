/**
 * src/routes/legal/content/de/privacy.ts
 * Datenschutzerklärung — HTML auf Deutsch, DSGVO-konform.
 */

const body = `
  <p class="muted">Gültig ab 1. März 2025 · Konform mit der DSGVO (EU) 2016/679</p>

  <div class="box">
    Bei ILOTEL erheben wir nur das absolute Minimum. Ihre E-Mail-Adresse ist die einzige
    personenbezogene Daten, die wir direkt erhalten. Ihre Zahlungsdaten werden
    ausschließlich von Stripe verarbeitet und gelangen nie auf unsere Server.
  </div>

  <h2>1. Verantwortlicher</h2>
  <p>
    ILOTEL SAS, Frankreich.<br/>
    Datenschutzkontakt: <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>
  </p>

  <h2>2. Erhobene Daten, Zwecke und Rechtsgrundlagen</h2>
  <table>
    <thead>
      <tr>
        <th>Zweck</th>
        <th>Daten</th>
        <th>Rechtsgrundlage</th>
        <th>Speicherdauer</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Auftragsabwicklung</td>
        <td>E-Mail, gekaufter Tarif, Bestellreferenz</td>
        <td>Vertrag (Art. 6 Abs. 1 lit. b DSGVO)</td>
        <td>10 Jahre (Buchführungspflicht)</td>
      </tr>
      <tr>
        <td>Versand des Aktivierungscodes</td>
        <td>E-Mail, eSIM-Aktivierungscode</td>
        <td>Vertrag (Art. 6 Abs. 1 lit. b)</td>
        <td>3 Jahre</td>
      </tr>
      <tr>
        <td>Kundendienst</td>
        <td>E-Mail, Bestellhistorie</td>
        <td>Berechtigtes Interesse (Art. 6 Abs. 1 lit. f)</td>
        <td>3 Jahre nach letztem Kontakt</td>
      </tr>
      <tr>
        <td>Betrugsprävention</td>
        <td>Technische Transaktionsdaten (via Stripe)</td>
        <td>Berechtigtes Interesse (Art. 6 Abs. 1 lit. f)</td>
        <td>13 Monate</td>
      </tr>
      <tr>
        <td>Gesetzliche Pflichten</td>
        <td>Rechnungsdaten</td>
        <td>Rechtliche Verpflichtung (Art. 6 Abs. 1 lit. c)</td>
        <td>10 Jahre</td>
      </tr>
    </tbody>
  </table>
  <p>
    <strong>Nicht erhoben werden</strong>: Name, Vorname, Postanschrift, Telefonnummer,
    Standortdaten, biometrische Daten oder sonstige persönliche Identifikatoren
    über die E-Mail-Adresse hinaus.
  </p>

  <h2>3. Empfänger der Daten</h2>
  <ul>
    <li>
      <strong>Stripe Payments Europe, Ltd.</strong> (Irland) — ausschließliche Verarbeitung
      von Zahlungen. PCI-DSS Level 1 zertifiziert. Für Übermittlungen außerhalb der EU
      durch Standardvertragsklauseln abgesichert.
    </li>
    <li>
      <strong>API-Hosting (Vercel Inc.)</strong> — technische Verarbeitung von Bestellungen,
      Server in Europa.
    </li>
    <li>
      <strong>Partner-Telekomunternehmen</strong> — ausschließlich technisch notwendige
      Daten zur eSIM-Aktivierung (ICCID), ohne persönlich identifizierbare Daten.
    </li>
  </ul>
  <p>
    <strong>Keine Daten werden verkauft, vermietet oder für kommerzielle oder
    Werbezwecke an Dritte weitergegeben.</strong>
  </p>

  <h2>4. Übermittlungen außerhalb der EU</h2>
  <p>
    Von Stripe verarbeitete Daten können im Rahmen seiner Geschäftstätigkeit außerhalb
    der EU übermittelt werden. Diese Übermittlungen sind durch von der Europäischen
    Kommission genehmigte Standardvertragsklauseln (SCC) abgesichert (Beschluss 2021/914).
  </p>

  <h2>5. Datensicherheit</h2>
  <ul>
    <li>Verschlüsselung der Daten bei der Übertragung (mindestens TLS 1.2).</li>
    <li>Keine Kreditkartendaten auf unseren Servern gespeichert (delegiert an Stripe).</li>
    <li>Datenzugriff auf notwendige Dienste beschränkt.</li>
    <li>Datenbank in Europa gehostet.</li>
  </ul>

  <h2>6. Cookies und Tracker</h2>
  <p>
    Die ILOTEL-App verwendet keine Cookies. Es werden keine Werbe- oder
    Profiling-Tracker eingesetzt. Anonyme technische Kennungen können ausschließlich
    für die Sitzungsstabilität generiert werden (z.B. temporärer Warenkorb).
  </p>

  <h2>7. Ihre Rechte gemäß DSGVO</h2>
  <p>Gemäß der Verordnung (EU) 2016/679 stehen Ihnen folgende Rechte zu:</p>
  <ul>
    <li><strong>Auskunftsrecht</strong> (Art. 15) — Erhalt einer Kopie Ihrer Daten.</li>
    <li><strong>Berichtigungsrecht</strong> (Art. 16) — Korrektur unrichtiger Daten.</li>
    <li><strong>Löschungsrecht</strong> (Art. 17) — Löschung vorbehaltlich gesetzlicher Aufbewahrungspflichten.</li>
    <li><strong>Einschränkungsrecht</strong> (Art. 18) — Einschränkung einer Verarbeitung.</li>
    <li><strong>Datenübertragbarkeit</strong> (Art. 20) — Erhalt Ihrer Daten in einem strukturierten Format.</li>
    <li><strong>Widerspruchsrecht</strong> (Art. 21) — Widerspruch gegen auf berechtigtem Interesse basierende Verarbeitungen.</li>
  </ul>
  <p>
    Zur Ausübung dieser Rechte:
    <a href="/legal/delete">Löschformular</a> oder
    schreiben Sie an <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>.<br/><br/>
    Sie können auch eine Beschwerde bei der zuständigen Datenschutzbehörde einreichen
    (in Frankreich: <a href="https://www.cnil.fr" target="_blank">CNIL</a>).
  </p>

  <h2>8. Minderjährige</h2>
  <p>
    Der ILOTEL-Dienst richtet sich an Volljährige (ab 18 Jahren).
    Wir erheben wissentlich keine Daten von Minderjährigen.
  </p>

  <h2>9. Änderungen</h2>
  <p>
    Diese Erklärung kann aktualisiert werden. Die jeweils gültige Fassung ist stets
    abrufbar unter
    <a href="https://api.ilotel.com/legal/privacy">api.ilotel.com/legal/privacy</a>.
    Bei wesentlichen Änderungen werden Nutzer per E-Mail informiert.
  </p>
`;

const ui = {
  title:  'Datenschutzerklärung',
  footer: 'Letzte Aktualisierung: März 2025',
}

export { body, ui };
