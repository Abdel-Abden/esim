/**
 * src/routes/legal/content/en/ui.ts
 * Interface strings in English.
 */

export const ui = {
  cgu: {
    title:  'Terms and Conditions',
    footer: 'Last updated: March 2025',
  },
  privacy: {
    title:  'Privacy Policy',
    footer: 'Last updated: March 2025',
  },
  mentions: {
    title:  'Legal Notices',
    footer: 'Last updated: March 2025',
  },
  delete: {
    title:            'Data Deletion Request',
    footer:           'Last updated: March 2025',
    intro:            'In accordance with Article 17 of the GDPR, you may request the deletion of your personal data. Complete the form below — we will respond within <strong>30 calendar days</strong>.',
    note:             'Note: some data may be retained to comply with our legal obligations (e.g. billing data retained for 10 years under applicable law).',
    labelEmail:       'Email address used for your order *',
    placeholderEmail: 'your@email.com',
    labelOrder:       'Order reference (optional)',
    placeholderOrder: 'e.g. a1b2c3d4-...',
    labelReason:      'Reason for request (optional)',
    placeholderReason:'Please specify if needed…',
    submit:           'Send my deletion request',
    // Errors
    errorEmailTitle:  'Invalid email address',
    errorEmail:       '⚠️ Invalid email address. Please try again.',
    backLink:         '← Back to the form',
    errorTitle:       'An error occurred',
    errorBody:        'Your request could not be submitted. Please try again later or contact us directly.',
    // Success
    successTitle:     'Request received',
    successBody:      '✓ Your deletion request has been received.<br/>We will process it within 30 calendar days and reply to <strong>{email}</strong>.',
    contact:          'For any question:',
  },
} as const;

export type UiStrings = typeof ui;
