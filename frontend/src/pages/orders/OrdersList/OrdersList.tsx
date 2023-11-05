import {
  IconButton,
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
import EditIcon from '@material-ui/icons/Edit';
import VisibilityIcon from '@material-ui/icons/Visibility';
import { formatDate } from '../../../utils/formatDate';
import React, { ChangeEvent, useEffect, useState } from 'react';
import { getOrders } from '../../../store/actions/ordersActions';
import history from '../../../utils/history';
import { OrderItemModel } from '../../../models/orderModel';
import {
  SET_ORDERS_PAGINATION,
  SET_ORDERS_SEARCH_FIELD,
  SET_ORDERS_SORT,
} from '../../../store/storeConstants/ordersConstants';
import TableSort from '../../../components/TableSort';
import { OrdersSearchPanel } from '../../../components/OrdersSearchPanel';
import { Stack } from '@mui/material';
import { FilterProps } from '../../../components/OrdersSearchPanel/OrdersSearchPanel';

const OrdersList = () => {
  const dispatch = useDispatch();
  const searchField = useSelector(
    (store: StoreModel) => store.ordersStore.searchValue
  );

  const userRoleCode = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );
  const orders = useSelector((store: StoreModel) => store.ordersStore.orders);
  const total = useSelector((store: StoreModel) => store.ordersStore.total);
  const pagination = useSelector(
    (store: StoreModel) => store.ordersStore.pagination
  );
  const sort = useSelector((store: StoreModel) => store.ordersStore.sort);
  const [selectedFilters, setSelectedFilters] = useState<FilterProps>({
    users: [],
    statuses: [],
    fromDate: '',
    toDate: '',
  });

  useEffect(() => {
    if (history.location.search) {
      dispatch(getOrders(history.location.search));
    }

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [history.location.search]);

  useEffect(() => {
    applyFilters();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [pagination.currentPage, pagination.rowsPerPage, sort.name, sort.order]);

  const handleSearchChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    dispatch({
      type: SET_ORDERS_SEARCH_FIELD,
      payload: event.target.value,
    });
  };

  const applyFilters = () => {
    const users = selectedFilters.users.map((user) => user.id).join(',');
    const statuses = selectedFilters.statuses
      .map((status) => status.id)
      .join(',');

    const searchParams = new URLSearchParams({
      users,
      statuses,
      fromDate: selectedFilters.fromDate,
      toDate: selectedFilters.toDate,
      sort: `${sort.name},${sort.order}`,
      searchField,
      page: String(pagination.currentPage),
      count: String(pagination.rowsPerPage),
    }).toString();

    history.replace({
      search: searchParams,
    });
  };

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    dispatch({
      type: SET_ORDERS_PAGINATION,
      payload: {
        name: 'rowsPerPage',
        value: +event.target.value,
      },
    });
  };

  const handleChangePage = (event: any, page: number) => {
    dispatch({
      type: SET_ORDERS_PAGINATION,
      payload: {
        name: 'currentPage',
        value: page,
      },
    });
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
    dispatch({
      type: SET_ORDERS_SORT,
      payload: {
        order: sort.order === 'desc' ? 'asc' : 'desc',
        name: property,
      },
    });
  };

  const onSelect =
    (key: keyof typeof selectedFilters) =>
    (
      event: ChangeEvent<{
        name?: string | undefined;
        value: unknown;
      }>
    ) => {
      setSelectedFilters((prev) => {
        return {
          ...prev,
          [key]: event.target.value,
        };
      });
    };

  return (
    <>
      <OrdersSearchPanel
        addFunction={createOrderNav}
        handleChangeSearch={handleSearchChange}
        searchField={searchField}
        label="Введите параметры поиска (ФИО клиента, ID, Адрес, ФИО специалиста, Комментарий, Статус заказа, Наименование котла)"
        onSearch={applyFilters}
        selectedFilters={selectedFilters}
        onSelect={onSelect}
      />

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
                  label="Наименование котла"
                  sortBy="boilerName"
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
                  sortBy="statusName"
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
                <TableCell>{order.customer.boilerSerial}</TableCell>
                <TableCell>{order.boilerName}</TableCell>
                <TableCell>{order.address}</TableCell>
                <TableCell>{formatDate(order.createdDate, true)}</TableCell>
                <TableCell>{order.serviceMan.fullName}</TableCell>
                <TableCell>{order.statusName}</TableCell>
                <TableCell>{order.comment}</TableCell>
                <TableCell>
                  <Stack direction={'row'} alignItems={'center'}>
                    <IconButton
                      aria-label="view"
                      onClick={() => viewOrder(order)}
                    >
                      <VisibilityIcon fontSize="inherit" />
                    </IconButton>

                    {(userRoleCode === 'SUPER_ADMIN' ||
                      userRoleCode === 'ADMIN') &&
                      order.statusCode !== 'DONE' &&
                      order.statusCode !== 'CANCELED' && (
                        <IconButton
                          aria-label="edit"
                          onClick={() => editOrder(order)}
                        >
                          <EditIcon fontSize="inherit" />
                        </IconButton>
                      )}
                  </Stack>
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

export default OrdersList;
