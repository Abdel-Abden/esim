/**
 * src/routes/legal/content/fr/ui.ts
 *
 * Chaînes d'interface en français : titres, labels, messages d'erreur/succès.
 * Séparé du contenu légal pour pouvoir être mis à jour indépendamment.
 */

export const ui = {
  cgu: {
    title:  'Conditions Générales de Vente',
    footer: 'Dernière mise à jour : mars 2025',
  },
  privacy: {
    title:  'Politique de confidentialité',
    footer: 'Dernière mise à jour : mars 2025',
  },
  mentions: {
    title:  'Mentions légales',
    footer: 'Dernière mise à jour : mars 2025',
  },
  delete: {
    title:            'Demande de suppression de données',
    footer:           'Dernière mise à jour : mars 2025',
    intro:            "Conformément à l'article 17 du RGPD, vous pouvez demander la suppression de vos données personnelles. Complétez le formulaire ci-dessous — nous vous répondrons sous <strong>30 jours calendaires</strong>.",
    note:             "Note : certaines données peuvent être conservées pour respecter nos obligations légales (ex. : données de facturation conservées 10 ans selon le Code de commerce).",
    labelEmail:       'Adresse email utilisée lors de la commande *',
    placeholderEmail: 'votre@email.com',
    labelOrder:       'Référence de commande (optionnel)',
    placeholderOrder: 'ex: a1b2c3d4-...',
    labelReason:      'Motif de la demande (optionnel)',
    placeholderReason:'Précisez si nécessaire…',
    submit:           'Envoyer ma demande de suppression',
    // Erreurs
    errorEmailTitle:  'Adresse email invalide',
    errorEmail:       '⚠️ Adresse email invalide. Veuillez réessayer.',
    backLink:         '← Retour au formulaire',
    errorTitle:       "Une erreur s'est produite",
    errorBody:        "Votre demande n'a pas pu être transmise. Merci de réessayer plus tard ou de nous contacter directement.",
    // Succès
    successTitle:     'Demande enregistrée',
    successBody:      '✓ Votre demande de suppression a bien été enregistrée.<br/>Nous la traiterons dans un délai de 30 jours calendaires et vous répondrons à l\'adresse <strong>{email}</strong>.',
    contact:          'Pour toute question :',
  },
} as const;

export type UiStrings = typeof ui;
