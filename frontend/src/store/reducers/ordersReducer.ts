import { ReduxActionModel } from '../../models/reduxModel';
import { OrdersStoreModel } from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';
import { SET_ORDERS } from '../storeConstants/ordersConstants';

const initialState: OrdersStoreModel = {
  orders: [],
  total: 0,
};

const ordersReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_ORDERS:
      return {
        ...state,
        orders: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default ordersReducer;
