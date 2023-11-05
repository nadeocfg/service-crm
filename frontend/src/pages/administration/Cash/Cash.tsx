import {
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
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
  TextField,
  Tooltip,
} from '@material-ui/core';
import { useDispatch, useSelector } from 'react-redux';
import {
  CashListItemModel,
  SortModel,
  StoreModel,
} from '../../../models/storeModel';
import SearchIcon from '@material-ui/icons/Search';
import Btn from '../../../components/Btn';
import React, { useEffect, useState } from 'react';
import TableSort from '../../../components/TableSort';
import { SET_CASH_SEARCH_FIELD } from '../../../store/storeConstants/cashConstants';
import {
  getCashList,
  payToServiceMan,
  resetPaidSum,
} from '../../../store/actions/cashActions';
import { formatDate } from '../../../utils/formatDate';
import { formatSum } from '../../../utils/formatSum';
import AttachMoneyIcon from '@material-ui/icons/AttachMoney';
import RotateLeftIcon from '@material-ui/icons/RotateLeft';
import Transition from '../../../components/Transition';

const Cash = () => {
  const dispatch = useDispatch();
  const searchField = useSelector(
    (store: StoreModel) => store.cashStore.searchField
  );
  const userRoleCode = useSelector(
    (state: StoreModel) => state.userStore.authResponse.roleCode
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
  const [cashModal, setCashModal] = useState<{
    show: boolean;
    requestedAmount: number;
    cashItem: CashListItemModel | null;
  }>({
    show: false,
    requestedAmount: 0,
    cashItem: null,
  });
  const [resetModal, setResetModal] = useState<{
    show: boolean;
    cashItem: CashListItemModel | null;
  }>({
    show: false,
    cashItem: null,
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

  const pay = () => {
    dispatch(payToServiceMan(cashModal.cashItem, cashModal.requestedAmount));

    setCashModal({
      ...cashModal,
      cashItem: null,
      requestedAmount: 0,
      show: !cashModal.show,
    });
  };

  const reset = () => {
    dispatch(resetPaidSum(resetModal.cashItem?.id));

    setResetModal((prev) => {
      return {
        ...prev,
        show: false,
        cashItem: null,
      };
    });
  };

  const handleChangeResetModal = (cashItem?: CashListItemModel) => {
    if (cashItem) {
      setResetModal((prev) => {
        return {
          ...prev,
          show: !resetModal.show,
          cashItem: cashItem,
        };
      });
    } else {
      setResetModal((prev) => {
        return {
          ...prev,
          show: !resetModal.show,
        };
      });
    }
  };

  const handleChangeModal = (cashItem?: CashListItemModel) => {
    if (cashItem) {
      setCashModal({
        ...cashModal,
        cashItem,
        show: !cashModal.show,
      });
    } else {
      setCashModal({
        ...cashModal,
        cashItem: null,
        requestedAmount: 0,
        show: !cashModal.show,
      });
    }

    return true;
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setCashModal({
      ...cashModal,
      requestedAmount: +e.target.value,
    });
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
                <TableCell>
                  {(userRoleCode === 'ADMIN' ||
                    userRoleCode === 'SUPER_ADMIN') && (
                    <Tooltip title="Выплатить">
                      <span>
                        <IconButton
                          aria-label="view"
                          onClick={() => handleChangeModal(cash)}
                          disabled={cash.readySum <= 0}
                        >
                          <AttachMoneyIcon fontSize="inherit" />
                        </IconButton>
                      </span>
                    </Tooltip>
                  )}

                  {userRoleCode === 'SUPER_ADMIN' && (
                    <Tooltip title="Обнулить">
                      <span>
                        <IconButton
                          aria-label="view"
                          onClick={() => handleChangeResetModal(cash)}
                          disabled={cash.paidSum <= 0}
                        >
                          <RotateLeftIcon fontSize="inherit" />
                        </IconButton>
                      </span>
                    </Tooltip>
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

      <Dialog
        open={cashModal.show}
        TransitionComponent={Transition}
        keepMounted
        onClose={() => handleChangeModal(undefined)}
      >
        <DialogTitle>{`Введите сумму выплаты для ${cashModal.cashItem?.fullName}`}</DialogTitle>
        <DialogContent>
          <TextField
            className="input"
            label="Сумма выплаты"
            variant="outlined"
            value={cashModal.requestedAmount}
            onChange={handleChange}
            type="number"
            required
          />
        </DialogContent>
        <DialogActions className="btn-container">
          <Btn
            className="btn btn_white"
            onClick={() => handleChangeModal(undefined)}
          >
            Отмена
          </Btn>
          <Btn
            className="btn btn_primary"
            onClick={pay}
            disabled={cashModal.requestedAmount <= 0}
          >
            Выплатить
          </Btn>
        </DialogActions>
      </Dialog>

      <Dialog
        open={resetModal.show}
        TransitionComponent={Transition}
        keepMounted
        onClose={() => handleChangeResetModal(undefined)}
      >
        <DialogTitle>Подтвердите действие</DialogTitle>
        <DialogContent>
          <DialogContentText>
            {`Вы действительно хотите обнулить выплаченную сумму для ${resetModal.cashItem?.fullName}`}
          </DialogContentText>
        </DialogContent>
        <DialogActions className="btn-container">
          <Btn
            className="btn btn_white"
            onClick={() => handleChangeResetModal(undefined)}
          >
            Отмена
          </Btn>
          <Btn className="btn btn_danger" onClick={reset}>
            Обнулить
          </Btn>
        </DialogActions>
      </Dialog>
    </>
  );
};

export default Cash;
