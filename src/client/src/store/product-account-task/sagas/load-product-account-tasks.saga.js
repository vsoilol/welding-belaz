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
import {
  productAccountTaskActionTypes,
  productAccountTaskActionCreators,
} from '../product-account-task.actions';

function* loadProductAccountTasksSaga() {
  const { cancelToken, cancel } = getCancelToken();

  try {
    const response = yield call(
      api.getCancelled,
      `/productAccountTask`,
      cancelToken
    );

    yield put(
      productAccountTaskActionCreators.loadProductAccountTasksSuccess(
        response.data
      )
    );
  } catch (error) {
    yield put(
      productAccountTaskActionCreators.loadProductAccountTasksFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  } finally {
    if (yield cancelled()) {
      cancel('Operation canceled by the user.');
    }
  }
}

function* manageLoadProductAccountTasksSaga() {
  const forkedSaga = yield fork(loadProductAccountTasksSaga);

  yield take([
    ROUTER_ON_LOCATION_CHANGED,
    productAccountTaskActionTypes.LOAD_PRODUCT_ACCOUNT_TASKS_CANCEL,
  ]);

  yield cancel(forkedSaga);
}

export const loadProductAccountTasksWatchers = [
  takeLatest(
    productAccountTaskActionTypes.LOAD_PRODUCT_ACCOUNT_TASKS_REQUEST,
    manageLoadProductAccountTasksSaga
  ),
];
