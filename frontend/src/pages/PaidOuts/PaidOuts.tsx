import {
  Dialog,
  DialogActions,
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
} from '@material-ui/core';
import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import Btn from '../../components/Btn';
import { PaidOutsItemModel, StoreModel } from '../../models/storeModel';
import SearchIcon from '@material-ui/icons/Search';
import { formatDate } from '../../utils/formatDate';
import { SET_PAID_OUTS_SEARCH_FIELD } from '../../store/storeConstants/paidOutsConstants';
import { getPaidOutsList } from '../../store/actions/paidOutsActions';
import VisibilityIcon from '@material-ui/icons/Visibility';
import AttachMoneyIcon from '@material-ui/icons/AttachMoney';
import history from '../../utils/history';
import Transition from '../../components/Transition';
import { formatSum } from '../../utils/formatSum';
import api from '../../utils/axiosMiddleware';
import { ADD_NOTIFY } from '../../store/storeConstants/snackbarConstants';
import { setLoader } from '../../store/actions/mainActions';

const PaidOuts = () => {
  const dispatch = useDispatch();
  const searchField = useSelector(
    (store: StoreModel) => store.paidOutsStore.searchField
  );
  const paidOutsList = useSelector(
    (store: StoreModel) => store.paidOutsStore.paidOutsList
  );
  const userRoleCode = useSelector(
    (state: StoreModel) => state.userStore.authResponse.roleCode
  );
  const total = useSelector((store: StoreModel) => store.paidOutsStore.total);
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
  });
  const [paidModal, setPaidModal] = useState<{
    paidOut: null | PaidOutsItemModel;
    show: boolean;
  }>({
    paidOut: null,
    show: false,
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

  const initPay = (paidOut: PaidOutsItemModel) => {
    setPaidModal({
      paidOut,
      show: !paidModal.show,
    });
  };

  const handleChangeModal = () => {
    setPaidModal({
      ...paidModal,
      show: !paidModal.show,
    });
  };

  const paid = () => {
    dispatch(setLoader(true));

    const data = {
      paidOutId: paidModal.paidOut?.id,
    };

    api
      .post(`/api/paids`, data)
      .then((res) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Выплата успешно сохранена',
            type: 'success',
          },
        });

        handleChangeModal();
        dispatch(
          getPaidOutsList(
            pagination.currentPage,
            pagination.rowsPerPage,
            searchField
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
              <TableCell>Дата завершения заказа</TableCell>
              <TableCell>Статус выплаты</TableCell>
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
                <TableCell>{formatSum(paidOut.sum)}</TableCell>
                <TableCell>
                  {formatDate(paidOut.doneDate || '', true)}
                </TableCell>
                <TableCell>
                  {paidOut.isPaid ? 'Переведена' : 'Не переведена'}
                </TableCell>
                <TableCell>
                  {paidOut.canBePaid
                    ? 'Готова к переводу'
                    : 'Не готова к переводу'}
                </TableCell>
                <TableCell>
                  <IconButton
                    aria-label="view"
                    onClick={() => viewOrder(paidOut.orderId)}
                  >
                    <VisibilityIcon fontSize="inherit" />
                  </IconButton>
                  {(userRoleCode === 'ADMIN' ||
                    userRoleCode === 'SUPER_ADMIN') &&
                    paidOut.canBePaid &&
                    !paidOut.isPaid && (
                      <IconButton
                        aria-label="view"
                        onClick={() => initPay(paidOut)}
                      >
                        <AttachMoneyIcon fontSize="inherit" />
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

      <Dialog
        open={paidModal.show}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleChangeModal}
      >
        <DialogTitle>{`Сделать перевод ${formatSum(
          paidModal.paidOut?.sum || 0
        )} на общий счет ${paidModal.paidOut?.fullName} ?`}</DialogTitle>
        <DialogActions className="btn-container">
          <Btn classes="btn btn_white" onClick={handleChangeModal}>
            Отмена
          </Btn>
          <Btn classes="btn btn_primary" onClick={paid}>
            Перевести
          </Btn>
        </DialogActions>
      </Dialog>
    </>
  );
};

export default PaidOuts;
