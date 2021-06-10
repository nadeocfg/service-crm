import { Dispatch } from 'react';
import api from '../../utils/axiosMiddleware';
import history from '../../utils/history';
import { CLEAR_STORE, SET_LOADER } from '../storeConstants/mainConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { SET_AUTH_RESPONSE } from '../storeConstants/userConstants';
import { getAllRoles } from './dictsActions';
import { setLoader } from './mainActions';

export const userSignIn =
  (login: string, password: string) => async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      const data = {
        login,
        password,
      };

      api
        .post('/api/users/auth', data)
        .then((res) => {
          dispatch({
            type: SET_AUTH_RESPONSE,
            payload: res.data,
          });

          dispatch(getAllRoles());

          window.localStorage.setItem('AUTH_DATA', JSON.stringify(res.data));
        })
        .catch((err) => {
          dispatch({
            type: ADD_NOTIFY,
            payload: {
              message: err.response?.data?.message
                ? err.response.data.message
                : 'Ошибка при авторизации',
              type: 'error',
            },
          });

          dispatch({
            type: CLEAR_STORE,
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
              : 'Ошибка при авторизации',
          type: 'error',
        },
      });

      dispatch({
        type: CLEAR_STORE,
      });

      dispatch(setLoader(false));
    }
  };

export const getUserByToken =
  (token: string) => async (dispatch: Dispatch<any>) => {
    try {
      api
        .get(`/api/users/profile`)
        .then((res) => {
          dispatch({
            type: SET_AUTH_RESPONSE,
            payload: res.data,
          });

          dispatch(getAllRoles());

          window.localStorage.setItem('AUTH_DATA', JSON.stringify(res.data));
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

          dispatch({
            type: CLEAR_STORE,
          });

          window.localStorage.removeItem('AUTH_DATA');
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

      dispatch({
        type: CLEAR_STORE,
      });

      dispatch(setLoader(false));
    }
  };

export const logout = () => async (dispatch: Dispatch<any>) => {
  window.localStorage.removeItem('AUTH_DATA');

  history.push('/');

  dispatch({
    type: CLEAR_STORE,
  });

  dispatch({
    type: SET_LOADER,
    payload: false,
  });
};
