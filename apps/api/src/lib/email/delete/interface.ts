/**
 * src/translation/content/mail/delete/index.ts
 * Résolution du contenu email suppression RGPD par langue.
 */

export interface DeleteEmailContent {
  subject:     string;
  notProvided: string;
  fields: {
    email:   string;
    order:   string;
    reason:  string;
    date:    string;
  };
}