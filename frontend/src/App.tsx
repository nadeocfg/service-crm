import { Route, Switch, useHistory } from 'react-router';
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
import EditUser from './pages/EditUser';
import DictRoles from './pages/administration/DictRoles';
import DictWorkTypes from './pages/administration/DictBoilers';
import DictBoilers from './pages/administration/DictWorkTypes';
import DictParts from './pages/administration/DictParts';

const App = () => {
  const dispatch = useDispatch();
  const history = useHistory();
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
      history.push('/');
    }
  }, [dispatch, history]);

  useEffect(() => {
    dispatch(changeDrawer(window.innerWidth > 960));
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
              <Route exact path="/edit-user/:id">
                <EditUser />
              </Route>

              <Route exact path="/administration/roles">
                <DictRoles />
              </Route>
              <Route exact path="/administration/work-types">
                <DictWorkTypes />
              </Route>
              <Route exact path="/administration/boilers">
                <DictBoilers />
              </Route>
              <Route exact path="/administration/parts">
                <DictParts />
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
