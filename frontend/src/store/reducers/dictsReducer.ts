import { ReduxActionModel } from '../../models/reduxModel';
import { DictsStoreModel } from '../../models/storeModel';
import { SET_ROLE_LIST } from '../storeConstants/dictsConstants';
import { CLEAR_STORE } from '../storeConstants/mainConstants';

const initialState: DictsStoreModel = {
  dictRoles: {
    roles: [],
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

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default dictsReducer;
