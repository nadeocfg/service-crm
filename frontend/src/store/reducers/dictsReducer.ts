import { ReduxActionModel } from '../../models/reduxModel';
import { DictsStoreModel } from '../../models/storeModel';
import {
  SET_BOILER_LIST,
  SET_JOB_TYPES_LIST,
  SET_ROLE_LIST,
  SET_PART_LIST,
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
  dictBoilers: {
    boilers: [],
    total: 0,
  },
  dictParts: {
    parts: [],
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

    case SET_BOILER_LIST:
      return {
        ...state,
        dictBoilers: {
          ...state.dictBoilers,
          boilers: action.payload.boilers,
          total: action.payload.total,
        },
      };

    case SET_PART_LIST:
      return {
        ...state,
        dictParts: {
          ...state.dictParts,
          parts: action.payload.parts,
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
