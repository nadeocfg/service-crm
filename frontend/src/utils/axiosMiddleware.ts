import axios from 'axios';

const api = axios;

api.interceptors.request.use(function (config) {
  const authData = window.localStorage.getItem('AUTH_DATA');
  const authDataParse = authData ? JSON.parse(authData) : '';

  const { token } = authDataParse;
  console.log(token);

  if (token) {
    config.headers.authorization = `Bearer ${token}`;
  }

  return config;
});

export default api;
