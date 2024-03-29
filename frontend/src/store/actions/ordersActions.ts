import { Dispatch } from 'react';
import { OrderDataModel } from '../../models/storeModel';
import api from '../../utils/axiosMiddleware';
import {
  CLEAR_ORDER_DATA,
  SET_ORDERS,
} from '../storeConstants/ordersConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { setLoader } from './mainActions';
import history from '../../utils/history';

export interface SearchFilters {
  searchValue?: string;
  users?: string[];
  statuses?: string[];
  fromDate?: string;
  toDate?: string;
}

export const getOrders =
  (searchString: string) => async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .get(`/api/orders${searchString}`)
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

export const sendCreateOrderMessage =
  (orderData: OrderDataModel) => async (dispatch: Dispatch<any>) => {
    try {
      api
        .post(`/api/tg/create-order`, orderData)
        .then((res) => {
          dispatch({
            type: ADD_NOTIFY,
            payload: {
              message: 'Сообщение отправлено',
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
    }
  };

export const sendUpdateOrderMessage =
  (orderData: OrderDataModel) => async (dispatch: Dispatch<any>) => {
    try {
      api
        .post(`/api/tg/update-order`, orderData)
        .then(() => {
          dispatch({
            type: ADD_NOTIFY,
            payload: {
              message: 'Сообщение отправлено',
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

          dispatch(sendCreateOrderMessage(res.data));

          dispatch({
            type: CLEAR_ORDER_DATA,
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
    // return dispatch(sendUpdateOrderMessage(orderData));

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

          dispatch(sendUpdateOrderMessage(res.data));

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
