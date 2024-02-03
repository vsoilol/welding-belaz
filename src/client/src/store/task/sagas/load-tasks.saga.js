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
import { taskActionTypes, taskActionCreators } from '../task.actions';

function* loadTasksSaga() {
  const { cancelToken, cancel } = getCancelToken();

  try {
    const response = yield call(api.getCancelled, `/weldingTask`, cancelToken);

    yield put(taskActionCreators.loadTasksSuccess(response.data));
  } catch (error) {
    yield put(taskActionCreators.loadTasksFailure(error));
    yield put(errorActionCreators.setError(error.message));
  } finally {
    if (yield cancelled()) {
      cancel('Operation canceled by the user.');
    }
  }
}

function* manageLoadTasksSaga() {
  const forkedSaga = yield fork(loadTasksSaga);

  yield take([ROUTER_ON_LOCATION_CHANGED, taskActionTypes.LOAD_TASKS_CANCEL]);

  yield cancel(forkedSaga);
}

export const loadTasksWatchers = [
  takeLatest(taskActionTypes.LOAD_TASKS_REQUEST, manageLoadTasksSaga),
];
