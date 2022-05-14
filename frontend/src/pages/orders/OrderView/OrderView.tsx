import {
  Card,
  CardActions,
  CardContent,
  CardHeader,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  List,
  ListItem,
  ListItemText,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  TextField,
} from '@material-ui/core';
import { useDispatch, useSelector } from 'react-redux';
import {
  OrderDataModel,
  OrderStatusHistoryItem,
  PartItemModel,
  StoreModel,
} from '../../../models/storeModel';
import { useEffect, useState } from 'react';
import { setLoader } from '../../../store/actions/mainActions';
import api from '../../../utils/axiosMiddleware';
import { ADD_NOTIFY } from '../../../store/storeConstants/snackbarConstants';
import { formatSum } from '../../../utils/formatSum';
import { getTotalSum } from '../../../utils/getOrderSum';
import { getPhoneLink } from '../../../utils/getPhoneLink';
import { getAddressLink } from '../../../utils/getAddressLink';
import { formatDate } from '../../../utils/formatDate';
import { useParams } from 'react-router';
import { OrderActionModel } from '../../../models/orderActionModel';
import Btn from '../../../components/Btn';
import Transition from '../../../components/Transition';
import UpdateCustomerModal from '../../../components/UpdateCustomerModal';

const OrderView = () => {
  const dispatch = useDispatch();
  const params: { id: string | undefined } = useParams();
  const userRole = useSelector(
    (store: StoreModel) => store.userStore.authResponse.roleCode
  );
  const [orderData, setOrderData] = useState<OrderDataModel>({
    customer: {},
    address: '',
    phone: '',
    serviceMan: {},
    comment: '',
    visitPrice: 0,
    boiler: {},
    parts: [],
    jobTypes: [],
    orderId: 0,
  });
  const [actions, setActions] = useState<OrderActionModel[]>([]);
  const [history, setHistory] = useState<OrderStatusHistoryItem[]>([]);
  const [modalData, setModalData] = useState<any>({
    open: false,
    comment: '',
  });
  const [action, setAction] = useState<OrderActionModel>({
    action: '',
    availableOn: '',
    code: '',
    commentRequired: false,
  });

  useEffect(() => {
    getOrderData();
    getOrderActions();
    getOrderStatusHistory();

    // eslint-disable-next-line
  }, []);

  const handleChangeModal = () => {
    setModalData({
      open: !modalData.open,
      comment: '',
    });
  };

  const onSelectAction = (action: OrderActionModel) => {
    setAction(action);
    handleChangeModal();
  };

  const handleChange = (name: string) => (event: any) => {
    setModalData({
      ...modalData,
      [name]: event.target.value,
    });
  };

  const getOrderData = () => {
    dispatch(setLoader(true));

    api
      .get(`/api/orders/${params.id}`)
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

  const getOrderActions = () => {
    api
      .get(`/api/orders/${params.id}/actions`)
      .then((res) => {
        setActions(res.data);
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

        setActions([]);
      });
  };

  const getOrderStatusHistory = () => {
    api
      .get(`/api/orders/${params.id}/history`)
      .then((res) => {
        setHistory(res.data);
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

        setHistory([]);
      });
  };

  const getButtonClass = (code: string) => {
    switch (code) {
      case 'DONE': {
        return 'btn btn_success';
      }

      case 'CANCELED': {
        return 'btn btn_danger';
      }

      case 'IN_PROGRESS': {
        return 'btn btn_success';
      }

      default: {
        return 'btn btn_primary';
      }
    }
  };

  const sendUpdateMessage = () => {
    dispatch(setLoader(true));

    const data = {
      code: 'DONE',
      orderId: params.id,
      comment: 'test message',
    };

    api
      .post(`/api/tg/update-order`, data)
      .then((res) => {
        console.log(res);
      })
      .catch((err) => {
        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: err.response?.data?.description
              ? err.response.data.description
              : 'Ошибка',
            type: 'error',
          },
        });
      })
      .finally(() => {
        dispatch(setLoader(false));
      });
  };

  const executeAction = (event: React.FormEvent<any>) => {
    event.preventDefault();

    const { code, commentRequired } = action;

    if (commentRequired && !modalData.comment) {
      return dispatch({
        type: ADD_NOTIFY,
        payload: {
          message: 'Введите комментарий',
          type: 'error',
        },
      });
    }

    dispatch(setLoader(true));

    const data = {
      code,
      orderId: params.id,
      comment: modalData.comment,
    };

    api
      .post(`/api/orders/execute-action`, data)
      .then((res) => {
        getOrderData();
        getOrderActions();
        getOrderStatusHistory();

        setActions([]);

        dispatch({
          type: ADD_NOTIFY,
          payload: {
            message: 'Статус заказа успешно изменен',
            type: 'success',
          },
        });

        handleChangeModal();
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
            <ListItem>
              <ListItemText
                primary={getPhoneLink(orderData.phone)}
                secondary={'Телефон'}
              />
            </ListItem>
          </List>
        </CardContent>
      </Card>

      <Card>
        <CardHeader
          title={`Данные о клиенте:`}
          action={
            userRole === 'ADMIN' || userRole === 'SUPER_ADMIN' ? (
              <UpdateCustomerModal
                customer={orderData.customer}
                callback={getOrderData}
              />
            ) : (
              ''
            )
          }
        />
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
                primary={orderData.customer.purchaseDate || '~'}
                secondary={'Дата покупки'}
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
                primary={orderData.customer.boiler?.name || '~'}
                secondary={'Модель бойлера'}
              />
            </ListItem>
            <ListItem>
              <ListItemText
                primary={orderData.customer.boilerSerial || '~'}
                secondary={'Серийный номер'}
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
                  {formatSum(
                    +(el?.soldQuantity || 0) * ((el as any).selectedPrice || 0)
                  )}
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
                <div className="list__item" key={el.id}>
                  {`${el.name} x ${el.soldQuantity}`}
                  <span></span>
                  {formatSum(
                    +(el?.soldQuantity || 0) * ((el as any).selectedPrice || 0)
                  )}
                </div>
              ))}
            </div>
          </div>
          <div className="total__item">
            <h4>Общая сумма заказа: {getTotalSum(orderData)}</h4>
          </div>

          <CardActions>
            {actions.map((action, index) => (
              <Btn
                key={index}
                classes={getButtonClass(action.code)}
                onClick={() => onSelectAction(action)}
              >
                {action.action}
              </Btn>
            ))}

            {/* <Btn onClick={sendUpdateMessage}>test btn</Btn> */}
          </CardActions>
        </CardContent>
      </Card>

      <Card>
        <CardHeader title="История заказа:" />
        <CardContent>
          <TableContainer component={Paper}>
            <Table>
              <TableHead>
                <TableRow>
                  <TableCell>ID</TableCell>
                  <TableCell>Пользователь</TableCell>
                  <TableCell>Статус</TableCell>
                  <TableCell>Комментарий</TableCell>
                  <TableCell>Дата</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {history.map((history: OrderStatusHistoryItem) => (
                  <TableRow key={history.id}>
                    <TableCell>{history.id}</TableCell>
                    <TableCell>{history.createdBy}</TableCell>
                    <TableCell>{history.status}</TableCell>
                    <TableCell>{history.comment}</TableCell>
                    <TableCell>
                      {formatDate(history.createdDate, true)}
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>
        </CardContent>
      </Card>

      <Dialog
        open={modalData.open}
        TransitionComponent={Transition}
        keepMounted
        onClose={handleChangeModal}
      >
        <DialogTitle>{action.action} ?</DialogTitle>
        <DialogContent className="form">
          <TextField
            className="input"
            label="Комментарий"
            variant="outlined"
            value={modalData.comment}
            onChange={handleChange('comment')}
            required={action.commentRequired}
          />
        </DialogContent>
        <DialogActions className="btn-container">
          <Btn classes="btn btn_white" onClick={handleChangeModal}>
            Отмена
          </Btn>
          <Btn classes="btn btn_primary" onClick={executeAction}>
            {action.action}
          </Btn>
        </DialogActions>
      </Dialog>
    </>
  );
};

export default OrderView;
