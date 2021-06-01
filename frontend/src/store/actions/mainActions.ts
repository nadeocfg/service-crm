import { Dispatch } from 'react';
import { SET_LOADER } from '../storeConstants/mainConstants';

export const setLoader =
  (isLoading: boolean) => async (dispatch: Dispatch<any>) => {
    dispatch({
      type: SET_LOADER,
      payload: isLoading,
    });
  };
