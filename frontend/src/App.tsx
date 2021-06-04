import { Route, Switch, useLocation } from 'react-router';
import SingIn from './pages/SignIn';
import Snackbar from './components/Snackbar';
import { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { getUserByToken } from './store/actions/userActions';
import { StoreModel } from './models/storeModel';
import Home from './pages/Home';
import Loader from './components/Loader';
import Appbar from './components/Appbar';
import { changeDrawer, setLoader } from './store/actions/mainActions';
import Users from './pages/Users';
import { getUsers } from './store/actions/usersPageActions';

const App = () => {
  const dispatch = useDispatch();
  const location = useLocation();
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
    } else {
      dispatch(setLoader(false));
    }

    dispatch(getUsers());
  }, [dispatch]);

  useEffect(() => {
    dispatch(changeDrawer(window.innerWidth > 960));
  }, [location, dispatch]);

  return (
    <>
      {!isAuthorized ? (
        <main>
          <Switch>
            <Route exact path="/">
              <SingIn />
            </Route>
          </Switch>
        </main>
      ) : (
        <>
          <Appbar />

          <main>
            <Switch>
              <Route exact path="/">
                <Home />
              </Route>
              <Route exact path="/users">
                <Users />
              </Route>
            </Switch>
          </main>
        </>
      )}

      {isLoading && <Loader />}

      <Snackbar />
    </>
  );
};

export default App;
