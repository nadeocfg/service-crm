import { ReduxActionModel } from '../../models/reduxModel';
import { CustomersStoreModel } from '../../models/storeModel';
import {
  SET_CREATE_CUSTOMER_DATA,
  SET_CUSTOMERS_LIST,
  SET_CUSTOMERS_SEARCH_FIELD,
} from '../storeConstants/customersConstants';
import { CLEAR_STORE } from '../storeConstants/mainConstants';

const initialState: CustomersStoreModel = {
  customers: [],
  total: 0,
  searchValue: '',
  createCustomerData: {
    address: '',
    email: '',
    fullName: '',
    phone: '',
    phone2: '',
    boilerSerial: '',
    boiler: {},
    purchaseDate: '',
  },
};

const customersReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_CUSTOMERS_LIST:
      return {
        ...state,
        customers: action.payload.customers,
        total: action.payload.total,
      };

    case SET_CUSTOMERS_SEARCH_FIELD:
      return {
        ...state,
        searchValue: action.payload,
      };

    case SET_CREATE_CUSTOMER_DATA:
      return {
        ...state,
        createCustomerData: {
          ...state.createCustomerData,
          [action.payload.name]: action.payload.value,
        },
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default customersReducer;
