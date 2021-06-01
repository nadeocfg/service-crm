import { ReduxActionModel } from '../../models/reduxModel';
import { MainStoreModel } from '../../models/storeModel';
import { SET_LOADER, CLEAR_STORE } from '../storeConstants/mainConstants';

const initialState: MainStoreModel = {
  isLoading: false,
};

const mainReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_LOADER:
      return {
        ...state,
        isLoading: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default mainReducer;
