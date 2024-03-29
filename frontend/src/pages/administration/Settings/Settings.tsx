import { Card, CardContent, TextField } from '@material-ui/core';
import Btn from '../../../components/Btn';
import SaveIcon from '@material-ui/icons/Save';
import React from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { StoreModel } from '../../../models/storeModel';
import { SET_SETTINGS } from '../../../store/storeConstants/settingsConstants';
import {
  getSettings,
  saveSettings,
} from '../../../store/actions/settingsActions';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';

const Settings = () => {
  const dispatch = useDispatch();
  const settings = useSelector(
    (state: StoreModel) => state.settingsStore.settings
  );

  const handleChange =
    (index: number) => (event: React.ChangeEvent<HTMLInputElement>) => {
      dispatch({
        type: SET_SETTINGS,
        payload: settings.map((item, i) => {
          if (i === index) {
            item.value = event.target.value;
          }
          return item;
        }),
      });
    };

  const save = async () => {
    await dispatch(saveSettings(settings));
    dispatch({
      type: ADD_NOTIFY,
      payload: {
        message: 'Настройки успешно сохранены',
        type: 'success',
      },
    });
    await dispatch(getSettings());
  };

  return (
    <>
      <div className="search-row">
        <h1>Настройки</h1>
      </div>

      <Card>
        <CardContent className="settings">
          {settings.map((item, index) => (
            <div className="settings__part" key={item.id}>
              <p>{item.description}</p>
              <TextField
                className="input form__field"
                label={item.name}
                variant="outlined"
                value={item.value}
                onChange={handleChange(index)}
                type="number"
                required
              />
            </div>
          ))}

          <Btn className="btn btn_primary" onClick={save}>
            <SaveIcon />
            Сохранить
          </Btn>
        </CardContent>
      </Card>
    </>
  );
};

export default Settings;
