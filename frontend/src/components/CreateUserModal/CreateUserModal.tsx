import {
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  TextField,
} from '@material-ui/core';
import React, { useState } from 'react';
import Btn from '../Btn';
import Transition from '../Transition';
import AddIcon from '@material-ui/icons/Add';
import { useDispatch, useSelector } from 'react-redux';
import { StoreModel } from '../../models/storeModel';
import { SET_CREATE_DATA } from '../../store/storeConstants/usersPageConstants';
import ReactInputMask from 'react-input-mask';
import { createUser } from '../../store/actions/usersPageActions';

const CreateUserModal = () => {
  const [open, setOpen] = useState(false);
  const createData = useSelector(
    (store: StoreModel) => store.usersStore.createData
  );
  const dispatch = useDispatch();

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange =
    (name: string) => (event: React.ChangeEvent<HTMLInputElement>) => {
      dispatch({
        type: SET_CREATE_DATA,
        payload: {
          name,
          value: event.target.value,
        },
      });
    };

  const submit = () => {
    dispatch(createUser(createData));
  };

  return (
    <>
      <Btn classes="btn btn_primary" onClick={handleChangeModal}>
        <AddIcon />
        Создать
      </Btn>

      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleChangeModal}
      >
        <DialogTitle>Создать пользователя</DialogTitle>
        <DialogContent>
          <TextField
            placeholder="example@mail.com"
            className="input"
            label="Email"
            type="email"
            variant="outlined"
            value={createData.login}
            onChange={handleChange('login')}
            autoComplete="off"
          />

          <TextField
            className="input"
            label="Пароль"
            variant="outlined"
            type="password"
            onChange={handleChange('password')}
            value={createData.password}
            autoComplete="new-password"
          />
          <TextField
            className="input"
            label="Имя"
            variant="outlined"
            onChange={handleChange('firstName')}
            value={createData.firstName}
          />
          <TextField
            className="input"
            label="Фамилия"
            variant="outlined"
            onChange={handleChange('lastName')}
            value={createData.lastName}
          />

          <ReactInputMask
            mask="+7 (999) 999-99-99"
            onChange={handleChange('phone')}
            value={createData.phone}
          >
            <TextField className="input" label="Телефон" variant="outlined" />
          </ReactInputMask>
        </DialogContent>
        <DialogActions>
          <Btn classes="btn btn_white" onClick={handleChangeModal}>
            Отмена
          </Btn>
          <Btn classes="btn btn_primary" onClick={submit}>
            Создать
          </Btn>
        </DialogActions>
      </Dialog>
    </>
  );
};

export default CreateUserModal;
