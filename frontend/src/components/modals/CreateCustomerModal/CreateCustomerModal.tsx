import {
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  TextField,
} from '@material-ui/core';
import { useState } from 'react';
import Btn from '../../Btn';
import Transition from '../../Transition';
import AddIcon from '@material-ui/icons/Add';
import { useDispatch, useSelector } from 'react-redux';
import { StoreModel } from '../../../models/storeModel';
import ReactInputMask from 'react-input-mask';
import { SET_CREATE_CUSTOMER_DATA } from '../../../store/storeConstants/customersConstants';
import api from '../../../utils/axiosMiddleware';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';

interface CreateCustomerModalProps {
  btnTitle?: string;
}

const CreateCustomerModal = ({ btnTitle }: CreateCustomerModalProps) => {
  const [open, setOpen] = useState(false);
  const createCustomerData = useSelector(
    (store: StoreModel) => store.customersStore.createCustomerData
  );
  const currentUser = useSelector(
    (store: StoreModel) => store.userStore.authResponse
  );
  const dispatch = useDispatch();

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange = (name: string) => (event: any) => {
    dispatch({
      type: SET_CREATE_CUSTOMER_DATA,
      payload: {
        name,
        value: event.target.value,
      },
    });
  };

  const submit = async (event: any) => {
    event.preventDefault();

    if (
      createCustomerData.phone.replace('_', '').length !== 18 ||
      (createCustomerData.phone2.length !== 0 &&
        createCustomerData.phone2.replace('_', '').length !== 18)
    ) {
      return dispatch({
        type: ADD_NOTIFY,
        payload: {
          message: 'Неправильный формат телефона',
          type: 'error',
        },
      });
    }

    const data = {
      ...createCustomerData,
      createdBy: currentUser.id,
    };

    api
      .post(`/api/customers/create`, data)
      .then((res) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Клиент успешно добавлен',
            type: 'success',
          },
        });
      })
      .catch((err) => {
        console.log({ ...err });
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message:
              err.response && err.response.data
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
        {btnTitle || 'Добавить'}
      </Btn>

      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleChangeModal}
      >
        <DialogTitle>Добавить клиента</DialogTitle>
        <form id="create-form" action="" onSubmit={submit}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Адрес"
              variant="outlined"
              value={createCustomerData.address}
              onChange={handleChange('address')}
              required
            />

            <TextField
              className="input form__field"
              label="Email"
              variant="outlined"
              value={createCustomerData.email}
              onChange={handleChange('email')}
              type="email"
            />

            <TextField
              className="input form__field"
              label="ФИО"
              variant="outlined"
              value={createCustomerData.fullName}
              onChange={handleChange('fullName')}
              required
            />

            <TextField
              className="input form__field"
              label="Серийный номер"
              variant="outlined"
              value={createCustomerData.boilerSerial}
              onChange={handleChange('boilerSerial')}
              required
            />

            <ReactInputMask
              mask="+7 (999) 999-99-99"
              onChange={handleChange('phone')}
              value={createCustomerData.phone}
            >
              <TextField
                className="input form__field"
                label="Телефон"
                variant="outlined"
                required
              />
            </ReactInputMask>

            <ReactInputMask
              mask="+7 (999) 999-99-99"
              onChange={handleChange('phone2')}
              value={createCustomerData.phone2}
            >
              <TextField
                className="input form__field"
                label="Телефон 2"
                variant="outlined"
              />
            </ReactInputMask>
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

export default CreateCustomerModal;
