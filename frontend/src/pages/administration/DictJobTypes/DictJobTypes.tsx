import {
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TablePagination,
  TableRow,
} from '@material-ui/core';
import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import CreateRoleModal from '../../../components/CreateRoleModal';
import { StoreModel } from '../../../models/storeModel';
import { getAllJobTypes } from '../../../store/actions/dictsActions';
import { formatDate } from '../../../utils/formatDate';

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
          <CreateRoleModal />
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

export default DictBoilers;
