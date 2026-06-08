/**
 * src/routes/legal/content/en/cgu.ts
 * Terms and Conditions — HTML in English.
 */

const body = `
  <p class="muted">Version effective as of March 1, 2025</p>

  <div class="box">
    ILOTEL sells prepaid eSIMs providing access to international mobile data plans
    via an iOS and Android mobile application.
    Any order implies full and unconditional acceptance of these Terms and Conditions.
  </div>

  <h2>Article 1 — Seller Identification</h2>
  <p>
    The ILOTEL service is operated by ILOTEL SAS, France.<br/>
    Contact: <a href="mailto:support@ilotel.com">support@ilotel.com</a>
  </p>

  <h2>Article 2 — Subject</h2>
  <p>
    These T&amp;Cs govern the sale of eSIM cards (Embedded SIM) and mobile data plans
    offered through the ILOTEL mobile application. Each plan is characterised by
    a data volume (GB), a validity period (days) and a geographic coverage area.
  </p>

  <h2>Article 3 — Pricing</h2>
  <p>
    Prices are displayed in euros (€) inclusive of all taxes. ILOTEL reserves the right
    to change prices at any time, but commits to billing at the price displayed at the
    time the order is confirmed. Promotional offers may be available for a limited
    time and subject to stock availability.
  </p>

  <h2>Article 4 — Order Process</h2>
  <ol>
    <li>Select the destination and desired plan in the app.</li>
    <li>Enter your confirmation email address.</li>
    <li>Accept these Terms and Conditions.</li>
    <li>Secure payment via Stripe.</li>
    <li>Receive the eSIM activation code by email.</li>
  </ol>
  <p>
    The order is confirmed upon receipt of payment by Stripe.
    An email containing the activation code is sent immediately.
  </p>

  <h2>Article 5 — Payment</h2>
  <p>
    Payment is made by credit or debit card (Visa, Mastercard, American Express),
    Apple Pay or Google Pay, via the secure solution
    <strong>Stripe Payments Europe, Ltd.</strong> (Ireland).<br/><br/>
    Banking details are encrypted (TLS) and are never stored on ILOTEL's servers.
    ILOTEL reserves the right to refuse any order presenting a clear fraud risk.
  </p>

  <h2>Article 6 — Delivery and Activation</h2>
  <p>
    The eSIM is digital content delivered immediately after payment confirmation.
    The customer receives an activation code by email to be entered manually in the
    network settings of their device.<br/><br/>
    Activation requires a compatible and carrier-unlocked eSIM device.
    It is the customer's responsibility to verify compatibility before purchasing.
    ILOTEL cannot be held responsible for email delivery issues
    (spam filter, full inbox, etc.).
  </p>

  <h2>Article 7 — Right of Withdrawal</h2>
  <p>
    In accordance with applicable consumer protection law, the right of withdrawal
    <strong>does not apply</strong> to digital content whose execution has begun
    with the consumer's express consent.<br/><br/>
    By confirming the order, the customer acknowledges that the supply of the eSIM
    begins immediately after payment and expressly waives the 14-day right of withdrawal.
  </p>

  <h2>Article 8 — Claims</h2>
  <p>
    For any claim, contact <a href="mailto:support@ilotel.com">support@ilotel.com</a>
    with your email address and/or order reference. ILOTEL commits to acknowledging
    receipt within 48 hours and responding within 10 business days.<br/><br/>
    In the event of a technical malfunction attributable to ILOTEL, a refund or
    exchange will be offered.
  </p>

  <h2>Article 9 — Personal Data</h2>
  <p>
    ILOTEL only collects the customer's email address, used for delivering the
    activation code and providing after-sales service. No other personal data is
    collected directly by ILOTEL. Payment data is processed exclusively by Stripe.<br/><br/>
    See the <a href="/legal/privacy">Privacy Policy</a> for details on data processing
    and how to exercise your rights.
  </p>

  <h2>Article 10 — Service Quality</h2>
  <p>
    Network quality (speed, coverage) depends on local partner operators and cannot
    be guaranteed in areas with low coverage. ILOTEL acts as a reseller of data
    roaming services.
  </p>

  <h2>Article 11 — Mediation and Disputes</h2>
  <p>
    In the event of an unresolved dispute, consumers may use the European Online
    Dispute Resolution platform free of charge:
    <a href="https://ec.europa.eu/consumers/odr" target="_blank">ec.europa.eu/consumers/odr</a>.<br/><br/>
    These T&amp;Cs are governed by French law.
  </p>
`;

const ui = {
  title:  'Terms and Conditions',
  footer: 'Last updated: March 2025',
}

export { body, ui };
