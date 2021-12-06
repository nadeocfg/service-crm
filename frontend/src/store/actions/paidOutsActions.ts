import { Dispatch } from 'react';
import api from '../../utils/axiosMiddleware';
import { SET_PAID_OUTS_LIST } from '../storeConstants/paidOutsConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { setLoader } from './mainActions';

export const getPaidOutsList =
  (page: number = 0, count: number = 10, searchField: string = '') =>
  async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .get(
          `/api/paids/list?page=${page}&count=${count}&searchValue=${searchField}`
        )
        .then((res) => {
          dispatch({
            type: SET_PAID_OUTS_LIST,
            payload: res.data,
          });
        })
        .catch((err) => {
          dispatch({
            type: ADD_NOTIFY,
            payload: {
              message: err.response?.data?.message
                ? err.response.data.message
                : 'Ошибка',
              type: 'error',
            },
          });
        })
        .finally(() => {
          dispatch(setLoader(false));
        });
    } catch (error: any) {
      dispatch({
        type: ADD_NOTIFY,
        payload: {
          message:
            error.response && error.response.data
              ? error.response.data.message
              : 'Ошибка',
          type: 'error',
        },
      });

      dispatch(setLoader(false));
    }
  };
