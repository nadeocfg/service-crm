import { ReduxActionModel } from '../../models/reduxModel';
import { UsersStoreModel } from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';
import { SET_USERS_LIST } from '../storeConstants/usersPageConstants';

const initialState = {
  usersList: [],
};

const usersPageReducer = (
  state: UsersStoreModel = initialState,
  action: ReduxActionModel
) => {
  switch (action.type) {
    case SET_USERS_LIST:
      return {
        ...state,
        usersList: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default usersPageReducer;
