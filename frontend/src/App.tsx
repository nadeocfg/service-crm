import { useSnackbar } from 'notistack';
import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Route, Switch } from 'react-router';
import { snackbarModel } from './models/snackbarModel';
import SingIn from './pages/SignIn';
import { getCurrentUser } from './store/actions/userActions';

function App() {
  const dispatch = useDispatch();

  const snackbarStore: snackbarModel = useSelector(
    (state: any) => state.snackbarStore
  );
  const { enqueueSnackbar } = useSnackbar();

  useEffect(() => {
    if (snackbarStore.message) {
      enqueueSnackbar(snackbarStore.message, {
        variant: snackbarStore.type,
        autoHideDuration: 3000,
        anchorOrigin: { horizontal: 'right', vertical: 'top' },
        preventDuplicate: false,
      });
    }
  }, [snackbarStore.message, snackbarStore.type, enqueueSnackbar]);

  return (
    <>
      <main>
        <Switch>
          <Route exact path="/">
            <SingIn />
          </Route>
        </Switch>
      </main>
    </>
  );
}

export default App;
