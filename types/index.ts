export interface Offer {
  id: string;
  data: string;   // ex: "5Go"
  duration: string; // ex: "7j"
  price: number;
  isPromo?: boolean;
}

export interface Country {
  id: string;
  flag: string;
  name: string;
  offers: Offer[];
  isPromo?: boolean;
}

export interface CartItem {
  country: string;
  flag: string;
  offer: string;   // ex: "5Go / 7j"
  price: number;
}

export interface ESim {
  country: string;
  flag: string;
  offer: string;
  price: number;
  iccid: string;
  activatedAt: string;
}
