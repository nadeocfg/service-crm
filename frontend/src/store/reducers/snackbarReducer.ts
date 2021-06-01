import { ReduxActionModel } from '../../models/reduxModel';
import { ADD_NOTIFY, REMOVE_NOTIFY } from '../storeConstants/snackbarConstants';
import {
  NotificationItemModel,
  NotificationsStoreModel,
} from '../../models/storeModel';
import { CLEAR_STORE } from '../storeConstants/mainConstants';

const initialState: NotificationsStoreModel = {
  notifications: [],
};

const snackbarReducer = (state = initialState, action: ReduxActionModel) => {
  switch (action.type) {
    case ADD_NOTIFY:
      return {
        ...state,
        notifications: [...state.notifications, action.payload],
      };

    case REMOVE_NOTIFY:
      return {
        ...state,
        notifications: state.notifications.filter(
          (el: NotificationItemModel) => el.id !== action.payload.id
        ),
      };

    case CLEAR_STORE:
      return initialState;

    default:
      return state;
  }
};

export default snackbarReducer;
