import { ReduxActionModel } from '../../models/reduxModel';
import { OrdersStoreModel } from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';
import {
  SET_ORDERS,
  SET_ORDERS_SEARCH_FIELD,
} from '../storeConstants/ordersConstants';

const initialState: OrdersStoreModel = {
  orders: [],
  total: 0,
  searchValue: '',
};

const ordersReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_ORDERS:
      return {
        ...state,
        orders: action.payload.orders,
        total: action.payload.total,
      };

    case SET_ORDERS_SEARCH_FIELD:
      return {
        ...state,
        searchValue: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default ordersReducer;
