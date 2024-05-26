import {
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from '@material-ui/core';
import { useSelector } from 'react-redux';
import { formatDate } from '../../../utils/formatDate';
import { StoreModel } from '../../../models/storeModel';
import CreateRoleModal from '../../../components/modals/CreateRoleModal';
import { UserRolesEnum } from '../../../models/userModel';

const DictRoles = () => {
  const roles = useSelector(
    (store: StoreModel) => store.dictsStore.dictRoles.roles
  );
  const userRoleCode = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );

  return (
    <>
      <div className="search-row">
        <h1>Роли</h1>

        {(userRoleCode === UserRolesEnum.SUPER_ADMIN ||
          userRoleCode === UserRolesEnum.ADMIN) && <CreateRoleModal />}
      </div>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>Код</TableCell>
              <TableCell>Наименование</TableCell>
              <TableCell>Дата обновления</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {roles.map((role) => (
              <TableRow key={role.id}>
                <TableCell>{role.id}</TableCell>
                <TableCell>{role.code}</TableCell>
                <TableCell>{role.name}</TableCell>
                <TableCell>{formatDate(role.updatedDate, true)}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </>
  );
};

export default DictRoles;
