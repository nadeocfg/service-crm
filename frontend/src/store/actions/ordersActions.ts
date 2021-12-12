import { Dispatch } from 'react';
import { OrderDataModel } from '../../models/storeModel';
import api from '../../utils/axiosMiddleware';
import { SET_ORDERS } from '../storeConstants/ordersConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { setLoader } from './mainActions';
import history from '../../utils/history';
import { SortModel } from '../../models/orderModel';

export const getOrders =
  (
    page: number = 0,
    count: number = 10,
    searchField: string = '',
    sort: SortModel = { name: 'id', order: 'desc' }
  ) =>
  async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .get(
          `/api/orders?page=${page}&count=${count}&searchValue=${searchField}&sort=${sort.name},${sort.order}`
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

          history.push('/orders');
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

export const updateOrder =
  (orderData: OrderDataModel) => async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .post(`/api/orders/update`, orderData)
        .then((res) => {
          dispatch({
            type: ADD_NOTIFY,
            payload: {
              message: 'Заказ успешно обновлен',
              type: 'success',
            },
          });

          history.push('/orders');
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

export const getOrderById = (id: string) => async (dispatch: Dispatch<any>) => {
  try {
    dispatch(setLoader(true));

    return api
      .get(`/api/orders/${id}`)
      .then((res) => {
        return res.data;
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

    return false;
  }
};
