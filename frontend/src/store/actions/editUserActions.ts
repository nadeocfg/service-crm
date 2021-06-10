import moment from 'moment';
import { Dispatch } from 'react';
import { EditUserResponse } from '../../models/storeModel';
import api from '../../utils/axiosMiddleware';
import { SET_USER_RESPONSE } from '../storeConstants/editUserConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { setLoader } from './mainActions';

export const getUserById =
  (id: number | string) => async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .get(`/api/users/${id}`)
        .then((res) => {
          const birthDay = moment(res.data.birthDay).format('DD/MM/YYYY');

          dispatch({
            type: SET_USER_RESPONSE,
            payload: {
              ...res.data,
              birthDay,
              password: '',
            },
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

export const updateUser =
  (data: EditUserResponse) => async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      const birthDay = moment(data.birthDay, 'DD/MM/YYYY').format('YYYY-MM-DD');

      api
        .post(`/api/users/update/${data.id}`, {
          ...data,
          birthDay,
        })
        .then((res) => {
          dispatch({
            type: ADD_NOTIFY,
            payload: {
              message: 'Пользователь успешно сохранен',
              type: 'success',
            },
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
