import { combineReducers } from 'redux';
import userStore from './userReducer';
import snackbarStore from './snackbarReducer';

const rootReducer = combineReducers({
  userStore,
  snackbarStore,
});

export default rootReducer;
