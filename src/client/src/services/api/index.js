import axios from "axios";
import store from "store";
import history from "store/history";
import apiConfig from "./configure";

axios.defaults.baseURL = apiConfig.getBaseUrl();
axios.defaults.timeout = apiConfig.timeout;

axios.interceptors.response.use(
  response => response,
  error => {
    const status = error.response ? error.response.status : null;

    if (status === 401) {
      if (
        history.location.pathname !== "/login" &&
        history.location.pathname !== "/new_password" &&
        history.location.pathname !== "/reset_password"
      ) {
        store.dispatch({ type: "LOG_OUT_REQUEST" });
      }
    }

    return Promise.reject(error);
  }
);

const setHeaders = headers => {
  const defaultHeader = { "Content-Type": "application/json" };
  if (headers) return Object.assign(defaultHeader, headers);
  return defaultHeader;
};

const setAuthTokenToHeader = token => {
  if (token) {
    axios.defaults.headers.common.Authorization = `Bearer ${token}`;
  } else {
    delete axios.defaults.headers.common.Authorization;
  }
};

const get = (url, headers) => {
  return axios.get(`${url}`, setHeaders(headers));
};

const post = (url, data, headers) => {
  const currentHeaders = setHeaders(headers);
  return axios.post(`${url}`, data, currentHeaders);
};

const patch = (url, data, headers) => {
  return axios.patch(`${url}`, data, setHeaders(headers));
};

const put = (url, data, headers) => {
  return axios.put(`${url}`, data, setHeaders(headers));
};

const remove = (url, data, headers) => {
  return axios.delete(`${url}`, setHeaders(headers));
};

export default {
  get,
  post,
  put,
  patch,
  remove,
  setAuthTokenToHeader
};
