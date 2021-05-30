import { VariantType } from 'notistack';

export interface StoreModel {
  userStore: UserStoreModel;
  snackbarStore: NotificationsStoreModel;
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
