import { combineReducers } from 'redux';
import userStore from './userReducer';
import snackbarStore from './snackbarReducer';
import mainStore from './mainReducer';
import usersStore from './usersPageReducer';
import editUserStore from './editUserReducer';
import dictsStore from './dictsReducer';
import ordersStore from './ordersReducer';
import customersStore from './customersReducer';
import paidOutsStore from './paidOutsReducer';

const rootReducer = combineReducers({
  mainStore,
  userStore,
  snackbarStore,
  usersStore,
  editUserStore,
  dictsStore,
  ordersStore,
  customersStore,
  paidOutsStore,
});

export default rootReducer;
