import { ReduxActionModel } from '../../models/reduxModel';
import { CashStoreModel } from '../../models/storeModel';
import {
  SET_CASH_LIST,
  SET_CASH_SEARCH_FIELD,
} from '../storeConstants/cashConstants';
import { CLEAR_STORE } from '../storeConstants/mainConstants';

const initialState: CashStoreModel = {
  cashList: [],
  total: 0,
  searchField: '',
};

const cashReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_CASH_LIST:
      return {
        ...state,
        cashList: action.payload.cashList,
        total: action.payload.total,
      };

    case SET_CASH_SEARCH_FIELD:
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

export default cashReducer;
