import { CustomerModel } from './customerModel';
import { SoldJobModel } from './soldJobModel';
import { SoldPartModel } from './soldPartModel';
import { UserModel } from './userModel';

export interface OrderItemModel {
  id: number;
  address: string;
  createdDate: string;
  updatedDate: string;
  comment: string;
  customerId: number;
  serviceManId: number;
  createdBy: {
    login: string;
    fullName: string;
    phone: string;
  };
  statusName: string;
  jobs: SoldJobModel[];
  parts: SoldPartModel[];
  customer: CustomerModel;
  serviceMan: UserModel;
}
