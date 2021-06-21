import {
  Card,
  CardActions,
  CardContent,
  TextField,
  Divider,
  IconButton,
  Input,
} from '@material-ui/core';
import React, { useState } from 'react';
import Btn from '../../components/Btn';
import history from '../../utils/history';
import SelectModal from '../../components/modals/SelectModal';
import api from '../../utils/axiosMiddleware';
import { useDispatch } from 'react-redux';
import { ADD_NOTIFY } from '../../store/storeConstants/snackbarConstants';
import ReactInputMask from 'react-input-mask';
import moment from 'moment';
import AddIcon from '@material-ui/icons/Add';
import {
  JobItemModel,
  OrderDataModel,
  PartItemModel,
} from '../../models/storeModel';
import { createOrder } from '../../store/actions/ordersActions';
import CloseIcon from '@material-ui/icons/Close';

const CreateOrder = () => {
  const [fetchFunction, setFetchFunction] = React.useState<any>(() => () => {});
  const [modalProps, setModalProps] = useState({
    title: '',
    onSelect: () => {},
    open: false,
    items: [],
    fieldName: '',
  });
  const [selectItems, setSelectItems] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [orderData, setOrderData] = useState<OrderDataModel>({
    customer: {},
    address: '',
    date: moment().format('DD/MM/YYYY'),
    serviceMan: {},
    comment: '',
    boiler: {},
    parts: [],
    jobTypes: [],
  });
  const dispatch = useDispatch();

  const submitOrder = (event: any) => {
    event.preventDefault();

    dispatch(createOrder(orderData));
  };

  const goBack = () => {
    history.push('/orders');
  };

  const changeModal = (fetch: Function, title: string, type: string) => {
    setModalProps({
      ...modalProps,
      open: !modalProps.open,
      title: title,
      fieldName: type,
    });

    setFetchFunction(() => (searchValue: string) => fetch(searchValue));
  };

  const onSelect = (name: string, value: any) => {
    if (name === 'customer') {
      setOrderData({
        ...orderData,
        customer: value,
        address: value.address,
      });
    }

    if (name === 'boiler') {
      setOrderData({
        ...orderData,
        boiler: value,
      });
    }

    if (name === 'parts') {
      setOrderData({
        ...orderData,
        parts: [...orderData.parts, { ...value, soldQuantity: 1 }],
      });
    }

    if (name === 'jobTypes') {
      setOrderData({
        ...orderData,
        jobTypes: [...orderData.jobTypes, { ...value, soldQuantity: 1 }],
      });
    }

    if (name === 'serviceMan') {
      setOrderData({
        ...orderData,
        serviceMan: value,
      });
    }
  };

  const getCustomers = (searchValue: string) => {
    setIsLoading(true);

    const data = {
      searchValue,
      page: 0,
      count: 20,
    };

    api
      .post(`/api/customers/find`, data)
      .then((res) => {
        setSelectItems(res.data.customers);
      })
      .catch((err) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: err.response?.data?.message
              ? err.response.data.message
              : 'Ошибка',
            type: 'error',
          },
        });
      })
      .finally(() => {
        setIsLoading(false);
      });
  };

  const getBoilers = (searchValue: string) => {
    setIsLoading(true);

    api
      .get(
        `/api/dicts/boilers?page=0&count=20&searchValue=${searchValue || ''}`
      )
      .then((res) => {
        setSelectItems(res.data.boilers);
      })
      .catch((err) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: err.response?.data?.message
              ? err.response.data.message
              : 'Ошибка',
            type: 'error',
          },
        });
      })
      .finally(() => {
        setIsLoading(false);
      });
  };

  const getParts = (searchValue: string) => {
    setIsLoading(true);

    api
      .get(`/api/dicts/parts?page=0&count=20&searchValue=${searchValue || ''}`)
      .then((res) => {
        setSelectItems(res.data.parts);
      })
      .catch((err) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: err.response?.data?.message
              ? err.response.data.message
              : 'Ошибка',
            type: 'error',
          },
        });
      })
      .finally(() => {
        setIsLoading(false);
      });
  };

  const getJobTypes = (searchValue: string) => {
    setIsLoading(true);

    api
      .get(
        `/api/dicts/job-types?page=0&count=20&searchValue=${searchValue || ''}`
      )
      .then((res) => {
        setSelectItems(res.data.jobTypes);
      })
      .catch((err) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: err.response?.data?.message
              ? err.response.data.message
              : 'Ошибка',
            type: 'error',
          },
        });
      })
      .finally(() => {
        setIsLoading(false);
      });
  };

  const getServiceMan = (searchValue: string) => {
    setIsLoading(true);

    const data = {
      page: 0,
      count: 20,
      roleCode: 'SERVICE_MAN',
      searchValue: searchValue || '',
    };

    api
      .post(`/api/users/find`, data)
      .then((res) => {
        setSelectItems(res.data.users);
      })
      .catch((err) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: err.response?.data?.message
              ? err.response.data.message
              : 'Ошибка',
            type: 'error',
          },
        });
      })
      .finally(() => {
        setIsLoading(false);
      });
  };

  const handleChange =
    (name: string) => (event: React.ChangeEvent<HTMLInputElement>) => {
      setOrderData({
        ...orderData,
        [name]: event.target.value,
      });
    };

  const changeQuantity =
    (index: number, type: 'parts' | 'jobs') =>
    (event: React.ChangeEvent<HTMLInputElement>) => {
      if (type === 'parts') {
        const partsArr = [...orderData.parts];
        partsArr[index].soldQuantity = event.target.value;

        setOrderData({
          ...orderData,
          parts: [...partsArr],
        });

        return;
      }

      const jobsArr = [...orderData.jobTypes];
      jobsArr[index].soldQuantity = event.target.value;

      setOrderData({
        ...orderData,
        jobTypes: [...jobsArr],
      });
    };

  const removeItem = (index: number, type: string) => (event: any) => {
    if (type === 'parts') {
      return setOrderData({
        ...orderData,
        parts: [...orderData.parts.splice(index, 1)],
      });
    }

    if (type === 'jobs') {
      return setOrderData({
        ...orderData,
        jobTypes: [...orderData.jobTypes.splice(index, 1)],
      });
    }
  };

  return (
    <>
      <form action="" onSubmit={submitOrder} id="create-order-form">
        <Card>
          <h2>Информация о клиенте</h2>

          <CardContent className="form">
            <TextField
              className="input form__field"
              label="Клиент"
              variant="outlined"
              onClick={() =>
                changeModal(getCustomers, 'Выберите клиента', 'customer')
              }
              onKeyUp={() =>
                changeModal(getCustomers, 'Выберите клиента', 'customer')
              }
              value={orderData.customer?.fullName || ''}
              required
            />

            <TextField
              className="input form__field"
              label="Серийный номер"
              variant="outlined"
              value={orderData.customer?.boilerSerial || ''}
              required
              disabled
            />

            <TextField
              className="input form__field"
              label="Адрес"
              variant="outlined"
              value={orderData.address}
              onChange={handleChange('address')}
              required
            />

            <ReactInputMask
              mask="99/99/9999"
              value={orderData.date}
              onChange={handleChange('date')}
            >
              <TextField
                className="input form__field"
                label="Дата"
                variant="outlined"
                required
              />
            </ReactInputMask>

            <TextField
              className="input form__field"
              label="Котел"
              variant="outlined"
              onClick={() =>
                changeModal(getBoilers, 'Выберите котел', 'boiler')
              }
              onKeyUp={() =>
                changeModal(getBoilers, 'Выберите котел', 'boiler')
              }
              value={orderData.boiler?.name || ''}
              required
            />

            <TextField
              className="input form__field"
              label="Комментарий"
              variant="outlined"
              value={orderData.comment}
              onChange={handleChange('comment')}
            />
          </CardContent>
        </Card>

        <Card>
          <h2>Информация о сервиснике</h2>

          <CardContent className="form">
            <TextField
              className="input form__field"
              label="Сервисник"
              variant="outlined"
              onClick={() =>
                changeModal(getServiceMan, 'Выберите сервисника', 'serviceMan')
              }
              onKeyUp={() =>
                changeModal(getServiceMan, 'Выберите сервисника', 'serviceMan')
              }
              value={orderData.serviceMan?.fullName || ''}
              required
            />
          </CardContent>
        </Card>

        <Card>
          <h2>Запчасти</h2>

          <CardContent className="form">
            <Btn
              classes="btn btn_primary"
              onClick={() =>
                changeModal(getParts, 'Выберите запчасть', 'parts')
              }
            >
              <AddIcon />
              Добавить запчасть
            </Btn>

            <div className="order-part">
              {orderData.parts.map((el: PartItemModel, index: number) => (
                <div className="order-part__item" key={el.id}>
                  <h3>{el.name}</h3>
                  <div className="order-part__detail">
                    Артикул: {el.article}
                  </div>

                  <div className="order-part__detail">Цена: {el.price}</div>

                  <div className="order-part__detail">
                    Количество:{' '}
                    <Input
                      value={el.soldQuantity}
                      type="number"
                      onChange={changeQuantity(index, 'parts')}
                    />
                  </div>
                  <IconButton onClick={removeItem(index, 'parts')}>
                    <CloseIcon />
                  </IconButton>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        <Card>
          <h2>Работы</h2>

          <CardContent className="form">
            <Btn
              classes="btn btn_primary"
              onClick={() =>
                changeModal(getJobTypes, 'Выберите вид работы', 'jobTypes')
              }
            >
              <AddIcon />
              Добавить вид работы
            </Btn>

            <div className="order-part">
              {orderData.jobTypes.map((el: JobItemModel, index: number) => (
                <div className="order-part__item" key={el.id}>
                  <h3>{el.name}</h3>

                  <div className="order-part__detail">Код: {el.code}</div>

                  <div className="order-part__detail">Цена: {el.price}</div>

                  <div className="order-part__detail">
                    Количество:{' '}
                    <Input
                      value={el.soldQuantity}
                      type="number"
                      onChange={changeQuantity(index, 'jobs')}
                    />
                  </div>
                  <IconButton onClick={removeItem(index, 'jobs')}>
                    <CloseIcon />
                  </IconButton>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        <Card>
          <h2>Итого</h2>

          <CardContent className="form">
            Запчасти:
            {orderData.parts.map((el: PartItemModel) => (
              <h3 key={el.id}>{el.name}</h3>
            ))}
            <Divider />
            Работы:
            {orderData.jobTypes.map((el: JobItemModel) => (
              <h3 key={el.id}>{el.name}</h3>
            ))}
            <Divider />
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

      <SelectModal
        open={modalProps.open}
        handleChangeModal={changeModal}
        onSelect={onSelect}
        title={modalProps.title}
        handleChange={fetchFunction}
        items={selectItems}
        fieldName={modalProps.fieldName}
        isLoading={isLoading}
      />
    </>
  );
};

export default CreateOrder;
