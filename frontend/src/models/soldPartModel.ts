export interface SoldPartModel {
  id: number;
  price: number;
  quantity: number;
  sum: number;
  orderId: number;
  partId: number;
  createdDate: string;
  updatedDate: string;
  monthsOfGuarantee: number;
  isActive: boolean;
}
