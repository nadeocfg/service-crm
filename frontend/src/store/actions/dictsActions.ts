import { Dispatch } from 'react';
import api from '../../utils/axiosMiddleware';
import { SET_ROLE_LIST } from '../storeConstants/dictsConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';

export const getAllRoles = () => async (dispatch: Dispatch<any>) => {
  try {
    api
      .get(`/api/dicts/roles`)
      .then((res) => {
        dispatch({
          type: SET_ROLE_LIST,
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
      });
  } catch (error) {
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
  }
};
