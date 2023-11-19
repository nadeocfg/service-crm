import {
  Box,
  Collapse,
  FormControl,
  InputBase,
  MenuItem,
  TextField,
} from '@material-ui/core';
import Btn from '../Btn';
import SearchIcon from '@material-ui/icons/Search';
import AddIcon from '@material-ui/icons/Add';
import { ChangeEvent, FormEvent, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { StoreModel } from '../../models/storeModel';
import './OrdersSearchPanel.scss';
import { Stack } from '@mui/material';
import { getUsers } from '../../store/actions/usersPageActions';
import ReactInputMask from 'react-input-mask';
import { ArrowDownward } from '@material-ui/icons';

export interface OrdersSearchPanelProps {
  label?: string;
  searchField: string;
  addFunction: () => void;
  onSearch: () => void;
  handleChangeSearch: (event: ChangeEvent<HTMLInputElement>) => void;
  selectedFilters: FilterProps;
  onSelect: (key: keyof FilterProps) => (
    event: ChangeEvent<{
      name?: string | undefined;
      value: unknown;
    }>
  ) => void;
  openFilter: boolean;
  changeFilter: () => void;
}

export interface FilterProps {
  users: number[];
  statuses: number[];
  fromDate: string;
  toDate: string;
}

export const OrdersSearchPanel = ({
  label = 'Введите параметры поиска',
  searchField,
  onSearch,
  handleChangeSearch,
  addFunction,
  selectedFilters,
  onSelect,
  openFilter,
  changeFilter,
}: OrdersSearchPanelProps) => {
  const dispatch = useDispatch();
  const userRoleCode = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );
  const serviceManList = useSelector(
    (store: StoreModel) => store.usersStore.usersList
  );
  const statuses = useSelector(
    (store: StoreModel) => store.dictsStore.dictOrderStatuses.statuses
  );
  const userRole = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );

  useEffect(() => {
    onSearch();
    dispatch(getUsers(0, 50, undefined, '', 'SERVICE_MAN'));

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const onSubmit = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    onSearch();
  };

  return (
    <form className="search-panel" onSubmit={onSubmit}>
      <Box className="search-row">
        <Btn className="btn btn_white" type="submit">
          <SearchIcon />
          Поиск
        </Btn>

        <InputBase
          value={searchField}
          onChange={handleChangeSearch}
          placeholder={label}
          inputProps={{ 'aria-label': label }}
        />

        {(userRoleCode === 'SUPER_ADMIN' || userRoleCode === 'ADMIN') && (
          <Btn className="btn btn_primary" onClick={addFunction}>
            <AddIcon />
            Добавить
          </Btn>
        )}
      </Box>
      <Stack
        direction={'row'}
        sx={{ justifyContent: { xs: 'center', sm: 'flex-end' } }}
      >
        <Btn
          className={`btn btn_link ${openFilter ? 'active' : ''}`}
          disableRipple
          onClick={changeFilter}
        >
          Расширенный поиск
          <ArrowDownward />
        </Btn>
      </Stack>

      <Collapse in={openFilter}>
        <div className="filter">
          <FormControl className="filter__item">
            <ReactInputMask
              mask={'99-99-9999'}
              value={selectedFilters.fromDate}
              onChange={onSelect('fromDate')}
            >
              <TextField className="input" label="Дата от" variant="outlined" />
            </ReactInputMask>
          </FormControl>
          <FormControl className="filter__item">
            <ReactInputMask
              mask={'99-99-9999'}
              value={selectedFilters.toDate}
              onChange={onSelect('toDate')}
            >
              <TextField className="input" label="Дата до" variant="outlined" />
            </ReactInputMask>
          </FormControl>
          {(userRole === 'ADMIN' || userRole === 'SUPER_ADMIN') && (
            <FormControl className="filter__item">
              <TextField
                select
                name="users"
                id="users"
                variant="outlined"
                label="Выберите специалиста"
                SelectProps={{
                  multiple: true,
                  value: selectedFilters.users,
                  onChange: onSelect('users'),
                  renderValue: () =>
                    serviceManList
                      .filter((user) =>
                        selectedFilters.users.includes(user.id ?? -1)
                      )
                      .map((user) => user.fullName)
                      .join(', '),
                }}
                fullWidth
              >
                {serviceManList.map((user) => (
                  <MenuItem key={user.id} value={user.id}>
                    {user.fullName}
                  </MenuItem>
                ))}
              </TextField>
            </FormControl>
          )}
          <FormControl className="filter__item">
            <TextField
              select
              name="statuses"
              id="statuses"
              variant="outlined"
              label="Выберите статус заявки"
              SelectProps={{
                multiple: true,
                value: selectedFilters.statuses,
                onChange: onSelect('statuses'),
                renderValue: () =>
                  statuses
                    .filter((status) =>
                      selectedFilters.statuses.includes(status.id ?? -1)
                    )
                    .map((status) => status.name)
                    .join(', '),
              }}
              fullWidth
            >
              {statuses.map((status) => (
                <MenuItem key={status.id} value={status.id}>
                  {status.name}
                </MenuItem>
              ))}
            </TextField>
          </FormControl>
        </div>
      </Collapse>
    </form>
  );
};
