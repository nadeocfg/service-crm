import { useSnackbar } from 'notistack';
import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { NotificationItemModel, StoreModel } from '../../models/storeModel';
import { removeNotify } from '../../store/actions/snackbarActions';

export default function Snackbar() {
  const dispatch = useDispatch();
  const notifications = useSelector(
    (store: StoreModel) => store.snackbarStore.notifications || []
  );
  const { enqueueSnackbar } = useSnackbar();

  useEffect(() => {
    notifications.forEach((notification: NotificationItemModel) => {
      if (!notification.isShown) {
        enqueueSnackbar(notification.message, {
          variant: notification.type,
          autoHideDuration: 3000,
          anchorOrigin: { horizontal: 'right', vertical: 'top' },
          preventDuplicate: false,
          onExited: () => {
            dispatch(removeNotify(notification.id));
          },
        });

        notification.isShown = true;
      }
    });
  }, [notifications, enqueueSnackbar, dispatch]);

  return null;
}
