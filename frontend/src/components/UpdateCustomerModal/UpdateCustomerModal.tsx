import {
  Checkbox,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControlLabel,
  IconButton,
  TextField,
} from '@material-ui/core';
import { useState } from 'react';
import ReactInputMask from 'react-input-mask';
import { useDispatch, useSelector } from 'react-redux';
import {
  CustomerItemModel,
  SortModel,
  StoreModel,
} from '../../models/storeModel';
import { getCustomersList } from '../../store/actions/customersActions';
import { getAllBoilers } from '../../store/actions/dictsActions';
import { setLoader } from '../../store/actions/mainActions';
import { ADD_NOTIFY } from '../../store/storeConstants/snackbarConstants';
import api from '../../utils/axiosMiddleware';
import Btn from '../Btn';
import SelectModal from '../modals/SelectModal';
import Transition from '../Transition';
import EditIcon from '@material-ui/icons/Edit';
import moment from 'moment';

interface UpdateCustomerModalProps {
  pagination?: any;
  searchField?: string;
  sort?: SortModel;
  customer?: any;
  callback?: Function;
}

export default function UpdateCustomerModal({
  pagination,
  searchField,
  sort,
  customer,
  callback,
}: UpdateCustomerModalProps) {
  const dispatch = useDispatch();
  const [open, setOpen] = useState(false);
  const [selectedCustomer, setSelectedCustomer] = useState<CustomerItemModel>({
    address: '',
    fullName: '',
    email: '',
    isActive: false,
    phone: '',
    phone2: '',
    boilerSerial: '',
    boiler: {},
    purchaseDate: '',
    comment: '',
  });
  const [selectModal, setSelectModal] = useState(false);
  const boilersList = useSelector(
    (store: StoreModel) => store.dictsStore.dictBoilers.boilers
  );

  const handleChangeModal = (customer?: CustomerItemModel) => {
    if (customer) {
      setSelectedCustomer({ ...customer });
      getBoilers('');
    } else {
      setSelectedCustomer({
        address: '',
        fullName: '',
        email: '',
        isActive: false,
        phone: '',
        phone2: '',
        boiler: {},
        purchaseDate: '',
        comment: '',
      });
    }

    setOpen(!open);
  };

  const handleChange = (name: string) => (event: React.ChangeEvent<any>) => {
    if (name === 'isActive') {
      return setSelectedCustomer({
        ...selectedCustomer,
        [name]: event.target.checked,
      });
    }

    setSelectedCustomer({
      ...selectedCustomer,
      [name]: event.target.value,
    });
  };

  const updateCustomer = (event: any) => {
    event.preventDefault();

    dispatch(setLoader(true));

    const date = moment(selectedCustomer.purchaseDate, 'DD/MM/YYYY').isValid();

    if (!date) {
      dispatch(setLoader(false));

      dispatch({
        type: ADD_NOTIFY,
        payload: {
          message: 'Неправильная дата',
          type: 'error',
        },
      });

      return false;
    }

    selectedCustomer.purchaseDate = moment(
      selectedCustomer.purchaseDate,
      'DD/MM/YYYY'
    ).format('YYYY-MM-DD');

    api
      .post(`/api/customers/update`, selectedCustomer)
      .then((res) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Клиент успешно обновлен',
            type: 'success',
          },
        });

        handleChangeModal();

        if (pagination && sort) {
          dispatch(
            getCustomersList(
              pagination.currentPage,
              pagination.rowsPerPage,
              searchField,
              sort
            )
          );
        }

        if (callback) {
          callback();
        }
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
  };

  const changeModal = () => {
    setSelectModal(!selectModal);
  };

  const onSelect = (name: string, value: any) => {
    setSelectedCustomer({
      ...selectedCustomer,
      boiler: value,
    });
  };

  const getBoilers = (searchValue: string) => {
    dispatch(getAllBoilers(0, 20, searchValue));
  };

  return (
    <>
      <IconButton aria-label="edit" onClick={() => handleChangeModal(customer)}>
        <EditIcon fontSize="inherit" />
      </IconButton>

      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={() => handleChangeModal()}
      >
        <DialogTitle>Редактирование клиента</DialogTitle>
        <form id="job-type-form" action="" onSubmit={updateCustomer}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Email"
              variant="outlined"
              value={selectedCustomer.email}
              onChange={handleChange('email')}
              type="email"
            />

            <TextField
              className="input form__field"
              label="ФИО"
              variant="outlined"
              value={selectedCustomer.fullName}
              onChange={handleChange('fullName')}
              required
            />

            <TextField
              className="input form__field"
              label="Серийный номер"
              variant="outlined"
              value={selectedCustomer.boilerSerial}
              onChange={handleChange('boilerSerial')}
              required
            />

            <TextField
              className="input form__field"
              label="Котел"
              variant="outlined"
              onClick={changeModal}
              onKeyUp={changeModal}
              value={selectedCustomer.boiler?.name || ''}
              required
            />

            <ReactInputMask
              mask="99/99/9999"
              value={selectedCustomer.purchaseDate}
              onChange={handleChange('purchaseDate')}
            >
              <TextField
                className="input form__field"
                label="Дата покупки"
                variant="outlined"
              />
            </ReactInputMask>

            <ReactInputMask
              mask="+7 (999) 999-99-99"
              onChange={handleChange('phone')}
              value={selectedCustomer.phone}
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
              value={selectedCustomer.phone2}
            >
              <TextField
                className="input form__field"
                label="Телефон 2"
                variant="outlined"
              />
            </ReactInputMask>

            <TextField
              className="input form__field"
              label="Адрес"
              variant="outlined"
              value={selectedCustomer.address}
              onChange={handleChange('address')}
              required
            />

            <TextField
              className="input form__field"
              label="Комментарий"
              variant="outlined"
              value={selectedCustomer.comment}
              onChange={handleChange('comment')}
            />

            <FormControlLabel
              className="input form__field form__field_checkbox"
              control={
                <Checkbox
                  checked={selectedCustomer.isActive}
                  onChange={handleChange('isActive')}
                  name="checkbox"
                  color="primary"
                />
              }
              label="Активный"
            />
          </DialogContent>
          <DialogActions className="btn-container">
            <Btn className="btn btn_white" onClick={() => handleChangeModal()}>
              Отмена
            </Btn>
            <Btn className="btn btn_primary" type="submit">
              Сохранить
            </Btn>
          </DialogActions>
        </form>
      </Dialog>

      <SelectModal
        open={selectModal}
        handleChangeModal={changeModal}
        onSelect={onSelect}
        title={'Выберите котел'}
        handleChange={getBoilers}
        items={boilersList}
        fieldName={'boiler'}
      />
    </>
  );
}
