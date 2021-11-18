import { Dispatch } from 'react';
import api from '../../utils/axiosMiddleware';
import { SET_CUSTOMERS_LIST } from '../storeConstants/customersConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { setLoader } from './mainActions';

export const getCustomersList =
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
        .post(`/api/customers/find`, data)
        .then((res) => {
          dispatch({
            type: SET_CUSTOMERS_LIST,
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
