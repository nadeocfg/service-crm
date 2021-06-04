import {
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
import Btn from '../../components/Btn';
import AddIcon from '@material-ui/icons/Add';
import { formatDate } from '../../utils/formatDate';
import React, { useEffect, useState } from 'react';

const Users = () => {
  const dispatch = useDispatch();
  const usersList: UsersItemModel[] = useSelector(
    (store: StoreModel) => store.usersStore.usersList
  );
  const total: number = useSelector(
    (store: StoreModel) => store.usersStore.usersTotal
  );
  const serachField: string = useSelector(
    (store: StoreModel) => store.usersStore.searchField
  );
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
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
      getUsers(pagination.currentPage, +event.target.value, serachField)
    );
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getUsers(page, pagination.rowsPerPage, serachField));
  };

  const handleSearch = () => {
    dispatch(
      getUsers(pagination.currentPage, pagination.rowsPerPage, serachField)
    );
  };

  const handleSearchChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    dispatch(setSearchField(event.target.value));
  };

  return (
    <>
      <div className="search-row">
        <Btn classes="btn btn_white" onClick={handleSearch}>
          <SearchIcon />
          Поиск
        </Btn>

        <InputBase
          value={serachField}
          onChange={handleSearchChange}
          placeholder="Введите параметры поиска"
          inputProps={{ 'aria-label': 'Введите параметры поиска' }}
        />

        <Btn classes="btn btn_primary" onClick={handleSearch}>
          <AddIcon />
          Создать
        </Btn>
      </div>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>Имя</TableCell>
              <TableCell>Логин</TableCell>
              <TableCell>Телефон</TableCell>
              <TableCell>Дата обновления</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {usersList.map((user) => (
              <TableRow key={user.id}>
                <TableCell>{user.id}</TableCell>
                <TableCell>{`${user.firstName} ${user.lastName}`}</TableCell>
                <TableCell>{user.login}</TableCell>
                <TableCell>{user.phone}</TableCell>
                <TableCell>{formatDate(user.updatedDate, true)}</TableCell>
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

export default Users;
