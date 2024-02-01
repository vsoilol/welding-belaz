import {
  call,
  put,
  fork,
  cancel,
  take,
  cancelled,
  takeLatest,
} from 'redux-saga/effects';
import { ROUTER_ON_LOCATION_CHANGED } from '@lagunovsky/redux-react-router';
import api, { getCancelToken } from 'services/api';
import { errorActionCreators } from 'store/error';
import { welderActionTypes, welderActionCreators } from '../welder.actions';

function* getWelderByIdSaga(id) {
  const { cancelToken, cancel } = getCancelToken();

  try {
    const response = yield call(api.getCancelled, `/welder/${id}`, cancelToken);

    yield put(welderActionCreators.getWelderByIdSuccess(response.data));
  } catch (error) {
    yield put(welderActionCreators.getWelderByIdFailure(error));
    yield put(errorActionCreators.setError(error.message));
  } finally {
    if (yield cancelled()) {
      cancel('Operation canceled by the user.');
    }
  }
}

function* manageGetWelderByIdSaga({ id }) {
  const forkedSaga = yield fork(getWelderByIdSaga, id);

  yield take(ROUTER_ON_LOCATION_CHANGED);

  yield cancel(forkedSaga);
}

export const getWelderByIdWatchers = [
  takeLatest(
    welderActionTypes.GET_WELDER_BY_ID_REQUEST,
    manageGetWelderByIdSaga
  ),
];
