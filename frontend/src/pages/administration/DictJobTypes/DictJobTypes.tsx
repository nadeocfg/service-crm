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
import { JobItemModel, StoreModel } from '../../../models/storeModel';
import { getAllJobTypes } from '../../../store/actions/dictsActions';
import { formatDate } from '../../../utils/formatDate';
import EditIcon from '@material-ui/icons/Edit';
import api from '../../../utils/axiosMiddleware';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';
import { Stack } from '@mui/material';

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
  const [selectedJob, setSelectedJob] = useState<JobItemModel>();

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

  const handleChangePrice =
    (index: number) => (e: React.ChangeEvent<HTMLInputElement>) => {
      if (selectedJob && selectedJob?.prices && selectedJob?.prices[index]) {
        setSelectedJob({
          ...selectedJob,
          prices: selectedJob.prices.map((item, i) => {
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
              <TableCell>Гарантия (дни)</TableCell>
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
                {(job.prices || []).map((item) => (
                  <TableCell>{item.value}</TableCell>
                ))}
                <TableCell>{job.daysOfGuarantee}</TableCell>
                <TableCell>{formatDate(job.updatedDate || '', true)}</TableCell>
                <TableCell>
                  {(userRoleCode === 'SUPER_ADMIN' ||
                    userRoleCode === 'ADMIN') && (
                    <Stack direction={'row'} alignItems={'center'}>
                      <IconButton
                        aria-label="edit"
                        onClick={() => selectJob(job)}
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
        <DialogTitle>Редактировать вид работы</DialogTitle>
        <form id="edit-job-type-form" action="" onSubmit={updateJob}>
          <DialogContent className="form">
            <TextField
              className="input form__field"
              label="Код"
              variant="outlined"
              value={selectedJob?.code || ''}
              onChange={handleChange('code')}
              required
              disabled
            />

            <TextField
              className="input form__field"
              label="Наименование"
              variant="outlined"
              value={selectedJob?.name || ''}
              onChange={handleChange('name')}
              required
            />

            <TextField
              className="input form__field"
              label="Гарантия (дни)"
              variant="outlined"
              value={selectedJob?.daysOfGuarantee || ''}
              onChange={handleChange('daysOfGuarantee')}
              type="number"
              required
            />

            {selectedJob?.prices?.map((item, index) => (
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
                  checked={selectedJob?.isActive || false}
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
