/**
 * src/routes/legal/content/en/privacy.ts
 * Privacy Policy — HTML in English, GDPR compliant.
 */

const body = `
  <p class="muted">Version effective as of March 1, 2025 · Compliant with GDPR (EU) 2016/679</p>

  <div class="box">
    At ILOTEL, we collect the bare minimum. Your email address is the only personal
    data we receive directly. Your payment data is processed exclusively by Stripe
    and never passes through our servers.
  </div>

  <h2>1. Data Controller</h2>
  <p>
    ILOTEL SAS, France.<br/>
    GDPR contact: <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>
  </p>

  <h2>2. Data Collected, Purposes and Legal Bases</h2>
  <table>
    <thead>
      <tr>
        <th>Purpose</th>
        <th>Data</th>
        <th>Legal basis</th>
        <th>Retention</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Order fulfilment</td>
        <td>Email address, purchased plan, order reference</td>
        <td>Contract (Art. 6.1.b GDPR)</td>
        <td>10 years (accounting obligations)</td>
      </tr>
      <tr>
        <td>Sending activation code</td>
        <td>Email address, eSIM activation code</td>
        <td>Contract (Art. 6.1.b)</td>
        <td>3 years</td>
      </tr>
      <tr>
        <td>After-sales service</td>
        <td>Email address, order history</td>
        <td>Legitimate interest (Art. 6.1.f)</td>
        <td>3 years after last interaction</td>
      </tr>
      <tr>
        <td>Fraud prevention</td>
        <td>Technical transaction data (via Stripe)</td>
        <td>Legitimate interest (Art. 6.1.f)</td>
        <td>13 months</td>
      </tr>
      <tr>
        <td>Legal obligations</td>
        <td>Billing data</td>
        <td>Legal obligation (Art. 6.1.c)</td>
        <td>10 years</td>
      </tr>
    </tbody>
  </table>
  <p>
    <strong>We do not collect</strong>: first name, last name, postal address, phone number,
    location data, biometric data, or any other personal identifier beyond the email address.
  </p>

  <h2>3. Data Recipients</h2>
  <ul>
    <li>
      <strong>Stripe Payments Europe, Ltd.</strong> (Ireland) — exclusive processing
      of payments. PCI-DSS Level 1 certified. Governed by Standard Contractual Clauses
      for any transfer outside the EU.
    </li>
    <li>
      <strong>API host (Vercel Inc.)</strong> — technical processing of orders,
      servers in Europe.
    </li>
    <li>
      <strong>Partner telecom operators</strong> — only the technical data necessary
      for eSIM activation (ICCID), without personally identifiable data.
    </li>
  </ul>
  <p>
    <strong>No data is sold, rented or transferred to third parties</strong> for
    commercial or advertising purposes.
  </p>

  <h2>4. Transfers Outside the European Union</h2>
  <p>
    Data processed by Stripe may be transferred outside the EU as part of its operations.
    These transfers are governed by Standard Contractual Clauses (SCCs) approved by
    the European Commission (Decision 2021/914).
  </p>

  <h2>5. Security</h2>
  <ul>
    <li>Encryption of data in transit (TLS 1.2 minimum).</li>
    <li>No credit card data stored on our servers (delegated to Stripe).</li>
    <li>Data access restricted to necessary services only.</li>
    <li>Database hosted in Europe.</li>
  </ul>

  <h2>6. Cookies and Trackers</h2>
  <p>
    The ILOTEL mobile application does not use cookies. No advertising or profiling
    trackers are deployed. Anonymous technical identifiers may be generated solely
    for session stability purposes (e.g. temporary cart).
  </p>

  <h2>7. Your GDPR Rights</h2>
  <p>In accordance with Regulation (EU) 2016/679, you have the following rights:</p>
  <ul>
    <li><strong>Right of access</strong> (Art. 15) — obtain a copy of your data.</li>
    <li><strong>Right to rectification</strong> (Art. 16) — correct inaccurate data.</li>
    <li><strong>Right to erasure</strong> (Art. 17) — deletion subject to legal retention obligations.</li>
    <li><strong>Right to restriction</strong> (Art. 18) — restrict a processing activity.</li>
    <li><strong>Right to data portability</strong> (Art. 20) — receive your data in a structured format.</li>
    <li><strong>Right to object</strong> (Art. 21) — object to processing based on legitimate interest.</li>
  </ul>
  <p>
    To exercise these rights:
    <a href="/legal/delete">data deletion form</a> or
    write to <a href="mailto:dpo@ilotel.com">dpo@ilotel.com</a>.<br/><br/>
    You may also lodge a complaint with your national data protection authority
    (in France: <a href="https://www.cnil.fr" target="_blank">CNIL</a>).
  </p>

  <h2>8. Minors</h2>
  <p>
    The ILOTEL service is intended for adults (18 years or older).
    We do not knowingly collect data from minors.
  </p>

  <h2>9. Changes</h2>
  <p>
    This policy may be updated. The current version is always accessible at
    <a href="https://api.ilotel.com/legal/privacy">api.ilotel.com/legal/privacy</a>.
    In the event of a material change, users will be notified by email.
  </p>
`;

const ui = {
  title:  'Privacy Policy',
  footer: 'Last updated: March 2025',
}

export { body, ui };
