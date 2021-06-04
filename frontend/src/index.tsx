import React from 'react';
import ReactDOM from 'react-dom';
import { Router } from 'react-router';
import { Provider } from 'react-redux';
import App from './App';
import { SnackbarProvider } from 'notistack';
import { CssBaseline } from '@material-ui/core';

import './assets/scss/main.scss';
import store from './store';
import history from './utils/history';

ReactDOM.render(
  <React.StrictMode>
    <CssBaseline />

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
