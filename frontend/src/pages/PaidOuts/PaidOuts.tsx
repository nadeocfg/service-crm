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
import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import Btn from '../../components/Btn';
import { StoreModel } from '../../models/storeModel';
import SearchIcon from '@material-ui/icons/Search';
import { formatDate } from '../../utils/formatDate';
import { SET_PAID_OUTS_SEARCH_FIELD } from '../../store/storeConstants/paidOutsConstants';
import { getPaidOutsList } from '../../store/actions/paidOutsActions';
import VisibilityIcon from '@material-ui/icons/Visibility';
import history from '../../utils/history';

const PaidOuts = () => {
  const dispatch = useDispatch();
  const searchField = useSelector(
    (store: StoreModel) => store.paidOutsStore.searchField
  );
  const paidOutsList = useSelector(
    (store: StoreModel) => store.paidOutsStore.paidOutsList
  );
  const total = useSelector((store: StoreModel) => store.paidOutsStore.total);
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
  });

  useEffect(() => {
    dispatch(
      getPaidOutsList(
        pagination.currentPage,
        pagination.rowsPerPage,
        searchField
      )
    );

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleSearchChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    dispatch({
      type: SET_PAID_OUTS_SEARCH_FIELD,
      payload: event.target.value,
    });
  };

  const handleSearch = () => {
    dispatch(
      getPaidOutsList(
        pagination.currentPage,
        pagination.rowsPerPage,
        searchField
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
      getPaidOutsList(pagination.currentPage, +event.target.value, searchField)
    );
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getPaidOutsList(page, pagination.rowsPerPage, searchField));
  };

  const viewOrder = (orderId: number) => {
    history.push(`/orders/view/${orderId}`);
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
      </div>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>ФИО специалиста</TableCell>
              <TableCell>Номер заказа</TableCell>
              <TableCell>Сумма</TableCell>
              <TableCell>Дата обновления</TableCell>
              <TableCell>Статус</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {paidOutsList.map((paidOut) => (
              <TableRow key={paidOut.id}>
                <TableCell>{paidOut.id}</TableCell>
                <TableCell>{paidOut.fullName}</TableCell>
                <TableCell>{paidOut.orderId}</TableCell>
                <TableCell>{paidOut.sum}</TableCell>
                <TableCell>
                  {formatDate(paidOut.updatedDate || '', true)}
                </TableCell>
                <TableCell>
                  {paidOut.isPaid ? 'Выплачено' : 'Не выплачено'}
                </TableCell>
                <TableCell>
                  <IconButton
                    aria-label="view"
                    onClick={() => viewOrder(paidOut.orderId)}
                  >
                    <VisibilityIcon fontSize="inherit" />
                  </IconButton>
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
        onChangeRowsPerPage={handleChangeRowsPerPage}
      />
    </>
  );
};

export default PaidOuts;
