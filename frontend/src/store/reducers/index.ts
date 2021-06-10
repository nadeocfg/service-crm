import { combineReducers } from 'redux';
import userStore from './userReducer';
import snackbarStore from './snackbarReducer';
import mainStore from './mainReducer';
import usersStore from './usersPageReducer';
import editUserStore from './editUserReducer';
import dictsStore from './dictsReducer';

const rootReducer = combineReducers({
  mainStore,
  userStore,
  snackbarStore,
  usersStore,
  editUserStore,
  dictsStore,
});

export default rootReducer;
