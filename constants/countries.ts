import { Country } from '@/types';

export const COUNTRIES: Country[] = [
  {
    id: 'monde',
    flag: '🌍',
    name: 'Monde',
    isPromo: false,
    offers: [
      { id: 'monde-5', data: '5Go', duration: '7j', price: 9.99 },
      { id: 'monde-20', data: '20Go', duration: '15j', price: 15.99, isPromo: true },
      { id: 'monde-30', data: '30Go', duration: '30j', price: 24.99 },
    ],
  },
  {
    id: 'france',
    flag: '🇫🇷',
    name: 'France',
    isPromo: true,
    offers: [
      { id: 'fr-5', data: '5Go', duration: '7j', price: 9.99 },
      { id: 'fr-20', data: '20Go', duration: '15j', price: 15.99, isPromo: true },
      { id: 'fr-30', data: '30Go', duration: '30j', price: 24.99 },
    ],
  },
  {
    id: 'japon',
    flag: '🇯🇵',
    name: 'Japon',
    isPromo: false,
    offers: [
      { id: 'jp-5', data: '5Go', duration: '7j', price: 12.99 },
      { id: 'jp-20', data: '20Go', duration: '15j', price: 21.99 },
    ],
  },
  {
    id: 'espagne',
    flag: '🇪🇸',
    name: 'Espagne',
    isPromo: false,
    offers: [
      { id: 'es-5', data: '5Go', duration: '7j', price: 9.99 },
      { id: 'es-20', data: '20Go', duration: '15j', price: 16.99 },
      { id: 'es-30', data: '30Go', duration: '30j', price: 26.99 },
    ],
  },
  {
    id: 'usa',
    flag: '🇺🇸',
    name: 'États-Unis',
    isPromo: false,
    offers: [
      { id: 'us-5', data: '5Go', duration: '7j', price: 14.99 },
      { id: 'us-20', data: '20Go', duration: '15j', price: 24.99 },
      { id: 'us-30', data: '30Go', duration: '30j', price: 34.99 },
    ],
  },
];
