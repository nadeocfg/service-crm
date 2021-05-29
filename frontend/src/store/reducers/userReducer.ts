import { ReduxActionModel } from '../../models/reduxModel';
import { UserStoreModel } from '../../models/storeModel';
import {
  SET_CURRENT_USER_RESPONSE,
  SET_INPUT_USER_DATA,
  CLEAR_STORE,
} from '../storeConstants/userConstants';

const initialState = {
  userDataResponse: {},
  inputUserData: {
    login: '',
    password: '',
  },
};

const userReducer = (
  state: UserStoreModel = initialState,
  action: ReduxActionModel
) => {
  switch (action.type) {
    case SET_INPUT_USER_DATA:
      return {
        ...state,
        inputUserData: {
          ...state.inputUserData,
          [action.payload.name]: action.payload.value,
        },
      };

    case SET_CURRENT_USER_RESPONSE:
      return {
        ...state,
        currentUser: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default userReducer;
