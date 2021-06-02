import { ReduxActionModel } from '../../models/reduxModel';
import { MainStoreModel } from '../../models/storeModel';
import {
  SET_LOADER,
  CLEAR_STORE,
  SET_DRAWER,
} from '../storeConstants/mainConstants';

const initialState: MainStoreModel = {
  isLoading: true,
  isDrawerOpen: window.innerWidth > 960,
};

const mainReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_LOADER:
      return {
        ...state,
        isLoading: action.payload,
      };

    case SET_DRAWER:
      return {
        ...state,
        isDrawerOpen: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default mainReducer;
