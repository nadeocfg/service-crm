import React from 'react';
import ReactDOM from 'react-dom';
import { Router } from 'react-router';
import { Provider } from 'react-redux';
import { createBrowserHistory } from 'history';
import App from './App';
import { SnackbarProvider } from 'notistack';

import './assets/scss/main.scss';
import store from './store';

const history = createBrowserHistory();

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <Router history={history}>
        <SnackbarProvider maxSnack={5}>
          <App />
        </SnackbarProvider>
      </Router>
    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
);
