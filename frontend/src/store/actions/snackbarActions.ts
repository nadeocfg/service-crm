import { VariantType } from 'notistack';
import { Dispatch } from 'react';
import { ADD_NOTIFY, REMOVE_NOTIFY } from '../storeConstants/snackbarConstants';

export const addNotify =
  (message: string, type: VariantType) => async (dispatch: Dispatch<any>) => {
    dispatch({
      type: ADD_NOTIFY,
      payload: {
        id: Math.round(new Date().getTime() + Math.random()),
        isShown: false,
        message,
        type,
      },
    });
  };

export const removeNotify = (id: number) => async (dispatch: Dispatch<any>) => {
  dispatch({
    type: REMOVE_NOTIFY,
    payload: {
      id,
    },
  });
};
