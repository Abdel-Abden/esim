/**
 * src/translation/template/mail/delete/html.ts
 *
 * Email interne de notification de demande de suppression RGPD.
 * Email simple texte — pas de HTML complexe, destiné à l'équipe DPO.
 */

import { BRAND } from '../../../constants/env.js';
import type { LegalDeleteParams } from '../index.js';
import type { DeleteEmailContent } from './interface.js';

export function buildDeleteText(params: LegalDeleteParams, content: DeleteEmailContent): string {
  return [
    content.fields.email.replace('{value}',     params.customerEmail),
    content.fields.order.replace('{value}',     params.orderId  || content.notProvided),
    content.fields.reason.replace('{value}',    params.reason   || content.notProvided),
    content.fields.date.replace('{value}',      new Date().toISOString()),
    '',
    `-- ${BRAND.name}`,
  ].join('\n');
}

export function buildDeleteSubject(params: LegalDeleteParams): string {
  return `[RGPD] Demande de suppression — ${params.customerEmail}`;
}
