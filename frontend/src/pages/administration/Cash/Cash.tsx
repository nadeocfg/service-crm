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
import { StoreModel } from '../../../models/storeModel';
import SearchIcon from '@material-ui/icons/Search';
import Btn from '../../../components/Btn';
import React, { useEffect, useState } from 'react';
import CreateCustomerModal from '../../../components/modals/CreateCustomerModal';
import TableSort from '../../../components/TableSort';
import { SortModel } from '../../../models/orderModel';
import { SET_CASH_SEARCH_FIELD } from '../../../store/storeConstants/cashConstants';
import { getCashList } from '../../../store/actions/cashActions';
import { formatDate } from '../../../utils/formatDate';
import { formatSum } from '../../../utils/formatSum';

const Cash = () => {
  const dispatch = useDispatch();
  const searchField = useSelector(
    (store: StoreModel) => store.cashStore.searchField
  );
  const total = useSelector((store: StoreModel) => store.cashStore.total);
  const cashList = useSelector((store: StoreModel) => store.cashStore.cashList);
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
    dispatch(
      getCashList(
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
      type: SET_CASH_SEARCH_FIELD,
      payload: event.target.value,
    });
  };

  const handleSearch = () => {
    dispatch(
      getCashList(
        pagination.currentPage,
        pagination.rowsPerPage,
        searchField,
        sort
      )
    );
  };

  const handleChangeSort = (property: string) => {
    setSort({
      order: sort.order === 'desc' ? 'asc' : 'desc',
      name: property,
    });

    dispatch(
      getCashList(pagination.currentPage, pagination.rowsPerPage, searchField, {
        order: sort.order === 'desc' ? 'asc' : 'desc',
        name: property,
      })
    );
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getCashList(page, pagination.rowsPerPage, searchField, sort));
  };

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setPagination({
      ...pagination,
      rowsPerPage: +event.target.value,
    });

    dispatch(
      getCashList(
        pagination.currentPage,
        +event.target.value,
        searchField,
        sort
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
                  label="Сумма готовая к выплате"
                  sortBy="readySum"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Сумма не готовая к выплате"
                  sortBy="notReadySum"
                />
              </TableCell>
              <TableCell>
                <TableSort
                  sort={sort}
                  handleChangeSort={handleChangeSort}
                  label="Выплаченная сумма"
                  sortBy="paidSum"
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
            {cashList.map((cash) => (
              <TableRow key={cash.id}>
                <TableCell>{cash.id}</TableCell>
                <TableCell>{cash.fullName}</TableCell>
                <TableCell>{formatSum(cash.readySum)}</TableCell>
                <TableCell>{formatSum(cash.notReadySum)}</TableCell>
                <TableCell>{formatSum(cash.paidSum)}</TableCell>
                <TableCell>
                  {formatDate(cash.updatedDate || '', true)}
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

export default Cash;
