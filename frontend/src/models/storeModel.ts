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
}

export interface UsersItemModel {
  id: number;
  login: string;
  firstName: string;
  lastName: string;
  birthDay: string;
  password: string;
  phone: string;
  isActive: boolean;
  createdDate: string;
  updatedDate: string;
  isAdmin: boolean;
}
