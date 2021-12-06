import { ReduxActionModel } from '../../models/reduxModel';
import { PaidOutsStoreModel } from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';
import {
  SET_PAID_OUTS_LIST,
  SET_PAID_OUTS_SEARCH_FIELD,
} from '../storeConstants/paidOutsConstants';

const initialState: PaidOutsStoreModel = {
  paidOutsList: [],
  total: 0,
  searchField: '',
};

const ordersReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_PAID_OUTS_LIST:
      return {
        ...state,
        paidOutsList: action.payload.paidOutsList,
        total: action.payload.total,
      };

    case SET_PAID_OUTS_SEARCH_FIELD:
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

export default ordersReducer;
