import { Dispatch } from 'react';
import { OrderDataModel } from '../../models/storeModel';
import api from '../../utils/axiosMiddleware';
import { SET_ORDERS } from '../storeConstants/ordersConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { setLoader } from './mainActions';

export const getOrders =
  (page: number = 0, count: number = 10, searchField: string = '') =>
  async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .get(
          `/api/orders?page=${page}&count=${count}&searchValue=${searchField}`
        )
        .then((res) => {
          dispatch({
            type: SET_ORDERS,
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

export const createOrder =
  (orderData: OrderDataModel) => async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .post(`/api/orders/create`, orderData)
        .then((res) => {
          dispatch({
            type: ADD_NOTIFY,
            payload: {
              message: 'Заказ успешно создан',
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
