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
import { masterActionTypes, masterActionCreators } from '../master.actions';

function* loadMastersSaga() {
  const { cancelToken, cancel } = getCancelToken();

  try {
    const response = yield call(api.getCancelled, `/master`, cancelToken);

    yield put(masterActionCreators.loadMastersSuccess(response.data));
  } catch (error) {
    yield put(masterActionCreators.loadMastersFailure(error));
    yield put(errorActionCreators.setError(error.message));
  } finally {
    if (yield cancelled()) {
      cancel('Operation canceled by the user.');
    }
  }
}

function* manageLoadMastersSaga() {
  const forkedSaga = yield fork(loadMastersSaga);

  yield take([
    ROUTER_ON_LOCATION_CHANGED,
    masterActionTypes.LOAD_MASTERS_CANCEL,
  ]);

  yield cancel(forkedSaga);
}

export const loadMastersWatchers = [
  takeLatest(masterActionTypes.LOAD_MASTERS_REQUEST, manageLoadMastersSaga),
];
