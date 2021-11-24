export interface CustomerModel {
  id: number;
  address: string;
  email?: string;
  createdDate: string;
  updatedDate: string;
  createdBy: number;
  fullName: string;
  phone: string;
  phone2?: string;
  isActive: boolean;
  boilerSerial?: string;
}
