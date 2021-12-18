import { ReduxActionModel } from '../../models/reduxModel';
import { OrdersStoreModel } from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';
import {
  CLEAR_ORDER_DATA,
  SET_ORDERS,
  SET_ORDERS_SEARCH_FIELD,
  SET_ORDER_DATA,
} from '../storeConstants/ordersConstants';

const initialState: OrdersStoreModel = {
  orders: [],
  total: 0,
  searchValue: '',
  orderData: {
    address: '',
    phone: '',
    comment: '',
    customer: {},
    jobTypes: [],
    parts: [],
    serviceMan: {},
    boiler: {},
    visitPrice: 5000,
  },
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

    case SET_ORDER_DATA:
      return {
        ...state,
        orderData: {
          ...state.orderData,
          [action.payload.name]: action.payload.value,
        },
      };

    case CLEAR_ORDER_DATA:
      return {
        ...state,
        orderData: {
          address: '',
          comment: '',
          customer: {},
          jobTypes: [],
          parts: [],
          serviceMan: {},
          boiler: {},
          visitPrice: 5000,
        },
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default ordersReducer;
