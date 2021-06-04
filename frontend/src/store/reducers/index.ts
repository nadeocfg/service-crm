import { combineReducers } from 'redux';
import userStore from './userReducer';
import snackbarStore from './snackbarReducer';
import mainStore from './mainReducer';
import usersStore from './usersPageReducer';

const rootReducer = combineReducers({
  mainStore,
  userStore,
  snackbarStore,
  usersStore,
});

export default rootReducer;
