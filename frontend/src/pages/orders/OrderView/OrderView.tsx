import {
  Card,
  CardContent,
  CardHeader,
  List,
  ListItem,
  ListItemText,
} from '@material-ui/core';
import { useDispatch } from 'react-redux';
import { OrderDataModel, PartItemModel } from '../../../models/storeModel';
import { useEffect, useState } from 'react';
import { setLoader } from '../../../store/actions/mainActions';
import api from '../../../utils/axiosMiddleware';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';
import { formatSum } from '../../../utils/formatSum';
import { getTotalSum } from '../../../utils/getOrderSum';
import { getPhoneLink } from '../../../utils/getPhoneLink';
import { getAddressLink } from '../../../utils/getAddressLink';
import { formatDate } from '../../../utils/formatDate';

const OrderView = () => {
  const dispatch = useDispatch();
  const [orderData, setOrderData] = useState<OrderDataModel>({
    customer: {},
    address: '',
    serviceMan: {},
    comment: '',
    visitPrice: 0,
    boiler: {},
    parts: [],
    jobTypes: [],
    orderId: 0,
  });

  useEffect(() => {
    getOrderData();

    // eslint-disable-next-line
  }, []);

  const getOrderData = () => {
    const currentPath = window.location.pathname.split('/');

    dispatch(setLoader(true));

    api
      .get(`/api/orders/${currentPath[currentPath.length - 1]}`)
      .then((res) => {
        setOrderData(res.data);
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
        dispatch(setLoader(false));
      });
  };

  return (
    <>
      <Card>
        <CardHeader title="Информация о заказе:" />
        <CardContent>
          <List className="info-list">
            <ListItem>
              <ListItemText
                primary={orderData.orderId}
                secondary={'Номер заказа'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={orderData.status}
                secondary={'Статус заказа'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={orderData.comment}
                secondary={'Комментарий'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={formatDate(orderData.createdDate || '', true)}
                secondary={'Дата создания'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={formatDate(orderData.updatedDate || '', true)}
                secondary={'Дата обновления'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={getAddressLink(orderData.address)}
                secondary={'Адрес'}
              />
            </ListItem>
          </List>
        </CardContent>
      </Card>

      <Card>
        <CardHeader title="Данные о клиенте:" />
        <CardContent>
          <List className="info-list">
            <ListItem>
              <ListItemText
                primary={orderData.customer.fullName}
                secondary={'ФИО'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={getPhoneLink(orderData.customer.phone)}
                secondary={'Телефон 1'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={getPhoneLink(orderData.customer.phone2)}
                secondary={'Телефон 2'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={getAddressLink(orderData.customer.address)}
                secondary={'Адрес'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={orderData.boiler.name}
                secondary={'Модель бойлера'}
              />
            </ListItem>
          </List>
        </CardContent>
      </Card>

      <Card>
        <CardHeader title="Данные о специалисте:" />
        <CardContent>
          <List className="info-list">
            <ListItem>
              <ListItemText
                primary={orderData.serviceMan.fullName}
                secondary={'ФИО'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={getPhoneLink(orderData.serviceMan.phone)}
                secondary={'Телефон'}
              />
            </ListItem>
          </List>
        </CardContent>
      </Card>

      <Card>
        <CardHeader title="Список работ и запчастей:" />
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
      </Card>
    </>
  );
};

export default OrderView;
