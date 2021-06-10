import { ReduxActionModel } from '../../models/reduxModel';
import { UsersStoreModel } from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';
import {
  SET_USERS_LIST,
  SET_SEARCH_FIELD,
  SET_CREATE_DATA,
  SET_ROLE_LIST,
  CLEAR_CREATE_DATA,
} from '../storeConstants/usersPageConstants';

const initialState = {
  usersList: [],
  usersTotal: 0,
  searchField: '',
  createData: {
    login: '',
    birthDay: '',
    password: '',
    phone: '',
    fullName: '',
    roleId: 3,
    percentFromJob: 0,
    percentFromParts: 0,
    percentFromVisit: 0,
  },
  roleList: [],
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

    case SET_CREATE_DATA:
      return {
        ...state,
        createData: {
          ...state.createData,
          [action.payload.name]: action.payload.value,
        },
      };

    case CLEAR_CREATE_DATA:
      return {
        ...state,
        createData: {
          ...state.createData,
          login: '',
          birthDay: '',
          password: '',
          phone: '',
          fullName: '',
          roleId: 3,
          percentFromJob: null,
          percentFromParts: null,
          percentFromVisit: null,
        },
      };

    case SET_ROLE_LIST:
      return {
        ...state,
        roleList: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default usersPageReducer;
