import axios from 'axios';
import { Dispatch } from 'react';
import { SET_SNACKBAR } from '../storeConstants/snackbarConstants';
import { SET_CURRENT_USER_RESPONSE } from '../storeConstants/userConstants';

export const getCurrentUser = () => async (dispatch: Dispatch<any>) => {
  try {
    axios
      .get('/api/products')
      .then((res) => {
        dispatch({
          type: SET_CURRENT_USER_RESPONSE,
          payload: res.data,
        });
      })
      .catch((err) => {
        dispatch({
          type: SET_SNACKBAR,
          payload: {
            message: err.response?.data?.message
              ? err.response.data.message
              : 'Ошибка при загрузке товаров',
            type: 'error',
          },
        });
      });
  } catch (error) {
    dispatch({
      type: SET_SNACKBAR,
      payload: {
        message:
          error.response && error.response.data
            ? error.response.data.message
            : 'Ошибка при загрузке товаров',
        type: 'error',
      },
    });
  }
};
