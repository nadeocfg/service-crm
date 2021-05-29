export interface StoreModel {
  userStore: UserStoreModel;
  snackbarStore: SnackbarStoreModel;
}

export interface UserStoreModel {
  userDataResponse: any;
  inputUserData: {
    login: string;
    password: string;
  };
}

export interface SnackbarStoreModel {
  message: string;
  type: string;
}
