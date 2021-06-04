import { Dispatch } from 'react';
import api from '../../utils/axiosMiddleware';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { SET_USERS_LIST } from '../storeConstants/usersPageConstants';
import { setLoader } from './mainActions';

export const getUsers = () => async (dispatch: Dispatch<any>) => {
  try {
    dispatch(setLoader(true));

    api
      .get(`/api/users/all-active`)
      .then((res) => {
        dispatch({
          type: SET_USERS_LIST,
          payload: res.data,
        });
        console.log(res);
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

    dispatch(setLoader(false));
  }
};
