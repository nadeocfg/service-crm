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
} from '@material-ui/core';
import { useDispatch, useSelector } from 'react-redux';
import { CustomerItemModel, StoreModel } from '../../models/storeModel';
import SearchIcon from '@material-ui/icons/Search';
import Btn from '../../components/Btn';
import { formatDate } from '../../utils/formatDate';
import React, { useEffect } from 'react';
import CreateCustomerModal from '../../components/modals/CreateCustomerModal';
import {
  SET_CUSTOMERS_PAGINATION,
  SET_CUSTOMERS_SEARCH_FIELD,
  SET_CUSTOMERS_SORT,
} from '../../store/storeConstants/customersConstants';
import { getCustomersList } from '../../store/actions/customersActions';
import ShoppingCartIcon from '@material-ui/icons/ShoppingCart';
import history from '../../utils/history';
import { SET_ORDER_DATA } from '../../store/storeConstants/ordersConstants';
import TableSort from '../../components/TableSort';
import UpdateCustomerModal from '../../components/UpdateCustomerModal';
import { Stack } from '@mui/material';

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
  const pagination = useSelector(
    (store: StoreModel) => store.customersStore.pagination
  );
  const sort = useSelector((store: StoreModel) => store.customersStore.sort);

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
    dispatch({
      type: SET_CUSTOMERS_PAGINATION,
      payload: {
        name: 'rowsPerPage',
        value: +event.target.value,
      },
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
    dispatch({
      type: SET_CUSTOMERS_PAGINATION,
      payload: {
        name: 'currentPage',
        value: page,
      },
    });

    dispatch(getCustomersList(page, pagination.rowsPerPage, searchField, sort));
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

    dispatch({
      type: SET_ORDER_DATA,
      payload: {
        name: 'boiler',
        value: customer.boiler,
      },
    });

    return history.push('/orders/create');
  };

  const handleChangeSort = (property: string) => {
    dispatch({
      type: SET_CUSTOMERS_SORT,
      payload: {
        order: sort.order === 'desc' ? 'asc' : 'desc',
        name: property,
      },
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
        <Btn className="btn btn_white" onClick={handleSearch}>
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
              <TableCell>Котел</TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Дата покупки"
                  sortBy="purchaseDate"
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
              <TableCell>Комментарий</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {customers.map((customer) => (
              <TableRow key={customer.id}>
                <TableCell>{customer.id}</TableCell>
                <TableCell>{customer.fullName}</TableCell>
                <TableCell>{customer.boilerSerial}</TableCell>
                <TableCell>{customer.boiler?.name || ''}</TableCell>
                <TableCell>{customer.purchaseDate || ''}</TableCell>
                <TableCell>{customer.phone}</TableCell>
                <TableCell>{customer.phone2}</TableCell>
                <TableCell>{customer.address}</TableCell>
                <TableCell>{customer.email}</TableCell>
                <TableCell>
                  {formatDate(customer.updatedDate || '', true)}
                </TableCell>
                <TableCell>{customer.comment}</TableCell>
                <TableCell>
                  {(userRoleCode === 'SUPER_ADMIN' ||
                    userRoleCode === 'ADMIN') && (
                    <Stack direction={'row'} alignItems={'center'}>
                      <UpdateCustomerModal
                        customer={customer}
                        pagination={pagination}
                        searchField={searchField}
                        sort={sort}
                      />

                      <IconButton
                        aria-label="edit"
                        onClick={() => createOrder(customer)}
                      >
                        <ShoppingCartIcon fontSize="inherit" />
                      </IconButton>
                    </Stack>
                  )}
                </TableCell>
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
        labelRowsPerPage="Записей на страницу"
      />
    </>
  );
};

export default Customers;
