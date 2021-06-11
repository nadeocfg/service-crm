import { Dispatch } from 'react';
import api from '../../utils/axiosMiddleware';
import {
  SET_BOILER_LIST,
  SET_JOB_TYPES_LIST,
  SET_ORDER_STATUS_LIST,
  SET_PART_LIST,
  SET_ROLE_LIST,
} from '../storeConstants/dictsConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { setLoader } from './mainActions';

export const getAllRoles = () => async (dispatch: Dispatch<any>) => {
  try {
    dispatch(setLoader(true));

    api
      .get(`/api/dicts/roles`)
      .then((res) => {
        dispatch({
          type: SET_ROLE_LIST,
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

export const getAllJobTypes =
  (page: number = 0, count: number = 10) =>
  async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .get(`/api/dicts/job-types?page=${page}&count=${count}`)
        .then((res) => {
          dispatch({
            type: SET_JOB_TYPES_LIST,
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

export const getAllBoilers =
  (page: number = 0, count: number = 10) =>
  async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .get(`/api/dicts/boilers?page=${page}&count=${count}`)
        .then((res) => {
          dispatch({
            type: SET_BOILER_LIST,
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

export const getAllParts =
  (page: number = 0, count: number = 10) =>
  async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .get(`/api/dicts/parts?page=${page}&count=${count}`)
        .then((res) => {
          dispatch({
            type: SET_PART_LIST,
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

export const getAllOrderStatuses = () => async (dispatch: Dispatch<any>) => {
  try {
    dispatch(setLoader(true));

    api
      .get(`/api/dicts/order-statuses`)
      .then((res) => {
        dispatch({
          type: SET_ORDER_STATUS_LIST,
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
