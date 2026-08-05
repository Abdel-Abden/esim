export type EsimStatus = 'available' | 'reserved' | 'assigned' | 'disabled' | 'retired'

export interface EsimEntity {
    id: string;
    iccid: string;
    msisdn: string;
    activationCode: string;
    reservedAt: string | null;
    soldAt: string | null;
    status: EsimStatus;
}

export interface EsimHistoryEntity {
    id: string;
    esimId: string | null;
    offerId: string | null;
    orderId: string | null;
    createdAt: string;
}