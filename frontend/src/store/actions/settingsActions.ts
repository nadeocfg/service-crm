import { Dispatch } from 'react';
import api from '../../utils/axiosMiddleware';
import { SET_SETTINGS } from '../storeConstants/settingsConstants';
import { ADD_NOTIFY } from '../storeConstants/snackbarConstants';
import { setLoader } from './mainActions';
import { SettingsStore } from '../../models/storeModel';

export const getSettings = () => async (dispatch: Dispatch<any>) => {
  try {
    dispatch(setLoader(true));

    api
      .get(`/api/settings`)
      .then((res) => {
        dispatch({
          type: SET_SETTINGS,
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

export const saveSettings =
  (settings: SettingsStore['settings']) => async (dispatch: Dispatch<any>) => {
    try {
      dispatch(setLoader(true));

      api
        .post(`/api/settings`, { settings })
        .then((res) => {
          dispatch({
            type: SET_SETTINGS,
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
