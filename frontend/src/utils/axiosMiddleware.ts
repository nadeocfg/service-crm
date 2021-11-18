import axios from 'axios';

const api = axios;

api.interceptors.request.use((config: any) => {
  const authData = window.localStorage.getItem('AUTH_DATA');
  const authDataParse = authData ? JSON.parse(authData) : '';

  const { token } = authDataParse;

  if (token) {
    config.headers.authorization = `Bearer ${token}`;
  }

  return config;
});

export default api;
