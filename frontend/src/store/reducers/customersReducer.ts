import { ReduxActionModel } from '../../models/reduxModel';
import { CustomersStoreModel } from '../../models/storeModel';
import {
  SET_CREATE_CUSTOMER_DATA,
  SET_CUSTOMERS_LIST,
  SET_CUSTOMERS_PAGINATION,
  SET_CUSTOMERS_SEARCH_FIELD,
  SET_CUSTOMERS_SORT,
} from '../storeConstants/customersConstants';
import { CLEAR_STORE } from '../storeConstants/mainConstants';

const initialState: CustomersStoreModel = {
  customers: [],
  total: 0,
  searchValue: '',
  pagination: {
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
  },
  sort: {
    name: 'id',
    order: 'desc',
  },
  createCustomerData: {
    address: '',
    email: '',
    fullName: '',
    phone: '',
    phone2: '',
    boilerSerial: '',
    boiler: {},
    purchaseDate: '',
    comment: '',
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

    case SET_CUSTOMERS_PAGINATION:
      return {
        ...state,
        pagination: {
          ...state.pagination,
          [action.payload.name]: action.payload.value,
        },
      };

    case SET_CUSTOMERS_SORT:
      return {
        ...state,
        sort: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default customersReducer;
