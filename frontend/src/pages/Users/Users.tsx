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
import { StoreModel, UsersItemModel } from '../../models/storeModel';
import { getUsers, setSearchField } from '../../store/actions/usersPageActions';
import SearchIcon from '@material-ui/icons/Search';
import EditIcon from '@material-ui/icons/Edit';
import Btn from '../../components/Btn';
import { formatDate } from '../../utils/formatDate';
import React, { useEffect, useState } from 'react';
import CreateUserModal from '../../components/modals/CreateUserModal';
import history from '../../utils/history';
import { SortModel } from '../../models/orderModel';
import TableSort from '../../components/TableSort';

const Users = () => {
  const dispatch = useDispatch();
  const usersList: UsersItemModel[] = useSelector(
    (store: StoreModel) => store.usersStore.usersList
  );
  const total: number = useSelector(
    (store: StoreModel) => store.usersStore.usersTotal
  );
  const searchField: string = useSelector(
    (store: StoreModel) => store.usersStore.searchField
  );
  const userRoleCode = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
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

  useEffect(() => {
    handleSearch();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setPagination({
      ...pagination,
      rowsPerPage: +event.target.value,
    });

    dispatch(
      getUsers(pagination.currentPage, +event.target.value, sort, searchField)
    );
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getUsers(page, pagination.rowsPerPage, sort, searchField));
  };

  const handleSearch = () => {
    dispatch(
      getUsers(
        pagination.currentPage,
        pagination.rowsPerPage,
        sort,
        searchField
      )
    );
  };

  const handleSearchChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    dispatch(setSearchField(event.target.value));
  };

  const editUser = (id: number) => {
    history.push(`/edit-user/${id}`);
  };

  const handleChangeSort = (property: string) => {
    setSort({
      order: sort.order === 'desc' ? 'asc' : 'desc',
      name: property,
    });

    dispatch(
      getUsers(
        pagination.currentPage,
        pagination.rowsPerPage,
        {
          order: sort.order === 'desc' ? 'asc' : 'desc',
          name: property,
        },
        searchField
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
          placeholder="Введите параметры поиска"
          inputProps={{ 'aria-label': 'Введите параметры поиска' }}
        />

        {(userRoleCode === 'SUPER_ADMIN' || userRoleCode === 'ADMIN') && (
          <CreateUserModal />
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
                  label="Имя"
                  sortBy="fullName"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Логин"
                  sortBy="login"
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
                  label="Роль"
                  sortBy="roleId"
                />
              </TableCell>
              <TableCell>Дата обновления</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {usersList.map((user, index) => (
              <TableRow key={user.id}>
                <TableCell>{user.id}</TableCell>
                <TableCell>{user.fullName}</TableCell>
                <TableCell>{user.login}</TableCell>
                <TableCell>{user.phone}</TableCell>
                <TableCell>{user.roleName}</TableCell>
                <TableCell>
                  {formatDate(user.updatedDate || '', true)}
                </TableCell>
                {(userRoleCode === 'SUPER_ADMIN' ||
                  userRoleCode === 'ADMIN') && (
                  <TableCell>
                    <IconButton
                      aria-label="edit"
                      onClick={() => editUser(user.id || index)}
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
        onPageChange={handleChangePage}
        onRowsPerPageChange={handleChangeRowsPerPage}
      />
    </>
  );
};

export default Users;
