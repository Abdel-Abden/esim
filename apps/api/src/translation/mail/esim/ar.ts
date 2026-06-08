import { getCountryName } from '@ilotel/shared';
import type { EsimEmailContent } from './index.js';

export const content: EsimEmailContent = {
  subject:         (p) => `شريحة eSIM الخاصة بك ${p.flag} ${getCountryName(p.code, p.lang)} جاهزة — ${p.dataGb} جيجابايت / ${p.durationDays} أيام`,
  dateLocale:      'ar-SA',
  heroTitle:       'شريحة eSIM الخاصة بك جاهزة! 🎉',
  days:            'أيام',
  summaryLabel:    '📋 ملخص الطلب',
  activationLabel: '🔑 رمز التفعيل',
  orManual:        'أو الإدخال اليدوي',
  rows: {
    destination: 'الوجهة',
    plan:        'الباقة',
    price:       'السعر المدفوع',
    iccid:       'ICCID',
    reference:   'المرجع',
    date:        'التاريخ',
  },
  steps: {
    ios: {
      title: 'التفعيل على iPhone (iOS)',
      steps: [
        { n: '1', text: 'الإعدادات' },
        { n: '2', text: 'البيانات الخلوية ← إضافة باقة بيانات' },
        { n: '3', text: 'إدخال المعلومات يدوياً' },
        { n: '4', text: 'الصق رمز التفعيل أعلاه' },
      ],
    },
    android: {
      title: 'التفعيل على Android',
      steps: [
        { n: '1', text: 'الشبكة والإنترنت (أو الاتصالات)' },
        { n: '2', text: 'SIM ← إضافة SIM أو eSIM' },
        { n: '3', text: 'إدخال رمز التفعيل' },
        { n: '4', text: 'الصق رمز التفعيل أعلاه' },
      ],
    },
  },
  footerHelp: 'هل تحتاج إلى مساعدة؟ تواصل معنا على ',
  rights:     'جميع الحقوق محفوظة',
};
