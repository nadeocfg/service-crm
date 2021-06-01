import { Route, Switch } from 'react-router';
import SingIn from './pages/SignIn';
import Snackbar from './components/Snackbar';
import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { getUserByToken } from './store/actions/userActions';
import { StoreModel } from './models/storeModel';
import Home from './pages/Home';
import Loader from './components/Loader';

const App = () => {
  const dispatch = useDispatch();
  const isAuthorized = useSelector(
    (store: StoreModel) => store.userStore.isAuthorized
  );
  const isLoading = useSelector(
    (store: StoreModel) => store.mainStore.isLoading
  );

  useEffect(() => {
    if (window.localStorage['AUTH_DATA']) {
      dispatch(
        getUserByToken(JSON.parse(window.localStorage['AUTH_DATA']).token)
      );
    }
  }, [dispatch]);

  return (
    <>
      {!isAuthorized ? (
        <main>
          <Switch>
            <Route exact path="/">
              <SingIn />
            </Route>
          </Switch>

          {isLoading && <Loader />}
        </main>
      ) : (
        <main>
          <Switch>
            <Route exact path="/">
              <Home />
            </Route>
          </Switch>

          {isLoading && <Loader />}
        </main>
      )}
      <Snackbar />
    </>
  );
};

export default App;
