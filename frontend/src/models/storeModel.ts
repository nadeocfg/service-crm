import { VariantType } from 'notistack';
import { OrderItemModel } from './orderModel';

export interface StoreModel {
  mainStore: MainStoreModel;
  userStore: UserStoreModel;
  usersStore: UsersStoreModel;
  snackbarStore: NotificationsStoreModel;
  editUserStore: EditUserStoreModel;
  dictsStore: DictsStoreModel;
  ordersStore: OrdersStoreModel;
  customersStore: CustomersStoreModel;
  paidOutsStore: PaidOutsStoreModel;
  settingsStore: SettingsStore;
  cashStore: CashStoreModel;
}

export interface MainStoreModel {
  isLoading: boolean;
  isDrawerOpen: boolean;
  dashboardOrders: {
    count: string;
    doneOrders: string;
    wipOrders: string;
    newOrders: string;
    onHoldOrders: string;
    canceledOrders: string;
  };
  dashboardCash: {
    readySum: string;
    notReadySum: string;
    paidSum: string;
  };
}

export interface UserStoreModel {
  authResponse: {
    birthDay?: string;
    createdDate?: string;
    fullName?: string;
    id?: number;
    login?: string;
    percentFromJob?: number;
    percentFromParts?: number;
    percentFromVisit?: number;
    phone?: string;
    roleCode?: string;
    roleId?: number;
    roleName?: string;
    token?: string;
    updatedDate?: string;
  };
  isAuthorized: boolean;
}

export interface NotificationsStoreModel {
  notifications: NotificationItemModel[];
}

export interface NotificationItemModel {
  id: number;
  message: string;
  type: VariantType;
  isShown: boolean;
}

export interface UsersStoreModel {
  usersList: UsersItemModel[];
  usersTotal: number;
  searchField: string;
  createData: CreateUserDataModel;
}

export interface CreateUserDataModel {
  login?: string;
  birthDay?: string;
  password?: string;
  phone?: string;
  fullName?: string;
  roleId?: number;
  percentFromJob?: number;
  percentFromParts?: number;
  percentFromVisit?: number;
  tgAccount?: string;
  chatId?: string;
}

export interface UsersItemModel {
  id?: number;
  login?: string;
  birthDay?: string;
  phone?: string;
  createdDate?: string;
  updatedDate?: string;
  fullName?: string;
  roleId?: number;
  percentFromJob?: number;
  percentFromParts?: number;
  percentFromVisit?: number;
  roleName?: string;
  roleCode?: string;
  tgAccount?: string;
}

export interface EditUserStoreModel {
  user: EditUserResponse;
}

export interface EditUserResponse {
  id?: number;
  login?: string;
  password?: string;
  fullName?: string;
  birthDay?: string;
  phone?: string;
  roleId?: number;
  percentFromJob?: number | null;
  percentFromParts?: number | null;
  percentFromVisit?: number | null;
  tgAccount?: string;
  chatId?: string;
}

export interface DictsStoreModel {
  dictRoles: {
    roles: RoleItemModel[];
  };
  dictJobTypes: {
    jobTypes: JobItemModel[];
    total: number;
  };
  dictBoilers: {
    boilers: BoilerItemModel[];
    total: number;
  };
  dictParts: {
    parts: PartItemModel[];
    total: number;
  };
  dictOrderStatuses: {
    statuses: OrderStatusItemModel[];
  };
}

export interface RoleItemModel {
  id: number;
  code: string;
  name: string;
  createdDate: string;
  updatedDate: string;
}

export interface JobItemModel {
  code?: string;
  createdBy?: number;
  createdDate?: string;
  id?: number;
  daysOfGuarantee?: number;
  name?: string;
  prices?: {
    name: string;
    value: number;
  }[];
  updatedDate?: string;
  soldQuantity?: number | string;
  selectedPrice?: string;
  isActive?: boolean;
}

export interface BoilerItemModel {
  id?: number;
  article?: string;
  name?: string;
  price?: number;
  daysOfGuarantee?: number;
  quantity?: number;
  price1?: number;
  price2?: number;
  price3?: number;
  createdDate?: string;
  updatedDate?: string;
  createdBy?: number;
  isActive?: boolean;
}

export interface PartItemModel {
  id?: number;
  article?: string;
  name?: string;
  daysOfGuarantee?: number;
  quantity?: number;
  prices?: {
    name: string;
    value: number;
  }[];
  createdDate?: string;
  updatedDate?: string;
  createdBy?: number;
  isActive?: boolean;
  soldQuantity?: string | number;
  selectedPrice?: string;
}

export interface OrdersStoreModel {
  orders: OrderItemModel[];
  total: number;
  searchValue: string;
  orderData: OrderDataModel;
}

export interface OrderStatusItemModel {
  id?: number;
  code?: string;
  name?: string;
  updatedDate?: string;
  createdDate?: string;
  isActive?: boolean;
}

export interface CustomersStoreModel {
  customers: CustomerItemModel[];
  total: number;
  searchValue: string;
  createCustomerData: {
    address: string;
    email: string;
    fullName: string;
    phone: string;
    phone2: string;
    boilerSerial: string;
    boiler: BoilerItemModel;
    purchaseDate: string;
  };
}

export interface CustomerItemModel {
  address?: string;
  createdBy?: number;
  createdDate?: string;
  email?: string;
  fullName?: string;
  id?: number;
  isActive?: boolean;
  phone?: string;
  phone2?: string;
  updatedDate?: string;
  boilerSerial?: string;
  boilerId?: string;
  boiler?: BoilerItemModel;
  purchaseDate?: string;
}

export interface OrderDataModel {
  customer: CustomerItemModel;
  address: string;
  phone: string;
  serviceMan: UsersItemModel;
  comment: string;
  visitPrice: number;
  boiler: BoilerItemModel;
  parts: PartItemModel[];
  jobTypes: JobItemModel[];
  createdDate?: string;
  updatedDate?: string;
  status?: string;
  orderId?: number;
}

export interface PaidOutsStoreModel {
  paidOutsList: PaidOutsItemModel[];
  total: number;
  searchField: string;
}

export interface PaidOutsItemModel {
  createdDate: string;
  fullName: string;
  id: number;
  isPaid: boolean;
  orderId: number;
  sum: number;
  updatedDate: string;
  doneDate: string;
  userId: number;
  canBePaid: boolean;
}

export interface OrderStatusHistoryItem {
  comment: string;
  createdBy: string;
  createdDate: string;
  id: number;
  orderId: number;
  status: string;
}

export interface SettingsStore {
  settings: SettingsItem[];
}

export interface SettingsItem {
  id: number;
  name: string;
  value: string;
  description: string;
  createdDate: string;
  updatedDate: string;
}

export interface CashStoreModel {
  cashList: CashListItemModel[];
  total: number;
  searchField: string;
}

export interface CashListItemModel {
  id: number;
  fullName: string;
  readySum: number;
  notReadySum: number;
  paidSum: number;
  updatedDate: string;
}
