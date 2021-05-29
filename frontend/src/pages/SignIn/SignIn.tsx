import { Container, Grid, TextField } from '@material-ui/core';
import { useDispatch, useSelector } from 'react-redux';
import signInBg from '../../assets/images/signin-bg.jpeg';
import { SET_INPUT_USER_DATA } from '../../store/storeConstants/userConstants';
import Btn from '../../components/Btn';
import { StoreModel } from '../../models/storeModel';
import { useState } from 'react';
import { SET_SNACKBAR } from '../../store/storeConstants/snackbarConstants';

export default function SignIn() {
  const dispatch = useDispatch();
  const [fields, setFields] = useState({ login: '', password: '' });

  const handleChange = (name: string) => (event: any) => {
    setFields({
      ...fields,
      [name]: event.target.value,
    });
  };

  const signIn = () => {
    if (!fields.login || !fields.password) {
      dispatch({
        type: SET_SNACKBAR,
        payload: {
          message: 'test',
          type: 'error',
        },
      });
    }

    dispatch({
      type: SET_INPUT_USER_DATA,
      payload: { name: 'login', value: fields.login },
    });
    dispatch({
      type: SET_INPUT_USER_DATA,
      payload: { name: 'password', value: fields.password },
    });
  };

  return (
    <Container maxWidth="md">
      <Grid container>
        <Grid item xs={12} md={6}>
          <h1>Войти</h1>
          <p>Для смены пароля, попоросите администратора</p>

          <div className="form">
            <TextField
              label="Логин"
              variant="outlined"
              onChange={handleChange('login')}
              value={fields.login}
            />

            <TextField
              label="Пароль"
              variant="outlined"
              onChange={handleChange('password')}
              type="password"
              value={fields.password}
            />

            <Btn classes="btn btn-primary" onClick={signIn}>
              Войти
            </Btn>
          </div>
        </Grid>
        <Grid item xs={12} md={6}>
          <img src={signInBg} alt="service center" />
        </Grid>
      </Grid>
    </Container>
  );
}
