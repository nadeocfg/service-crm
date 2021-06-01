import { combineReducers } from 'redux';
import userStore from './userReducer';
import snackbarStore from './snackbarReducer';
import mainStore from './mainReducer';

const rootReducer = combineReducers({
  mainStore,
  userStore,
  snackbarStore,
});

export default rootReducer;
