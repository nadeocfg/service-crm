import {
  InputBase,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from '@material-ui/core';
import { useDispatch, useSelector } from 'react-redux';
import { StoreModel, UsersItemModel } from '../../models/storeModel';
import { getUsers } from '../../store/actions/usersPageActions';
import SearchIcon from '@material-ui/icons/Search';
import Btn from '../../components/Btn';
import AddIcon from '@material-ui/icons/Add';
import { formatDate } from '../../utils/formatDate';

const Users = () => {
  const dispatch = useDispatch();
  const usersList: UsersItemModel[] = useSelector(
    (store: StoreModel) => store.usersStore.usersList
  );

  const search = () => {
    dispatch(getUsers());
  };

  return (
    <>
      <div className="search-row">
        <Btn classes="btn btn_white" onClick={search}>
          <SearchIcon />
          Поиск
        </Btn>

        <InputBase
          placeholder="Введите параметры поиска"
          inputProps={{ 'aria-label': 'Введите параметры поиска' }}
        />

        <Btn classes="btn btn_primary" onClick={search}>
          <AddIcon />
          Создать
        </Btn>
      </div>

      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>ID</TableCell>
              <TableCell>Имя</TableCell>
              <TableCell>Логин</TableCell>
              <TableCell>Телефон</TableCell>
              <TableCell>Дата обновления</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {usersList.map((user) => (
              <TableRow key={user.id}>
                <TableCell>{user.id}</TableCell>
                <TableCell>{`${user.firstName} ${user.lastName}`}</TableCell>
                <TableCell>{user.login}</TableCell>
                <TableCell>{user.phone}</TableCell>
                <TableCell>{formatDate(user.updatedDate, true)}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </>
  );
};

export default Users;
