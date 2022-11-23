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
  boilerName: string;
  createdBy: {
    login: string;
    fullName: string;
    phone: string;
  };
  statusName: string;
  statusCode: string;
  jobs: SoldJobModel[];
  parts: SoldPartModel[];
  customer: CustomerModel;
  serviceMan: UserModel;
}
