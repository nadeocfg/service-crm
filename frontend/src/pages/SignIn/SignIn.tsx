import { Container, Grid, TextField } from '@material-ui/core';
import { useDispatch } from 'react-redux';
import signInBg from '../../assets/images/signin-bg.jpg';
import Btn from '../../components/Btn';
import { useState } from 'react';
import { addNotify } from '../../store/actions/snackbarActions';
import { userSignIn } from '../../store/actions/userActions';

export default function SignIn() {
  const dispatch = useDispatch();
  const [fields, setFields] = useState({ login: '', password: '' });

  const handleChange = (name: string) => (event: any) => {
    setFields({
      ...fields,
      [name]: event.target.value,
    });
  };

  const signIn = (event: any) => {
    event.preventDefault();

    if (!fields.login || !fields.password) {
      return dispatch(addNotify('Заполните логин и пароль', 'warning'));
    }

    dispatch(userSignIn(fields.login, fields.password));
  };

  return (
    <Container maxWidth="md" className="sign-in-page">
      <Grid container className="sign-in-form">
        <Grid item xs={12} md={6} className="sign-in-form__form">
          <h1>Войти</h1>
          <p>Для смены пароля, попоросите администратора</p>

          <form action="" onSubmit={signIn} className="form">
            <TextField
              className="input"
              label="Логин"
              variant="outlined"
              onChange={handleChange('login')}
              value={fields.login}
            />

            <TextField
              className="input"
              label="Пароль"
              variant="outlined"
              onChange={handleChange('password')}
              type="password"
              value={fields.password}
            />

            <Btn classes="btn btn_primary btn_big" type="submit">
              Войти
            </Btn>
          </form>
        </Grid>
        <Grid item xs={12} md={6} className="sign-in-form__bg">
          <img src={signInBg} alt="service center" />
        </Grid>
      </Grid>
    </Container>
  );
}
