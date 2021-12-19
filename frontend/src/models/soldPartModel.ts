export interface SoldPartModel {
  id: number;
  price: number;
  quantity: number;
  sum: number;
  orderId: number;
  partId: number;
  createdDate: string;
  updatedDate: string;
  daysOfGuarantee: number;
  isActive: boolean;
}
