import { ReduxActionModel } from '../../models/reduxModel';
import { MainStoreModel } from '../../models/storeModel';
import {
  SET_LOADER,
  CLEAR_STORE,
  SET_DRAWER,
  SET_DASHBOARD_ORDERS,
  SET_DASHBOARD_CASH,
} from '../storeConstants/mainConstants';

const initialState: MainStoreModel = {
  isLoading: true,
  isDrawerOpen: window.innerWidth > 960,
  dashboardOrders: {
    count: '',
    doneOrders: '',
    wipOrders: '',
    newOrders: '',
    onHoldOrders: '',
    canceledOrders: '',
  },
  dashboardCash: {
    readySum: '',
    notReadySum: '',
    paidSum: '',
  },
};

const mainReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_LOADER:
      return {
        ...state,
        isLoading: action.payload,
      };

    case SET_DRAWER:
      return {
        ...state,
        isDrawerOpen: action.payload,
      };

    case SET_DASHBOARD_ORDERS:
      return {
        ...state,
        dashboardOrders: action.payload,
      };

    case SET_DASHBOARD_CASH:
      return {
        ...state,
        dashboardCash: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default mainReducer;
