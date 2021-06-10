import { VariantType } from 'notistack';

export interface StoreModel {
  mainStore: MainStoreModel;
  userStore: UserStoreModel;
  usersStore: UsersStoreModel;
  snackbarStore: NotificationsStoreModel;
  editUserStore: EditUserStoreModel;
  dictsStore: DictsStoreModel;
}

export interface MainStoreModel {
  isLoading: boolean;
  isDrawerOpen: boolean;
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
}

export interface UsersItemModel {
  id: number;
  login: string;
  birthDay: string;
  phone: string;
  createdDate: string;
  updatedDate: string;
  fullName: string;
  roleId: number;
  percentFromJob: number;
  percentFromParts: number;
  percentFromVisit: number;
  roleName: string;
  roleCode: string;
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
}

export interface DictsStoreModel {
  dictRoles: {
    roles: RoleItemModel[];
  };
  dictJobTypes: {
    jobTypes: JobItemModel[];
    total: number;
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
  monthsOfGuarantee?: number;
  name?: string;
  price?: number;
  price1?: number;
  price2?: number;
  price3?: number;
  updatedDate?: string;
}
