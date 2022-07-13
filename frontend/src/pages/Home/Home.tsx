import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { StoreModel } from '../../models/storeModel';
import { getCashInfo, getOrdersInfo } from '../../store/actions/mainActions';
import { formatSum } from '../../utils/formatSum';

const Home = () => {
  const dispatch = useDispatch();
  const ordersInfo = useSelector(
    (store: StoreModel) => store.mainStore.dashboardOrders
  );
  const cashInfo = useSelector(
    (store: StoreModel) => store.mainStore.dashboardCash
  );

  useEffect(() => {
    dispatch(getOrdersInfo());
    dispatch(getCashInfo());

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <>
      <div className="dashboard">
        <div className="stats dashboard__item">
          <div className="stats__item">
            <h4>Мои заказы</h4>
            <p>{ordersInfo.count}</p>
          </div>
          <div className="stats__item">
            <h4>Новых заказов</h4>
            <p>{ordersInfo.newOrders}</p>
          </div>
          <div className="stats__item">
            <h4>Заказы в работе</h4>
            <p>{ordersInfo.wipOrders}</p>
          </div>
          <div className="stats__item">
            <h4>Выполненные заказы</h4>
            <p>{ordersInfo.doneOrders}</p>
          </div>
          <div className="stats__item">
            <h4>Отложенные заказы</h4>
            <p>{ordersInfo.onHoldOrders}</p>
          </div>
          <div className="stats__item">
            <h4>Отмененные заказы</h4>
            <p>{ordersInfo.canceledOrders}</p>
          </div>
        </div>

        <div className="stats dashboard__item">
          <div className="stats__item">
            <h4>Будущие выплаты</h4>
            <p>{formatSum(cashInfo.notReadySum)}</p>
          </div>
          <div className="stats__item">
            <h4>Готово к выплате</h4>
            <p>{formatSum(cashInfo.readySum)}</p>
          </div>
          <div className="stats__item">
            <h4>Уже выплачено</h4>
            <p>{formatSum(cashInfo.paidSum)}</p>
          </div>
        </div>
      </div>
    </>
  );
};

export default Home;
