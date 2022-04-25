import { Dispatch } from 'react';
import api from '../../utils/axiosMiddleware';
import {
  SET_LOADER,
  SET_DRAWER,
  SET_DASHBOARD_ORDERS,
  SET_DASHBOARD_CASH,
} from '../storeConstants/mainConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';

export const setLoader =
  (isLoading: boolean) => async (dispatch: Dispatch<any>) => {
    dispatch({
      type: SET_LOADER,
      payload: isLoading,
    });
  };

export const changeDrawer =
  (open: boolean) => async (dispatch: Dispatch<any>) => {
    dispatch({
      type: SET_DRAWER,
      payload: open,
    });
  };

export const getOrdersInfo = () => async (dispatch: Dispatch<any>) => {
  try {
    dispatch(setLoader(true));

    api
      .get(`/api/dashboard/orders`)
      .then((res) => {
        dispatch({
          type: SET_DASHBOARD_ORDERS,
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

export const getCashInfo = () => async (dispatch: Dispatch<any>) => {
  try {
    dispatch(setLoader(true));

    api
      .get(`/api/dashboard/cash`)
      .then((res) => {
        dispatch({
          type: SET_DASHBOARD_CASH,
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
