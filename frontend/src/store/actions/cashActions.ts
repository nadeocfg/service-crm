import { Dispatch } from 'react';
import { SortModel } from '../../models/orderModel';
import { CashListItemModel } from '../../models/storeModel';
import api from '../../utils/axiosMiddleware';
import { SET_CASH_LIST } from '../storeConstants/cashConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { setLoader } from './mainActions';

export const getCashList =
  (
    page: number = 0,
    count: number = 10,
    searchValue: string = '',
    sort: SortModel = { name: 'id', order: 'desc' }
  ) =>
  async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      const data = {
        page,
        count,
        searchValue,
        sort: `${sort.name},${sort.order}`,
      };

      api
        .post(`/api/cash`, data)
        .then((res) => {
          dispatch({
            type: SET_CASH_LIST,
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

export const payToServiceMan =
  (cashItem: CashListItemModel | null, requestedAmount: number) =>
  async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      const data = {
        id: cashItem?.id,
        requestedAmount,
      };

      api
        .post(`/api/cash/pay`, data)
        .then((res) => {
          dispatch({
            type: ADD_NOTIFY,
            payload: {
              message: 'Выплата успешно сохранена',
              type: 'success',
            },
          });

          dispatch(getCashList());
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
