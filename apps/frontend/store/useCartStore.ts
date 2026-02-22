// store/useCartStore.ts
import { CartItem } from '@ilotel/shared';
import { create } from 'zustand';

interface CartStore {
  cart: CartItem | null;
  orderId: string | null;
  setCart: (item: CartItem) => void;
  setOrderId: (id: string) => void;
  clearCart: () => void;
}

export const useCartStore = create<CartStore>((set) => ({
  cart: null,
  orderId: null,
  setCart: (item) => set({ cart: item, orderId: null }),
  setOrderId: (id) => set({ orderId: id }),
  clearCart: () => set({ cart: null, orderId: null }),
}));