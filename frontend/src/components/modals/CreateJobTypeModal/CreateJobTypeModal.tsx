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
import { getAllJobTypes } from '../../../store/actions/dictsActions';

const CreateJobTypeModal = () => {
  const [open, setOpen] = useState(false);
  const [jobTypeData, setJobTypeData] = useState({
    code: '',
    name: '',
    monthsOfGuarantee: 0,
    price: 0,
    price1: 0,
    price2: 0,
    price3: 0,
  });
  const dispatch = useDispatch();

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange = (name: string) => (event: any) => {
    setJobTypeData({
      ...jobTypeData,
      [name]: event.target.value,
    });
  };

  const submit = (event: React.FormEvent<any>) => {
    event.preventDefault();

    api
      .post(`/api/dicts/job-types/create`, jobTypeData)
      .then((res) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Роль успешно добавлена',
            type: 'success',
          },
        });

        handleChangeModal();
        dispatch(getAllJobTypes());
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
        <DialogTitle>Добавить вид работы</DialogTitle>
        <form id="job-type-form" action="" onSubmit={submit}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Код"
              variant="outlined"
              value={jobTypeData.code}
              onChange={handleChange('code')}
              required
            />

            <TextField
              className="input form__field"
              label="Наименование"
              variant="outlined"
              value={jobTypeData.name}
              onChange={handleChange('name')}
              required
            />

            <TextField
              className="input form__field"
              label="Гарантия (мес.)"
              variant="outlined"
              value={jobTypeData.monthsOfGuarantee}
              onChange={handleChange('monthsOfGuarantee')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Цена"
              variant="outlined"
              value={jobTypeData.price}
              onChange={handleChange('price')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Цена 1"
              variant="outlined"
              value={jobTypeData.price1}
              onChange={handleChange('price1')}
              type="number"
            />

            <TextField
              className="input form__field"
              label="Цена 2"
              variant="outlined"
              value={jobTypeData.price2}
              onChange={handleChange('price2')}
              type="number"
            />

            <TextField
              className="input form__field"
              label="Цена 3"
              variant="outlined"
              value={jobTypeData.price3}
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

export default CreateJobTypeModal;
