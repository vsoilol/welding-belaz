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
  weldingRecordActionTypes,
  weldingRecordActionCreators,
} from '../welding-record.actions';

function* getFilteredRecordsSaga(payload) {
  const { cancelToken, cancel } = getCancelToken();

  const params = new URLSearchParams();

  for (const key in payload) {
    if (payload[key]) {
      params.append(key, payload[key]);
    }
  }

  params.append('desiredArrayLength', 500);

  try {
    const { data } = yield call(
      api.getCancelled,
      `/weldingRecord/filtered?${params.toString()}`,
      cancelToken
    );

    data.pageNumber--;

    yield put(weldingRecordActionCreators.getFilteredRecordsSuccess(data));
  } catch (error) {
    yield put(weldingRecordActionCreators.getFilteredRecordsFailure(error));
    yield put(errorActionCreators.setError(error.message));
  } finally {
    if (yield cancelled()) {
      cancel('Operation canceled by the user.');
    }
  }
}

function* manageGetFilteredRecordsSaga({ payload }) {
  const forkedSaga = yield fork(getFilteredRecordsSaga, payload);

  yield take([
    ROUTER_ON_LOCATION_CHANGED,
    weldingRecordActionTypes.GET_FILTERED_RECORDS_CANCEL,
  ]);

  yield cancel(forkedSaga);
}

export const getFilteredRecordsWatchers = [
  takeLatest(
    weldingRecordActionTypes.GET_FILTERED_RECORDS,
    manageGetFilteredRecordsSaga
  ),
];
