import { CartItem, ESim } from '@/types';
import { create } from 'zustand';

interface CartStore {
  cart: CartItem | null;
  esim: ESim | null;
  setCart: (item: CartItem) => void;
  setEsim: (esim: ESim) => void;
  clearCart: () => void;
}

export const useCartStore = create<CartStore>((set) => ({
  cart: null,
  esim: null,

  setCart: (item) => set({ cart: item }),

  setEsim: (esim) => set({ esim }),

  clearCart: () => set({ cart: null }),
}));
