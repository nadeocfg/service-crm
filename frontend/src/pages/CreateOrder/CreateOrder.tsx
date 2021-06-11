import { Card, CardActions, CardContent, TextField } from '@material-ui/core';
import Btn from '../../components/Btn';
import history from '../../utils/history';

const CreateOrder = () => {
  const createOrder = () => {
    console.log('create order');
  };

  const goBack = () => {
    history.push('/orders');
  };

  return (
    <>
      <form action="" onSubmit={createOrder} id="create-order-form">
        <Card>
          <h1>Редактирование пользователя</h1>

          <CardContent className="form">
            <TextField
              className="input form__field"
              label="Адрес"
              variant="outlined"
            />
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
    </>
  );
};

export default CreateOrder;
