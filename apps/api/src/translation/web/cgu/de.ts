/**
 * src/routes/legal/content/de/cgu.ts
 * Allgemeine Geschäftsbedingungen — HTML auf Deutsch.
 */

const body = `
  <p class="muted">Gültig ab 1. März 2025</p>

  <div class="box">
    ILOTEL vertreibt vorausbezahlte eSIMs, die über eine iOS- und Android-App
    Zugang zu internationalen Datentarifen ermöglichen.
    Jede Bestellung setzt die vollständige und vorbehaltlose Zustimmung zu diesen AGB voraus.
  </div>

  <h2>Artikel 1 — Anbieter</h2>
  <p>
    Der Dienst ILOTEL wird betrieben von der ILOTEL SAS, Frankreich.<br/>
    Kontakt: <a href="mailto:support@ilotel.com">support@ilotel.com</a>
  </p>

  <h2>Artikel 2 — Vertragsgegenstand</h2>
  <p>
    Diese AGB regeln den Verkauf von eSIM-Karten (Embedded SIM) und mobilen Datentarifen,
    die über die ILOTEL-App angeboten werden. Jeder Tarif ist gekennzeichnet durch
    ein Datenvolumen (GB), eine Gültigkeitsdauer (Tage) und einen geografischen Geltungsbereich.
  </p>

  <h2>Artikel 3 — Preise</h2>
  <p>
    Alle Preise werden in Euro (€) inklusive aller Steuern angezeigt. ILOTEL behält sich
    das Recht vor, Preise jederzeit zu ändern, verpflichtet sich jedoch, zum zum Zeitpunkt
    der Bestellbestätigung angezeigten Preis abzurechnen. Sonderangebote können zeitlich
    begrenzt und von der Verfügbarkeit abhängig sein.
  </p>

  <h2>Artikel 4 — Bestellvorgang</h2>
  <ol>
    <li>Auswahl des Reiseziels und des gewünschten Tarifs in der App.</li>
    <li>Eingabe der Bestätigungs-E-Mail-Adresse.</li>
    <li>Zustimmung zu diesen AGB.</li>
    <li>Sichere Zahlung über Stripe.</li>
    <li>Erhalt des eSIM-Aktivierungscodes per E-Mail.</li>
  </ol>
  <p>
    Die Bestellung wird nach Zahlungseingang bei Stripe bestätigt.
    Eine E-Mail mit dem Aktivierungscode wird unverzüglich versandt.
  </p>

  <h2>Artikel 5 — Zahlung</h2>
  <p>
    Die Zahlung erfolgt per Kredit- oder Debitkarte (Visa, Mastercard, American Express),
    Apple Pay oder Google Pay über die sichere Zahlungslösung
    <strong>Stripe Payments Europe, Ltd.</strong> (Irland).<br/><br/>
    Bankdaten werden verschlüsselt übertragen (TLS) und niemals auf den Servern von
    ILOTEL gespeichert. ILOTEL behält sich vor, Bestellungen mit eindeutigem Betrugsverdacht
    abzulehnen.
  </p>

  <h2>Artikel 6 — Lieferung und Aktivierung</h2>
  <p>
    Die eSIM ist ein digitaler Inhalt, der unmittelbar nach Zahlungsbestätigung geliefert wird.
    Der Kunde erhält per E-Mail einen Aktivierungscode, der manuell in den Netzwerkeinstellungen
    des Geräts eingegeben werden muss.<br/><br/>
    Die Aktivierung setzt ein eSIM-kompatibles und netzseitig entsperrtes Gerät voraus.
    Der Kunde ist verantwortlich, die Kompatibilität vor dem Kauf zu prüfen.
    ILOTEL haftet nicht für Probleme beim E-Mail-Empfang (Spam-Filter, volles Postfach usw.).
  </p>

  <h2>Artikel 7 — Widerrufsrecht</h2>
  <p>
    Gemäß den geltenden Verbraucherschutzvorschriften gilt das Widerrufsrecht
    <strong>nicht</strong> für digitale Inhalte, deren Bereitstellung mit ausdrücklicher
    Zustimmung des Verbrauchers begonnen hat.<br/><br/>
    Mit Bestätigung der Bestellung erkennt der Kunde an, dass die Bereitstellung der
    eSIM unmittelbar nach der Zahlung beginnt, und verzichtet ausdrücklich auf sein
    14-tägiges Widerrufsrecht.
  </p>

  <h2>Artikel 8 — Reklamationen</h2>
  <p>
    Für Reklamationen wenden Sie sich bitte mit Ihrer E-Mail-Adresse und/oder Bestellreferenz
    an <a href="mailto:support@ilotel.com">support@ilotel.com</a>.
    ILOTEL verpflichtet sich, den Eingang innerhalb von 48 Stunden zu bestätigen und
    innerhalb von 10 Werktagen zu antworten.<br/><br/>
    Bei einem ILOTEL zuzurechnenden technischen Fehler wird eine Rückerstattung oder
    ein Austausch angeboten.
  </p>

  <h2>Artikel 9 — Personenbezogene Daten</h2>
  <p>
    ILOTEL erhebt ausschließlich die E-Mail-Adresse des Kunden zur Übermittlung des
    Aktivierungscodes und für den Kundendienst. Zahlungsdaten werden ausschließlich
    von Stripe verarbeitet.<br/><br/>
    Einzelheiten zur Datenverarbeitung und zur Ausübung Ihrer Rechte finden Sie in der
    <a href="/legal/privacy">Datenschutzerklärung</a>.
  </p>

  <h2>Artikel 10 — Dienstqualität</h2>
  <p>
    Die Netzqualität (Geschwindigkeit, Abdeckung) hängt von den lokalen Partnerbetreibern ab
    und kann in Gebieten mit geringer Netzabdeckung nicht garantiert werden.
    ILOTEL handelt als Wiederverkäufer von Daten-Roaming-Diensten.
  </p>

  <h2>Artikel 11 — Schlichtung und Streitigkeiten</h2>
  <p>
    Bei nicht gütlich beilegbaren Streitigkeiten können Verbraucher kostenlos die europäische
    Online-Streitbeilegungsplattform nutzen:
    <a href="https://ec.europa.eu/consumers/odr" target="_blank">ec.europa.eu/consumers/odr</a>.<br/><br/>
    Diese AGB unterliegen französischem Recht.
  </p>
`;

const ui = {
  title:  'Allgemeine Geschäftsbedingungen',
  footer: 'Letzte Aktualisierung: März 2025',
}

export { body, ui };
