import {
  Card,
  CardActions,
  CardContent,
  FormControl,
  InputLabel,
  MenuItem,
  Select,
  TextField,
} from '@material-ui/core';
import { useEffect } from 'react';
import ReactInputMask from 'react-input-mask';
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router';
import Btn from '../../components/Btn';
import { RoleItemModel, StoreModel } from '../../models/storeModel';
import { getUserById, updateUser } from '../../store/actions/editUserActions';
import { SET_USER_DATA } from '../../store/storeConstants/editUserConstants';
import history from '../../utils/history';

const EditUser = () => {
  const params: { id: string } = useParams();
  const dispatch = useDispatch();
  const user = useSelector((state: StoreModel) => state.editUserStore.user);
  const roleList = useSelector(
    (store: StoreModel) => store.dictsStore.dictRoles.roles
  );

  useEffect(() => {
    if (params.id) {
      dispatch(getUserById(params.id));
    }
  }, [dispatch, params.id]);

  if (!user) {
    return <>Cannot find user</>;
  }

  const saveUser = (event: any) => {
    event.preventDefault();

    dispatch(updateUser(user));
  };

  const handleChange = (name: string) => (event: any) => {
    dispatch({
      type: SET_USER_DATA,
      payload: {
        name,
        value: event.target.value,
      },
    });
  };

  const goBack = () => {
    history.push('/users');
  };

  if (!user.id || roleList.length === 0) {
    return <h1>Loading</h1>;
  }

  return (
    <form action="" onSubmit={saveUser} id="edit-user-form">
      <Card>
        <h1>Редактирование пользователя</h1>

        <CardContent className="form">
          <TextField
            placeholder="example@mail.com"
            className="input form__field"
            label="Email"
            type="email"
            variant="outlined"
            value={user.login}
            autoComplete="off"
            disabled
          />

          <TextField
            className="input form__field"
            label="Пароль"
            variant="outlined"
            type="password"
            onChange={handleChange('password')}
            value={user.password}
            autoComplete="new-password"
          />

          <TextField
            className="input form__field"
            label="ФИО"
            variant="outlined"
            onChange={handleChange('fullName')}
            value={user.fullName}
            required
          />

          <ReactInputMask
            mask="+7 (999) 999-99-99"
            onChange={handleChange('phone')}
            value={user.phone}
          >
            <TextField
              className="input form__field"
              label="Телефон"
              variant="outlined"
              required
            />
          </ReactInputMask>

          <ReactInputMask
            mask="99/99/9999"
            value={user.birthDay}
            onChange={handleChange('birthDay')}
          >
            <TextField
              className="input form__field"
              label="Дата рождения"
              variant="outlined"
              required
            />
          </ReactInputMask>

          <TextField
            className="input form__field"
            type="number"
            label="Процент от работы"
            variant="outlined"
            onChange={handleChange('percentFromJob')}
            value={user.percentFromJob || 0}
          />

          <TextField
            className="input form__field"
            type="number"
            label="Процент от запчастей"
            variant="outlined"
            onChange={handleChange('percentFromParts')}
            value={user.percentFromParts || 0}
          />

          <TextField
            className="input form__field"
            type="number"
            label="Процент от выезда"
            variant="outlined"
            onChange={handleChange('percentFromVisit')}
            value={user.percentFromVisit || 0}
          />

          <FormControl
            variant="outlined"
            className="input form__field"
            required
          >
            <InputLabel>Роль</InputLabel>
            <Select
              value={user.roleId}
              onChange={handleChange('roleId')}
              label="Роль"
              required
            >
              {roleList.map((role: RoleItemModel) => (
                <MenuItem value={role.id} key={role.id}>
                  {role.name}
                </MenuItem>
              ))}
            </Select>
          </FormControl>
        </CardContent>

        <CardActions className="btn-container">
          <Btn classes="btn" onClick={goBack}>
            Назад
          </Btn>
          <Btn classes="btn btn_primary" type="submit">
            Сохранить
          </Btn>
        </CardActions>
      </Card>
    </form>
  );
};

export default EditUser;
