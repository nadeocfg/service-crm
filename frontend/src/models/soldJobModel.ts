export interface SoldJobModel {
  id: number;
  jobTypeId: number;
  price: number;
  quantity: number;
  sum: number;
  orderId: number;
  createdDate: string;
  updatedDate: string;
  daysOfGuarantee: number;
  isActive: boolean;
}
