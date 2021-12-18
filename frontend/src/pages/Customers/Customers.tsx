import {
  IconButton,
  InputBase,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TablePagination,
  TableRow,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  TextField,
  FormControlLabel,
  Checkbox,
} from '@material-ui/core';
import { useDispatch, useSelector } from 'react-redux';
import { CustomerItemModel, StoreModel } from '../../models/storeModel';
import SearchIcon from '@material-ui/icons/Search';
import EditIcon from '@material-ui/icons/Edit';
import Btn from '../../components/Btn';
import { formatDate } from '../../utils/formatDate';
import React, { useEffect, useState } from 'react';
import CreateCustomerModal from '../../components/modals/CreateCustomerModal';
import { SET_CUSTOMERS_SEARCH_FIELD } from '../../store/storeConstants/customersConstants';
import { getCustomersList } from '../../store/actions/customersActions';
import Transition from '../../components/Transition';
import api from '../../utils/axiosMiddleware';
import { setLoader } from '../../store/actions/mainActions';
import { ADD_NOTIFY } from '../../store/storeConstants/snackbarConstants';
import ReactInputMask from 'react-input-mask';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import history from '../../utils/history';
import { SET_ORDER_DATA } from '../../store/storeConstants/ordersConstants';
import TableSort from '../../components/TableSort';
import { SortModel } from '../../models/orderModel';

const Customers = () => {
  const dispatch = useDispatch();
  const searchField = useSelector(
    (store: StoreModel) => store.customersStore.searchValue
  );
  const customers = useSelector(
    (store: StoreModel) => store.customersStore.customers
  );
  const total = useSelector((store: StoreModel) => store.customersStore.total);
  const userRoleCode = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
  });
  const [open, setOpen] = useState(false);
  const [selectedCustomer, setSelectedCustomer] = useState<CustomerItemModel>({
    address: '',
    fullName: '',
    email: '',
    isActive: false,
    phone: '',
    phone2: '',
    boilerSerial: '',
  });
  const [sort, setSort] = useState<SortModel>({
    name: 'id',
    order: 'desc',
  });

  useEffect(() => {
    dispatch(
      getCustomersList(
        pagination.currentPage,
        pagination.rowsPerPage,
        searchField,
        sort
      )
    );

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleSearchChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    dispatch({
      type: SET_CUSTOMERS_SEARCH_FIELD,
      payload: event.target.value,
    });
  };

  const handleSearch = () => {
    dispatch(
      getCustomersList(
        pagination.currentPage,
        pagination.rowsPerPage,
        searchField,
        sort
      )
    );
  };

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setPagination({
      ...pagination,
      rowsPerPage: +event.target.value,
    });

    dispatch(
      getCustomersList(
        pagination.currentPage,
        +event.target.value,
        searchField,
        sort
      )
    );
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getCustomersList(page, pagination.rowsPerPage, searchField, sort));
  };

  const handleChangeModal = (customer?: CustomerItemModel) => {
    if (customer) {
      setSelectedCustomer({ ...customer });
    } else {
      setSelectedCustomer({
        address: '',
        fullName: '',
        email: '',
        isActive: false,
        phone: '',
        phone2: '',
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

        dispatch(
          getCustomersList(
            pagination.currentPage,
            pagination.rowsPerPage,
            searchField,
            sort
          )
        );
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

  const createOrder = (customer: CustomerItemModel) => {
    dispatch({
      type: SET_ORDER_DATA,
      payload: {
        name: 'customer',
        value: customer,
      },
    });

    dispatch({
      type: SET_ORDER_DATA,
      payload: {
        name: 'address',
        value: customer.address,
      },
    });

    dispatch({
      type: SET_ORDER_DATA,
      payload: {
        name: 'phone',
        value: customer.phone,
      },
    });

    return history.push('/orders/create');
  };

  const handleChangeSort = (property: string) => {
    setSort({
      order: sort.order === 'desc' ? 'asc' : 'desc',
      name: property,
    });

    dispatch(
      getCustomersList(
        pagination.currentPage,
        pagination.rowsPerPage,
        searchField,
        {
          order: sort.order === 'desc' ? 'asc' : 'desc',
          name: property,
        }
      )
    );
  };

  return (
    <>
      <div className="search-row">
        <Btn classes="btn btn_white" onClick={handleSearch}>
          <SearchIcon />
          Поиск
        </Btn>

        <InputBase
          value={searchField}
          onChange={handleSearchChange}
          placeholder="Введите параметры поиска (ID, ФИО, Серийный номер, Телефон, Адрес, Email)"
          inputProps={{ 'aria-label': 'Введите параметры поиска' }}
        />

        <CreateCustomerModal />
      </div>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="ID"
                  sortBy="id"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="ФИО"
                  sortBy="fullName"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Серийный номер"
                  sortBy="boilerSerial"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Телефон"
                  sortBy="phone"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Телефон 2"
                  sortBy="phone2"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Адрес"
                  sortBy="address"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Email"
                  sortBy="email"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Дата обновления"
                  sortBy="updatedDate"
                />
              </TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {customers.map((customer) => (
              <TableRow key={customer.id}>
                <TableCell>{customer.id}</TableCell>
                <TableCell>{customer.fullName}</TableCell>
                <TableCell>{customer.boilerSerial}</TableCell>
                <TableCell>{customer.phone}</TableCell>
                <TableCell>{customer.phone2}</TableCell>
                <TableCell>{customer.address}</TableCell>
                <TableCell>{customer.email}</TableCell>
                <TableCell>
                  {formatDate(customer.updatedDate || '', true)}
                </TableCell>
                {(userRoleCode === 'SUPER_ADMIN' ||
                  userRoleCode === 'ADMIN') && (
                  <TableCell>
                    <IconButton
                      aria-label="edit"
                      onClick={() => handleChangeModal(customer)}
                    >
                      <EditIcon fontSize="inherit" />
                    </IconButton>
                    <IconButton
                      aria-label="edit"
                      onClick={() => createOrder(customer)}
                    >
                      <ShoppingCartIcon fontSize="inherit" />
                    </IconButton>
                  </TableCell>
                )}
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>

      <TablePagination
        rowsPerPageOptions={pagination.rowsPerPageOptions}
        component="div"
        count={total}
        rowsPerPage={pagination.rowsPerPage}
        page={pagination.currentPage}
        onPageChange={handleChangePage}
        onRowsPerPageChange={handleChangeRowsPerPage}
      />

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
              label="Адрес"
              variant="outlined"
              value={selectedCustomer.address}
              onChange={handleChange('address')}
              required
            />

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
              label="Серийный номер 1"
              variant="outlined"
              value={selectedCustomer.boilerSerial}
              onChange={handleChange('boilerSerial')}
              required
            />

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
            <Btn classes="btn btn_white" onClick={() => handleChangeModal()}>
              Отмена
            </Btn>
            <Btn classes="btn btn_primary" type="submit">
              Сохранить
            </Btn>
          </DialogActions>
        </form>
      </Dialog>
    </>
  );
};

export default Customers;
