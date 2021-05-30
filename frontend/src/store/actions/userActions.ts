import axios from 'axios';
import { Dispatch } from 'react';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import {
  CLEAR_STORE,
  SET_AUTH_RESPONSE,
} from '../storeConstants/userConstants';

export const userSignIn =
  (login: string, password: string) => async (dispatch: Dispatch<any>) => {
    try {
      const data = {
        login,
        password,
      };

      axios
        .post('/api/users/auth', data)
        .then((res) => {
          dispatch({
            type: SET_AUTH_RESPONSE,
            payload: res.data,
          });

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
    }
  };

export const getUserByToken =
  (token: string) => async (dispatch: Dispatch<any>) => {
    try {
      axios
        .get(`/api/users/profile`, {
          headers: {
            authorization: `Bearer ${token}`,
          },
        })
        .then((res) => {
          dispatch({
            type: SET_AUTH_RESPONSE,
            payload: res.data,
          });

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
    }
  };
