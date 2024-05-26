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
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  TextField,
  FormControlLabel,
  Checkbox,
} from '@material-ui/core';
import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { StoreModel } from '../../../models/storeModel';
import { getAllBoilers } from '../../../store/actions/dictsActions';
import { formatDate } from '../../../utils/formatDate';
import EditIcon from '@material-ui/icons/Edit';
import CreateBoilerModal from '../../../components/modals/CreateBoilerModal';
import Transition from '../../../components/Transition';
import Btn from '../../../components/Btn';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';
import api from '../../../utils/axiosMiddleware';
import { Stack } from '@mui/material';
import { UserRolesEnum } from '../../../models/userModel';

const DictBoilers = () => {
  const dispatch = useDispatch();
  const userRoleCode = useSelector(
    (state: StoreModel) => state.userStore.authResponse.roleCode
  );
  const total = useSelector(
    (state: StoreModel) => state.dictsStore.dictBoilers.total
  );
  const boilers = useSelector(
    (state: StoreModel) => state.dictsStore.dictBoilers.boilers
  );
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
  });

  const [open, setOpen] = useState(false);
  const [boilerData, setBoilerData] = useState({
    article: '',
    name: '',
    price: 0,
    daysOfGuarantee: 0,
    quantity: 0,
    price1: 0,
    price2: 0,
    price3: 0,
    isActive: true,
  });

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange = (name: string) => (event: any) => {
    if (name === 'isActive') {
      return setBoilerData({
        ...boilerData,
        [name]: event.target.checked,
      });
    }

    setBoilerData({
      ...boilerData,
      [name]: event.target.value,
    });
  };

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setPagination({
      ...pagination,
      rowsPerPage: +event.target.value,
    });

    dispatch(getAllBoilers(pagination.currentPage, +event.target.value));
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getAllBoilers(page, pagination.rowsPerPage));
  };

  const updateBoiler = (event: any) => {
    event.preventDefault();

    api
      .post(`/api/dicts/boilers/update`, boilerData)
      .then((res) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Отопительный котел успешно добавлен',
            type: 'success',
          },
        });

        handleChangeModal();
        dispatch(getAllBoilers());
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
      });
  };

  const selectBoiler = (boiler: any) => {
    setBoilerData(boiler);
    handleChangeModal();
  };

  return (
    <>
      <div className="search-row">
        <h1>Отопительные котлы</h1>

        {(userRoleCode === UserRolesEnum.SUPER_ADMIN ||
          userRoleCode === UserRolesEnum.ADMIN) && <CreateBoilerModal />}
      </div>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>Артикул</TableCell>
              <TableCell>Наименование</TableCell>
              <TableCell>Цена</TableCell>
              <TableCell>Цена 1</TableCell>
              <TableCell>Цена 2</TableCell>
              <TableCell>Цена 3</TableCell>
              <TableCell>Гарантия (дни)</TableCell>
              <TableCell>Количество</TableCell>
              <TableCell>Дата обновления</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {boilers.map((boiler) => (
              <TableRow key={boiler.id}>
                <TableCell>{boiler.id}</TableCell>
                <TableCell>{boiler.article}</TableCell>
                <TableCell>{boiler.name}</TableCell>
                <TableCell>{boiler.price}</TableCell>
                <TableCell>{boiler.price1}</TableCell>
                <TableCell>{boiler.price2}</TableCell>
                <TableCell>{boiler.price3}</TableCell>
                <TableCell>{boiler.daysOfGuarantee}</TableCell>
                <TableCell>{boiler.quantity}</TableCell>
                <TableCell>
                  {formatDate(boiler.updatedDate || '', true)}
                </TableCell>
                <TableCell>
                  {(userRoleCode === UserRolesEnum.SUPER_ADMIN ||
                    userRoleCode === UserRolesEnum.ADMIN) && (
                    <Stack direction={'row'} alignItems={'center'}>
                      <IconButton
                        aria-label="edit"
                        onClick={() => selectBoiler(boiler)}
                      >
                        <EditIcon fontSize="inherit" />
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

      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleChangeModal}
      >
        <DialogTitle>Редактирование отопительного котла</DialogTitle>
        <form id="job-type-form" action="" onSubmit={updateBoiler}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Артикул"
              variant="outlined"
              value={boilerData.article}
              onChange={handleChange('article')}
              required
            />

            <TextField
              className="input form__field"
              label="Наименование"
              variant="outlined"
              value={boilerData.name}
              onChange={handleChange('name')}
              required
            />

            <TextField
              className="input form__field"
              label="Гарантия (дни)"
              variant="outlined"
              value={boilerData.daysOfGuarantee}
              onChange={handleChange('daysOfGuarantee')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Количество"
              variant="outlined"
              value={boilerData.quantity}
              onChange={handleChange('quantity')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Цена"
              variant="outlined"
              value={boilerData.price}
              onChange={handleChange('price')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Цена 1"
              variant="outlined"
              value={boilerData.price1}
              onChange={handleChange('price1')}
              type="number"
            />

            <TextField
              className="input form__field"
              label="Цена 2"
              variant="outlined"
              value={boilerData.price2}
              onChange={handleChange('price2')}
              type="number"
            />

            <TextField
              className="input form__field"
              label="Цена 3"
              variant="outlined"
              value={boilerData.price3}
              onChange={handleChange('price3')}
              type="number"
            />

            <FormControlLabel
              className="input form__field form__field_checkbox"
              control={
                <Checkbox
                  checked={boilerData.isActive}
                  onChange={handleChange('isActive')}
                  name="checkbox"
                  color="primary"
                />
              }
              label="Активный"
            />
          </DialogContent>
          <DialogActions className="btn-container">
            <Btn className="btn btn_white" onClick={handleChangeModal}>
              Отмена
            </Btn>
            <Btn className="btn btn_primary" type="submit">
              Сохранить
            </Btn>
          </DialogActions>
        </form>
      </Dialog>
    </>
  );
};

export default DictBoilers;
