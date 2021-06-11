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
import { useDispatch } from 'react-redux';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';
import api from '../../../utils/axiosMiddleware';
import { getAllParts } from '../../../store/actions/dictsActions';

const CreatePartModal = () => {
  const [open, setOpen] = useState(false);
  const [partData, setPartData] = useState({
    article: '',
    name: '',
    price: 0,
    monthsOfGuarantee: 0,
    quantity: 0,
    price1: 0,
    price2: 0,
    price3: 0,
  });
  const dispatch = useDispatch();

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange = (name: string) => (event: any) => {
    setPartData({
      ...partData,
      [name]: event.target.value,
    });
  };

  const submit = (event: React.FormEvent<any>) => {
    event.preventDefault();

    api
      .post(`/api/dicts/parts/create`, partData)
      .then((res) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Отопительный котел успешно добавлен',
            type: 'success',
          },
        });

        handleChangeModal();
        dispatch(getAllParts());
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
        <DialogTitle>Добавить отопительный котел</DialogTitle>
        <form id="job-type-form" action="" onSubmit={submit}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Артикул"
              variant="outlined"
              value={partData.article}
              onChange={handleChange('article')}
              required
            />

            <TextField
              className="input form__field"
              label="Наименование"
              variant="outlined"
              value={partData.name}
              onChange={handleChange('name')}
              required
            />

            <TextField
              className="input form__field"
              label="Гарантия (мес.)"
              variant="outlined"
              value={partData.monthsOfGuarantee}
              onChange={handleChange('monthsOfGuarantee')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Количество"
              variant="outlined"
              value={partData.quantity}
              onChange={handleChange('quantity')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Цена"
              variant="outlined"
              value={partData.price}
              onChange={handleChange('price')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Цена 1"
              variant="outlined"
              value={partData.price1}
              onChange={handleChange('price1')}
              type="number"
            />

            <TextField
              className="input form__field"
              label="Цена 2"
              variant="outlined"
              value={partData.price2}
              onChange={handleChange('price2')}
              type="number"
            />

            <TextField
              className="input form__field"
              label="Цена 3"
              variant="outlined"
              value={partData.price3}
              onChange={handleChange('price3')}
              type="number"
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

export default CreatePartModal;
