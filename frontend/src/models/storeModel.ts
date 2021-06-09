import { VariantType } from 'notistack';

export interface StoreModel {
  mainStore: MainStoreModel;
  userStore: UserStoreModel;
  usersStore: UsersStoreModel;
  snackbarStore: NotificationsStoreModel;
}

export interface MainStoreModel {
  isLoading: boolean;
  isDrawerOpen: boolean;
}

export interface UserStoreModel {
  authResponse: {
    birthDay?: string;
    createdDate?: string;
    firstName?: string;
    id?: number;
    isAdmin?: boolean;
    lastName?: string;
    login?: string;
    phone?: string;
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
  percentFromJob?: number | null;
  percentFromParts?: number | null;
  percentFromVisit?: number | null;
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
