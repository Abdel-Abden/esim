/**
 * Entité Order — table `orders`
 */

export const OrderStatus = {
  PENDING: 'pending',
  PAID: 'paid',
  FAILED: 'failed',
  PROVISIONED: 'provisioned',
  REFUNDING: 'refunding',
  REFUNDED: 'refunded'
} as const;

export type OrderStatus =
  typeof OrderStatus[keyof typeof OrderStatus];

export interface OrderEntity {
  id: string;
  email: string;
  lang: string;
  offerId: string;
  status: OrderStatus;
  stripePaymentIntentId: string;
  finalPrice: number;
  createdAt: string;
}
