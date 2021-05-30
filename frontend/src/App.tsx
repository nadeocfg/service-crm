import { Route, Switch } from 'react-router';
import SingIn from './pages/SignIn';
import Snackbar from './components/Snackbar';
import { useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { getUserByToken } from './store/actions/userActions';

const App = () => {
  const dispatch = useDispatch();

  useEffect(() => {
    if (window.localStorage['AUTH_DATA']) {
      dispatch(
        getUserByToken(JSON.parse(window.localStorage['AUTH_DATA']).token)
      );
    }
  }, [dispatch]);

  return (
    <>
      <main>
        <Switch>
          <Route exact path="/">
            <SingIn />
          </Route>
        </Switch>
      </main>

      <Snackbar />
    </>
  );
};

export default App;
