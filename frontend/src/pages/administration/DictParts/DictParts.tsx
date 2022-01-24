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
import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { PartItemModel, StoreModel } from '../../../models/storeModel';
import { getAllParts } from '../../../store/actions/dictsActions';
import { formatDate } from '../../../utils/formatDate';
import EditIcon from '@material-ui/icons/Edit';
import Transition from '../../../components/Transition';
import Btn from '../../../components/Btn';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';
import api from '../../../utils/axiosMiddleware';
import CreatePartModal from '../../../components/modals/CreatePartModal';

const DictParts = () => {
  const dispatch = useDispatch();
  const userRoleCode = useSelector(
    (state: StoreModel) => state.userStore.authResponse.roleCode
  );
  const total = useSelector(
    (state: StoreModel) => state.dictsStore.dictParts.total
  );
  const parts = useSelector(
    (state: StoreModel) => state.dictsStore.dictParts.parts
  );
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
  });

  const [open, setOpen] = useState(false);
  const [partData, setPartData] = useState<PartItemModel>();

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange = (name: string) => (event: any) => {
    if (name === 'isActive') {
      return setPartData({
        ...partData,
        [name]: event.target.checked,
      });
    }

    setPartData({
      ...partData,
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

    dispatch(getAllParts(pagination.currentPage, +event.target.value));
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getAllParts(page, pagination.rowsPerPage));
  };

  const updatePart = (event: any) => {
    event.preventDefault();

    api
      .post(`/api/dicts/parts/update`, partData)
      .then((res) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Отопительный котел успешно добавлен',
            type: 'success',
          },
        });

        handleChangeModal();
        dispatch(getAllParts());
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

  const selectPart = (boiler: any) => {
    setPartData(boiler);
    handleChangeModal();
  };

  const handleChangePrice =
    (index: number) => (e: React.ChangeEvent<HTMLInputElement>) => {
      if (partData && partData?.prices && partData?.prices[index]) {
        setPartData({
          ...partData,
          prices: partData.prices.map((item, i) => {
            if (i === index) {
              item.value = +e.target.value;
            }

            return item;
          }),
        });
      }
    };

  return (
    <>
      <div className="search-row">
        <h1>Запчасти</h1>

        {(userRoleCode === 'SUPER_ADMIN' || userRoleCode === 'ADMIN') && (
          <CreatePartModal />
        )}
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
            {parts.map((part) => (
              <TableRow key={part.id}>
                <TableCell>{part.id}</TableCell>
                <TableCell>{part.article}</TableCell>
                <TableCell>{part.name}</TableCell>
                {(part.prices || []).map((item) => (
                  <TableCell>{item.value}</TableCell>
                ))}
                <TableCell>{part.daysOfGuarantee}</TableCell>
                <TableCell>{part.quantity}</TableCell>
                <TableCell>
                  {formatDate(part.updatedDate || '', true)}
                </TableCell>
                {(userRoleCode === 'SUPER_ADMIN' ||
                  userRoleCode === 'ADMIN') && (
                  <TableCell>
                    <IconButton
                      aria-label="edit"
                      onClick={() => selectPart(part)}
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

      <Dialog
        open={open}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleChangeModal}
      >
        <DialogTitle>Редактирование запчасти</DialogTitle>
        <form id="job-type-form" action="" onSubmit={updatePart}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Артикул"
              variant="outlined"
              value={partData?.article || ''}
              onChange={handleChange('article')}
              required
            />

            <TextField
              className="input form__field"
              label="Наименование"
              variant="outlined"
              value={partData?.name || ''}
              onChange={handleChange('name')}
              required
            />

            <TextField
              className="input form__field"
              label="Гарантия (дни)"
              variant="outlined"
              value={partData?.daysOfGuarantee || ''}
              onChange={handleChange('daysOfGuarantee')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Количество"
              variant="outlined"
              value={partData?.quantity || ''}
              onChange={handleChange('quantity')}
              type="number"
              required
            />

            {partData?.prices?.map((item, index) => (
              <TextField
                key={index}
                className="input form__field"
                label={item.name}
                variant="outlined"
                value={item?.value || 0}
                onChange={handleChangePrice(index)}
                type="number"
                required
              />
            ))}

            <FormControlLabel
              className="input form__field form__field_checkbox"
              control={
                <Checkbox
                  checked={partData?.isActive || false}
                  onChange={handleChange('isActive')}
                  name="checkbox"
                  color="primary"
                />
              }
              label="Активный"
            />
          </DialogContent>
          <DialogActions className="btn-container">
            <Btn classes="btn btn_white" onClick={handleChangeModal}>
              Отмена
            </Btn>
            <Btn classes="btn btn_primary" type="submit">
              Сохранить
            </Btn>
          </DialogActions>
        </form>
      </Dialog>
    </>
  );
};

export default DictParts;
