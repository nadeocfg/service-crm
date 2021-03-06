import { ReduxActionModel } from '../../models/reduxModel';
import { UserStoreModel } from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';
import { SET_AUTH_RESPONSE } from '../storeConstants/userConstants';

const initialState = {
  authResponse: {},
  isAuthorized: false,
};

const userReducer = (
  state: UserStoreModel = initialState,
  action: ReduxActionModel
) => {
  switch (action.type) {
    case SET_AUTH_RESPONSE:
      return {
        ...state,
        authResponse: action.payload,
        isAuthorized: true,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default userReducer;
