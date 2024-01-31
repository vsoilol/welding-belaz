import { takeLatest, call, put } from 'redux-saga/effects';
import api from 'services/api';
import auth from 'services/auth';
import authActions from './actions';
import history from 'store/history';
import errorActions from '../error/actions';

const {
  Types: { LOG_IN_REQUEST, LOG_OUT_REQUEST },
  Creators: { logInSuccess, logInFailure, logOutSuccess, logOutFailure },
} = authActions;

const {
  Creators: { setError },
} = errorActions;

function* logIn({ payload }) {
  try {
    const { data } = yield call(api.post, `/auth/login`, {
      userName: payload.email,
      password: payload.password,
    });

    localStorage.setItem('isFirstLogin', data.isFirstLogin);
    yield put(logInSuccess(data));

    auth.setToken(data.token);
    api.setAuthTokenToHeader(data.token);
  } catch (error) {
    yield put(logInFailure(error));
    yield put(setError(error.response.data.message));
  }
}

function* logOut() {
  try {
    yield call(api.get, `/auth/logout`);
    yield put(logOutSuccess());
    auth.removeToken();
    api.setAuthTokenToHeader();
    history.push('/login');
  } catch (error) {
    yield put(logOutFailure(error));
  }
}

export default [
  takeLatest(LOG_IN_REQUEST, logIn),
  takeLatest(LOG_OUT_REQUEST, logOut),
];
