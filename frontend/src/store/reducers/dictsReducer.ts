import { ReduxActionModel } from '../../models/reduxModel';
import { DictsStoreModel } from '../../models/storeModel';
import {
  SET_JOB_TYPES_LIST,
  SET_ROLE_LIST,
} from '../storeConstants/dictsConstants';
import { CLEAR_STORE } from '../storeConstants/mainConstants';

const initialState: DictsStoreModel = {
  dictRoles: {
    roles: [],
  },
  dictJobTypes: {
    jobTypes: [],
    total: 0,
  },
};

const dictsReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_ROLE_LIST:
      return {
        ...state,
        dictRoles: {
          ...state.dictRoles,
          roles: action.payload,
        },
      };

    case SET_JOB_TYPES_LIST:
      return {
        ...state,
        dictJobTypes: {
          ...state.dictJobTypes,
          jobTypes: action.payload.jobTypes,
          total: action.payload.total,
        },
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default dictsReducer;
