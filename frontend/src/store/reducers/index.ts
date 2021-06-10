import { combineReducers } from 'redux';
import userStore from './userReducer';
import snackbarStore from './snackbarReducer';
import mainStore from './mainReducer';
import usersStore from './usersPageReducer';
import editUserStore from './editUserReducer';

const rootReducer = combineReducers({
  mainStore,
  userStore,
  snackbarStore,
  usersStore,
  editUserStore,
});

export default rootReducer;
