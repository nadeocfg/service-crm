import {
  Card,
  CardActions,
  CardContent,
  TextField,
  IconButton,
  Input,
} from '@material-ui/core';
import React, { useState } from 'react';
import Btn from '../../../components/Btn';
import history from '../../../utils/history';
import SelectModal from '../../../components/modals/SelectModal';
import { useDispatch, useSelector } from 'react-redux';
import AddIcon from '@material-ui/icons/Add';
import {
  JobItemModel,
  OrderDataModel,
  PartItemModel,
  StoreModel,
} from '../../../models/storeModel';
import { createOrder } from '../../../store/actions/ordersActions';
import CloseIcon from '@material-ui/icons/Close';
import { getCustomersList } from '../../../store/actions/customersActions';
import {
  getAllBoilers,
  getAllJobTypes,
  getAllParts,
} from '../../../store/actions/dictsActions';
import { getUsers } from '../../../store/actions/usersPageActions';
import { formatSum } from '../../../utils/formatSum';
import { getTotalSum } from '../../../utils/getOrderSum';

const CreateOrder = () => {
  const [fetchFunction, setFetchFunction] = React.useState<any>(() => () => {});
  const [modalProps, setModalProps] = useState({
    title: '',
    onSelect: () => {},
    open: false,
    items: [],
    fieldName: '',
  });
  const [currentSearch, setCurrentSearch] = useState<
    'customer' | 'boiler' | 'serviceMan' | 'parts' | 'jobTypes'
  >('customer');
  const [orderData, setOrderData] = useState<OrderDataModel>({
    address: '',
    comment: '',
    customer: {},
    jobTypes: [],
    parts: [],
    serviceMan: {},
    boiler: {},
    visitPrice: 5000,
  });
  const dispatch = useDispatch();
  const customersList = useSelector(
    (store: StoreModel) => store.customersStore.customers
  );
  const boilersList = useSelector(
    (store: StoreModel) => store.dictsStore.dictBoilers.boilers
  );
  const jobsList = useSelector(
    (store: StoreModel) => store.dictsStore.dictJobTypes.jobTypes
  );
  const partsList = useSelector(
    (store: StoreModel) => store.dictsStore.dictParts.parts
  );
  const serviceManList = useSelector(
    (store: StoreModel) => store.usersStore.usersList
  );

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
    dispatch(getCustomersList(0, 20, searchValue));

    setCurrentSearch('customer');
  };

  const getBoilers = (searchValue: string) => {
    dispatch(getAllBoilers(0, 20, searchValue));

    setCurrentSearch('boiler');
  };

  const getParts = (searchValue: string) => {
    dispatch(getAllParts(0, 20, searchValue));

    setCurrentSearch('parts');
  };

  const getJobTypes = (searchValue: string) => {
    dispatch(getAllJobTypes(0, 20, searchValue));

    setCurrentSearch('jobTypes');
  };

  const getServiceMan = (searchValue: string) => {
    dispatch(getUsers(0, 20, searchValue, 'SERVICE_MAN'));

    setCurrentSearch('serviceMan');
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

  const removeItem = (id: number | undefined, type: string) => (event: any) => {
    if (type === 'parts') {
      return setOrderData({
        ...orderData,
        parts: orderData.parts.filter((item) => item.id !== id),
      });
    }

    if (type === 'jobs') {
      return setOrderData({
        ...orderData,
        jobTypes: orderData.jobTypes.filter((item) => item.id !== id),
      });
    }
  };

  const setItems = () => {
    switch (currentSearch) {
      case 'customer': {
        return customersList;
      }

      case 'boiler': {
        return boilersList;
      }

      case 'jobTypes': {
        return jobsList;
      }

      case 'parts': {
        return partsList;
      }

      case 'serviceMan': {
        return serviceManList;
      }

      default: {
        return [];
      }
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

            <TextField
              className="input form__field"
              label="Цена за визит"
              variant="outlined"
              value={orderData.visitPrice}
              type="number"
              onChange={handleChange('visitPrice')}
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
                  <IconButton onClick={removeItem(el.id, 'parts')}>
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
                  <IconButton onClick={removeItem(el.id, 'jobs')}>
                    <CloseIcon />
                  </IconButton>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="total">
            <div className="total__item">
              <h4>Запчасти:</h4>
              <div className="list">
                {orderData.parts.map((el: PartItemModel) => (
                  <div className="list__item" key={el.id}>
                    {`${el.name} x ${el.soldQuantity}`}
                    <span></span>
                    {formatSum(+(el?.soldQuantity || 0) * (el?.price || 0))}
                  </div>
                ))}
              </div>
            </div>
            <div className="total__item">
              <h4>Работы:</h4>
              <div className="list">
                <div className="list__item">
                  {`Выезд специалиста x 1`}
                  <span></span>
                  {formatSum(+(orderData.visitPrice || 0))}
                </div>

                {orderData.jobTypes.map((el: PartItemModel) => (
                  <div className="list__item" key={el.id + '' + el.price}>
                    {`${el.name} x ${el.soldQuantity}`}
                    <span></span>
                    {formatSum(+(el?.soldQuantity || 0) * (el?.price || 0))}
                  </div>
                ))}
              </div>
            </div>
            <div className="total__item">
              <h4>Общая сумма заказа: {getTotalSum(orderData)}</h4>
            </div>
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
        items={setItems()}
        fieldName={modalProps.fieldName}
      />
    </>
  );
};

export default CreateOrder;
