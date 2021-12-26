import { ReduxActionModel } from '../../models/reduxModel';
import { SettingsStore } from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';
import { SET_SETTINGS } from '../storeConstants/settingsConstants';

const initialState: SettingsStore = {
  settings: [],
};

const settingsReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case SET_SETTINGS:
      return {
        ...state,
        settings: action.payload,
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default settingsReducer;
