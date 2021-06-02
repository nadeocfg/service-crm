import { Dispatch } from 'react';
import { SET_LOADER, SET_DRAWER } from '../storeConstants/mainConstants';

export const setLoader =
  (isLoading: boolean) => async (dispatch: Dispatch<any>) => {
    dispatch({
      type: SET_LOADER,
      payload: isLoading,
    });
  };

export const changeDrawer =
  (open: boolean) => async (dispatch: Dispatch<any>) => {
    dispatch({
      type: SET_DRAWER,
      payload: open,
    });
  };
