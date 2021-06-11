import { useState } from 'react';
import {
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  TextField,
} from '@material-ui/core';
import Btn from '../../Btn';
import Transition from '../../Transition';
import AddIcon from '@material-ui/icons/Add';
import api from '../../../utils/axiosMiddleware';
import { useDispatch } from 'react-redux';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';
import { getAllRoles } from '../../../store/actions/dictsActions';

const CreateRoleModal = () => {
  const [open, setOpen] = useState(false);
  const [roleData, setRoleData] = useState({
    code: '',
    name: '',
  });
  const dispatch = useDispatch();

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange = (name: string) => (event: any) => {
    setRoleData({
      ...roleData,
      [name]: event.target.value,
    });
  };

  const submit = (event: React.FormEvent<any>) => {
    event.preventDefault();

    if (!roleData.code || !roleData.name) {
      return dispatch({
        type: ADD_NOTIFY,
        payload: {
          message: 'Заполните все поля формы',
          type: 'error',
        },
      });
    }

    api
      .post(`/api/dicts/roles/create`, roleData)
      .then((res) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Роль успешно добавлена',
            type: 'success',
          },
        });

        dispatch(getAllRoles());

        handleChangeModal();
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
        <DialogTitle>Добавить роль</DialogTitle>
        <form id="role-form" action="" onSubmit={submit}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Код"
              variant="outlined"
              value={roleData.code}
              onChange={handleChange('code')}
              required
            />

            <TextField
              className="input form__field"
              label="Наименование"
              variant="outlined"
              value={roleData.name}
              onChange={handleChange('name')}
              required
            />
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

export default CreateRoleModal;
