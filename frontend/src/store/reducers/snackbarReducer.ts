import { ReduxActionModel } from '../../models/reduxModel';
import { CLEAR_STORE } from '../storeConstants/userConstants';
import { SET_SNACKBAR } from '../storeConstants/snackbarConstants';

const initialState = {
  message: '',
  type: 'default',
};

const snackbarReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_SNACKBAR:
      return {
        ...state,
        message: action.payload.message,
        type: action.payload.type,
      };
    case CLEAR_STORE:
      return initialState;
    default:
      return state;
  }
};

export default snackbarReducer;
