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
import CreateOrderStatusModal from '../../../components/modals/CreateOrderStatusModal';
import { UserRolesEnum } from '../../../models/userModel';

const DictOrderStatuses = () => {
  const statuses = useSelector(
    (store: StoreModel) => store.dictsStore.dictOrderStatuses.statuses
  );
  const userRoleCode = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );

  return (
    <>
      <div className="search-row">
        <h1>Статусы заказов</h1>

        {(userRoleCode === UserRolesEnum.SUPER_ADMIN ||
          userRoleCode === UserRolesEnum.ADMIN) && <CreateOrderStatusModal />}
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
            {statuses.map((status) => (
              <TableRow key={status.id}>
                <TableCell>{status.id}</TableCell>
                <TableCell>{status.code}</TableCell>
                <TableCell>{status.name}</TableCell>
                <TableCell>
                  {formatDate(status.updatedDate || '', true)}
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </>
  );
};

export default DictOrderStatuses;
