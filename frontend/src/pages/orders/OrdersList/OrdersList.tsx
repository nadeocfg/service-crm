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
import { StoreModel } from '../../../models/storeModel';
import SearchIcon from '@material-ui/icons/Search';
import EditIcon from '@material-ui/icons/Edit';
import VisibilityIcon from '@material-ui/icons/Visibility';
import Btn from '../../../components/Btn';
import { formatDate } from '../../../utils/formatDate';
import React, { useEffect, useState } from 'react';
import { getOrders } from '../../../store/actions/ordersActions';
import AddIcon from '@material-ui/icons/Add';
import history from '../../../utils/history';
import { OrderItemModel, SortModel } from '../../../models/orderModel';
import { SET_ORDERS_SEARCH_FIELD } from '../../../store/storeConstants/ordersConstants';
import TableSort from '../../../components/TableSort';

const OrdersList = () => {
  const dispatch = useDispatch();
  const searchField = useSelector(
    (store: StoreModel) => store.ordersStore.searchValue
  );
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
  });
  const [sort, setSort] = useState<SortModel>({
    name: 'id',
    order: 'desc',
  });

  const userRoleCode = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );
  const orders = useSelector((store: StoreModel) => store.ordersStore.orders);
  const total = useSelector((store: StoreModel) => store.ordersStore.total);

  useEffect(() => {
    dispatch(
      getOrders(
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
      type: SET_ORDERS_SEARCH_FIELD,
      payload: event.target.value,
    });
  };

  const handleSearch = () => {
    dispatch(
      getOrders(
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
      getOrders(pagination.currentPage, +event.target.value, searchField, sort)
    );
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getOrders(page, pagination.rowsPerPage, searchField, sort));
  };

  const createOrderNav = () => {
    history.push('/orders/create');
  };

  const viewOrder = (order: OrderItemModel) => {
    history.push(`/orders/view/${order.id}`);
  };

  const editOrder = (order: OrderItemModel) => {
    history.push(`/orders/edit/${order.id}`);
  };

  const handleChangeSort = (property: string) => {
    setSort({
      order: sort.order === 'desc' ? 'asc' : 'desc',
      name: property,
    });

    dispatch(
      getOrders(pagination.currentPage, pagination.rowsPerPage, searchField, {
        order: sort.order === 'desc' ? 'asc' : 'desc',
        name: property,
      })
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
          placeholder="Введите параметры поиска (ФИО клиента, ID, Адрес, ФИО специалиста, Комментарий)"
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
                  label="ФИО клиента"
                  sortBy="fullName"
                />
              </TableCell>
              <TableCell>Адрес</TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Дата"
                  sortBy="createdDate"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Фио специалиста"
                  sortBy="serviceManFullName"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Статус"
                  sortBy="name"
                />
              </TableCell>
              <TableCell>Комментарий</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {orders.map((order: OrderItemModel) => (
              <TableRow key={order.id}>
                <TableCell>{order.id}</TableCell>
                <TableCell>{order.customer.fullName}</TableCell>
                <TableCell>{order.address}</TableCell>
                <TableCell>{formatDate(order.createdDate, true)}</TableCell>
                <TableCell>{order.serviceMan.fullName}</TableCell>
                <TableCell>{order.statusName}</TableCell>
                <TableCell>{order.comment}</TableCell>
                <TableCell>
                  <IconButton
                    aria-label="view"
                    onClick={() => viewOrder(order)}
                  >
                    <VisibilityIcon fontSize="inherit" />
                  </IconButton>

                  {(userRoleCode === 'SUPER_ADMIN' ||
                    userRoleCode === 'ADMIN') && (
                    <IconButton
                      aria-label="edit"
                      onClick={() => editOrder(order)}
                    >
                      <EditIcon fontSize="inherit" />
                    </IconButton>
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
      />
    </>
  );
};

export default OrdersList;
