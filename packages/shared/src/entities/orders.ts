/**
 * Entité Order — table `orders`
 */

export type OrderStatus = 'pending' | 'paid' | 'failed' | 'provisioned';

export interface Order {
  id: string;
  email: string;
  lang: string;
  offerId: string;
  status: OrderStatus;
  stripePaymentIntentId: string;
  finalPrice: number;
  discountId: string | null;
  createdAt: string;
}
