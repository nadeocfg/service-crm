import { ReduxActionModel } from '../../models/reduxModel';
import { UsersStoreModel } from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';
import {
  SET_USERS_LIST,
  SET_SEARCH_FIELD,
} from '../storeConstants/usersPageConstants';

const initialState = {
  usersList: [],
  usersTotal: 0,
  searchField: '',
};

const usersPageReducer = (
  state: UsersStoreModel = initialState,
  action: ReduxActionModel
) => {
  switch (action.type) {
    case SET_USERS_LIST:
      return {
        ...state,
        usersList: action.payload.usersList,
        usersTotal: action.payload.usersTotal,
      };

    case SET_SEARCH_FIELD:
      return {
        ...state,
        searchField: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default usersPageReducer;
