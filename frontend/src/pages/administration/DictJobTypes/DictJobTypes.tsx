import {
  Checkbox,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControlLabel,
  IconButton,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TablePagination,
  TableRow,
  TextField,
} from '@material-ui/core';
import React, { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import Btn from '../../../components/Btn';
import CreateJobTypeModal from '../../../components/modals/CreateJobTypeModal';
import Transition from '../../../components/Transition';
import { StoreModel } from '../../../models/storeModel';
import { getAllJobTypes } from '../../../store/actions/dictsActions';
import { formatDate } from '../../../utils/formatDate';
import EditIcon from '@material-ui/icons/Edit';
import api from '../../../utils/axiosMiddleware';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';

const DictBoilers = () => {
  const dispatch = useDispatch();
  const userRoleCode = useSelector(
    (state: StoreModel) => state.userStore.authResponse.roleCode
  );
  const jobs = useSelector(
    (state: StoreModel) => state.dictsStore.dictJobTypes.jobTypes
  );
  const total = useSelector(
    (state: StoreModel) => state.dictsStore.dictJobTypes.total
  );
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
  });
  const [open, setOpen] = useState(false);
  const [selectedJob, setSelectedJob] = useState({
    code: 'DIAGNOSTIC',
    isActive: true,
    monthsOfGuarantee: 0,
    name: 'Диагностика неисправности',
    price: 5000,
    price1: 4000,
    price2: 3000,
    price3: 2000,
  });

  const handleChangeModal = () => {
    setOpen(!open);
  };

  const handleChange =
    (name: string) => (event: React.ChangeEvent<HTMLInputElement>) => {
      if (name === 'isActive') {
        return setSelectedJob({
          ...selectedJob,
          [name]: event.target.checked,
        });
      }

      setSelectedJob({
        ...selectedJob,
        [name]: event.target.value,
      });
    };

  const selectJob = (job: any) => {
    setSelectedJob({ ...job });
    handleChangeModal();
  };

  const updateJob = (event: any) => {
    event.preventDefault();

    api
      .post(`/api/dicts/job-types/update`, selectedJob)
      .then((res) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Вид работы успешно обновлен',
            type: 'success',
          },
        });

        handleChangeModal();
        dispatch(getAllJobTypes());
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

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setPagination({
      ...pagination,
      rowsPerPage: +event.target.value,
    });

    dispatch(getAllJobTypes(pagination.currentPage, +event.target.value));
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getAllJobTypes(page, pagination.rowsPerPage));
  };

  return (
    <>
      <div className="search-row">
        <h1>Виды работ</h1>

        {(userRoleCode === 'SUPER_ADMIN' || userRoleCode === 'ADMIN') && (
          <CreateJobTypeModal />
        )}
      </div>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>Код</TableCell>
              <TableCell>Наименование</TableCell>
              <TableCell>Цена</TableCell>
              <TableCell>Цена 1</TableCell>
              <TableCell>Цена 2</TableCell>
              <TableCell>Цена 3</TableCell>
              <TableCell>Гарантия (мес.)</TableCell>
              <TableCell>Дата обновления</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {jobs.map((job) => (
              <TableRow key={job.id}>
                <TableCell>{job.id}</TableCell>
                <TableCell>{job.code}</TableCell>
                <TableCell>{job.name}</TableCell>
                <TableCell>{job.price}</TableCell>
                <TableCell>{job.price1}</TableCell>
                <TableCell>{job.price2}</TableCell>
                <TableCell>{job.price3}</TableCell>
                <TableCell>{job.monthsOfGuarantee}</TableCell>
                <TableCell>{formatDate(job.updatedDate || '', true)}</TableCell>
                {(userRoleCode === 'SUPER_ADMIN' ||
                  userRoleCode === 'ADMIN') && (
                  <TableCell>
                    <IconButton
                      aria-label="edit"
                      onClick={() => selectJob(job)}
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
        <DialogTitle>Редактировать вид работы</DialogTitle>
        <form id="edit-job-type-form" action="" onSubmit={updateJob}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Код"
              variant="outlined"
              value={selectedJob.code}
              onChange={handleChange('code')}
              required
              disabled
            />

            <TextField
              className="input form__field"
              label="Наименование"
              variant="outlined"
              value={selectedJob.name}
              onChange={handleChange('name')}
              required
            />

            <TextField
              className="input form__field"
              label="Гарантия (мес.)"
              variant="outlined"
              value={selectedJob.monthsOfGuarantee}
              onChange={handleChange('monthsOfGuarantee')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Цена"
              variant="outlined"
              value={selectedJob.price}
              onChange={handleChange('price')}
              type="number"
              required
            />

            <TextField
              className="input form__field"
              label="Цена 1"
              variant="outlined"
              value={selectedJob.price1}
              onChange={handleChange('price1')}
              type="number"
            />

            <TextField
              className="input form__field"
              label="Цена 2"
              variant="outlined"
              value={selectedJob.price2}
              onChange={handleChange('price2')}
              type="number"
            />

            <TextField
              className="input form__field"
              label="Цена 3"
              variant="outlined"
              value={selectedJob.price3}
              onChange={handleChange('price3')}
              type="number"
            />

            <FormControlLabel
              className="input form__field form__field_checkbox"
              control={
                <Checkbox
                  checked={selectedJob.isActive}
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

export default DictBoilers;
