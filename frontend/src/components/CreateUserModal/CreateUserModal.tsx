import {
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControl,
  InputLabel,
  MenuItem,
  Select,
  TextField,
} from '@material-ui/core';
import { useState } from 'react';
import Btn from '../Btn';
import Transition from '../Transition';
import AddIcon from '@material-ui/icons/Add';
import { useDispatch, useSelector } from 'react-redux';
import { RoleItemModel, StoreModel } from '../../models/storeModel';
import {
  CLEAR_CREATE_DATA,
  SET_CREATE_DATA,
} from '../../store/storeConstants/usersPageConstants';
import ReactInputMask from 'react-input-mask';
import { createUser } from '../../store/actions/usersPageActions';

const CreateUserModal = () => {
  const [open, setOpen] = useState(false);
  const createData = useSelector(
    (store: StoreModel) => store.usersStore.createData
  );
  const roleList = useSelector(
    (store: StoreModel) => store.dictsStore.dictRoles.roles
  );
  const dispatch = useDispatch();

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange = (name: string) => (event: any) => {
    dispatch({
      type: SET_CREATE_DATA,
      payload: {
        name,
        value: event.target.value,
      },
    });
  };

  const submit = async (event: any) => {
    event.preventDefault();

    const createResult = await dispatch(createUser(createData));

    if (typeof createResult === 'boolean' && createResult) {
      dispatch({
        type: CLEAR_CREATE_DATA,
      });

      handleChangeModal();
    }
  };

  return (
    <>
      <Btn classes="btn btn_primary" onClick={handleChangeModal}>
        <AddIcon />
        Добавить
      </Btn>

      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleChangeModal}
      >
        <DialogTitle>Добавить пользователя</DialogTitle>
        <form id="create-form" action="" onSubmit={submit}>
          <DialogContent className="form">
            <TextField
              placeholder="example@mail.com"
              className="input form__field"
              label="Email"
              type="email"
              variant="outlined"
              value={createData.login}
              onChange={handleChange('login')}
              autoComplete="off"
              required
            />

            <TextField
              className="input form__field"
              label="Пароль"
              variant="outlined"
              type="password"
              onChange={handleChange('password')}
              value={createData.password}
              autoComplete="new-password"
              required
            />

            <TextField
              className="input form__field"
              label="ФИО"
              variant="outlined"
              onChange={handleChange('fullName')}
              value={createData.fullName}
              required
            />

            <ReactInputMask
              mask="+7 (999) 999-99-99"
              onChange={handleChange('phone')}
              value={createData.phone}
            >
              <TextField
                className="input form__field"
                label="Телефон"
                variant="outlined"
                required
              />
            </ReactInputMask>

            <ReactInputMask
              mask="99/99/9999"
              value={createData.birthDay}
              onChange={handleChange('birthDay')}
            >
              <TextField
                className="input form__field"
                label="Дата рождения"
                variant="outlined"
                required
              />
            </ReactInputMask>

            <TextField
              className="input form__field"
              type="number"
              label="Процент от работы"
              variant="outlined"
              onChange={handleChange('percentFromJob')}
              value={createData.percentFromJob}
            />

            <TextField
              className="input form__field"
              type="number"
              label="Процент от запчастей"
              variant="outlined"
              onChange={handleChange('percentFromParts')}
              value={createData.percentFromParts}
            />

            <TextField
              className="input form__field"
              type="number"
              label="Процент от выезда"
              variant="outlined"
              onChange={handleChange('percentFromVisit')}
              value={createData.percentFromVisit}
            />

            <FormControl
              variant="outlined"
              className="input form__field"
              required
            >
              <InputLabel>Роль</InputLabel>
              <Select
                value={createData.roleId}
                onChange={handleChange('roleId')}
                label="Роль"
                required
              >
                {roleList.map((role: RoleItemModel) => (
                  <MenuItem value={role.id} key={role.id}>
                    {role.name}
                  </MenuItem>
                ))}
              </Select>
            </FormControl>
          </DialogContent>
          <DialogActions className="btn-container">
            <Btn classes="btn btn_white" onClick={handleChangeModal}>
              Отмена
            </Btn>
            <Btn classes="btn btn_primary" type="submit">
              Добавить
            </Btn>
          </DialogActions>
        </form>
      </Dialog>
    </>
  );
};

export default CreateUserModal;
