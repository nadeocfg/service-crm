import { ReduxActionModel } from '../../models/reduxModel';
import { EditUserStoreModel } from '../../models/storeModel';
import {
  SET_USER_RESPONSE,
  SET_USER_DATA,
} from '../storeConstants/editUserConstants';
import { CLEAR_STORE } from '../storeConstants/mainConstants';

const initialState: EditUserStoreModel = {
  user: {},
};

const editUserReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_USER_RESPONSE:
      return {
        ...state,
        user: action.payload,
      };

    case SET_USER_DATA:
      return {
        ...state,
        user: {
          ...state.user,
          [action.payload.name]: action.payload.value,
        },
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default editUserReducer;
