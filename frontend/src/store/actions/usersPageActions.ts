import { Dispatch } from 'react';
import { CreateUserDataModel } from '../../models/storeModel';
import api from '../../utils/axiosMiddleware';
import history from '../../utils/history';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import {
  SET_SEARCH_FIELD,
  SET_USERS_LIST,
} from '../storeConstants/usersPageConstants';
import { setLoader } from './mainActions';

export const getUsers =
  (page: number = 0, count: number = 10, searchValue?: string) =>
  async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      const data = {
        page,
        count,
        searchValue,
      };

      api
        .post(`/api/users/find`, data)
        .then((res) => {
          dispatch({
            type: SET_USERS_LIST,
            payload: {
              usersList: res.data.users,
              usersTotal: res.data.total,
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

export const setSearchField =
  (value: string) => async (dispatch: Dispatch<any>) => {
    dispatch({
      type: SET_SEARCH_FIELD,
      payload: value,
    });
  };

export const createUser =
  (createData: CreateUserDataModel) => async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .post(`/api/users/create`, createData)
        .then((res) => {
          dispatch({
            type: ADD_NOTIFY,
            payload: {
              message: 'Пользователь успешно создан',
              type: 'success',
            },
          });

          dispatch(getUsers());
          history.push('/users');
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
