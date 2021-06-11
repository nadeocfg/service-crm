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
import { StoreModel } from '../../models/storeModel';
import SearchIcon from '@material-ui/icons/Search';
import EditIcon from '@material-ui/icons/Edit';
import Btn from '../../components/Btn';
import { formatDate } from '../../utils/formatDate';
import React, { useState } from 'react';
import { getOrders } from '../../store/actions/ordersActions';
import AddIcon from '@material-ui/icons/Add';
import history from '../../utils/history';

const Orders = () => {
  const dispatch = useDispatch();
  const [searchField, setSearchField] = useState('');
  const [selectedOrder, setSelectedOrder] = useState({});
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
  });

  const userRoleCode = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );
  const orders = useSelector((store: StoreModel) => store.ordersStore.orders);
  const total = useSelector((store: StoreModel) => store.ordersStore.total);

  const handleSearch = () => {
    console.log('search');
  };

  const handleSearchChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setSearchField(event.target.value);
  };

  const editOrder = (order: any) => {
    setSelectedOrder(order);
  };

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setPagination({
      ...pagination,
      rowsPerPage: +event.target.value,
    });

    dispatch(
      getOrders(pagination.currentPage, +event.target.value, searchField)
    );
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getOrders(page, pagination.rowsPerPage, searchField));
  };

  const createOrderNav = () => {
    history.push('/orders/create');
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
          placeholder="Введите параметры поиска"
          inputProps={{ 'aria-label': 'Введите параметры поиска' }}
        />

        {(userRoleCode === 'SUPER_ADMIN' || userRoleCode === 'ADMIN') && (
          <Btn classes="btn btn_primary" onClick={createOrderNav}>
            <AddIcon />
            Добавить
          </Btn>
        )}
      </div>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>Имя</TableCell>
              <TableCell>Логин</TableCell>
              <TableCell>Телефон</TableCell>
              <TableCell>Роль</TableCell>
              <TableCell>Дата обновления</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {orders.map((order) => (
              <TableRow key={order.id}>
                <TableCell>{order.id}</TableCell>
                <TableCell>{order.fullName}</TableCell>
                <TableCell>{order.login}</TableCell>
                <TableCell>{order.phone}</TableCell>
                <TableCell>{order.roleName}</TableCell>
                <TableCell>{formatDate(order.updatedDate, true)}</TableCell>
                {(userRoleCode === 'SUPER_ADMIN' ||
                  userRoleCode === 'ADMIN') && (
                  <TableCell>
                    <IconButton
                      aria-label="edit"
                      onClick={() => editOrder(order)}
                    >
                      <EditIcon fontSize="inherit" />
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
        onChangePage={handleChangePage}
        onChangeRowsPerPage={handleChangeRowsPerPage}
      />
    </>
  );
};

export default Orders;
