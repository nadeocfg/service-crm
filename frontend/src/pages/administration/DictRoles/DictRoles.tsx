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
} from '@material-ui/core';
import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { formatDate } from '../../../utils/formatDate';
import { getAllRoles } from '../../../store/actions/dictsActions';
import { StoreModel } from '../../../models/storeModel';
import CreateRoleModal from '../../../components/CreateRoleModal';
import DeleteOutlineIcon from '@material-ui/icons/DeleteOutline';

const DictRoles = () => {
  const dispatch = useDispatch();
  const [pagination, setPagination] = useState({
    currentPage: 0,
    rowsPerPage: 10,
    rowsPerPageOptions: [10, 20, 50],
    total: 0,
  });
  const roles = useSelector(
    (store: StoreModel) => store.dictsStore.dictRoles.roles
  );
  const userRoleCode = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>
  ) => {
    setPagination({
      ...pagination,
      rowsPerPage: +event.target.value,
    });

    dispatch(getAllRoles());
  };

  const handleChangePage = (event: any, page: number) => {
    setPagination({
      ...pagination,
      currentPage: page,
    });

    dispatch(getAllRoles());
  };

  return (
    <>
      <div className="search-row">
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
              <TableCell>Дата обновления</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {roles.map((role) => (
              <TableRow key={role.id}>
                <TableCell>{role.id}</TableCell>
                <TableCell>{role.code}</TableCell>
                <TableCell>{role.name}</TableCell>
                <TableCell>{formatDate(role.updatedDate, true)}</TableCell>
                <TableCell>
                  <IconButton
                    className="btn__icon btn__icon_danger"
                    aria-label="edit"
                    onClick={() => {}}
                  >
                    <DeleteOutlineIcon />
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
        count={pagination.total}
        rowsPerPage={pagination.rowsPerPage}
        page={pagination.currentPage}
        onChangePage={handleChangePage}
        onChangeRowsPerPage={handleChangeRowsPerPage}
      />
    </>
  );
};

export default DictRoles;
