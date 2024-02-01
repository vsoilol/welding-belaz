import {
  call,
  put,
  fork,
  cancel,
  take,
  cancelled,
  takeLatest,
} from 'redux-saga/effects';
import api, { getCancelToken } from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  calendarActionTypes,
  calendarActionCreators,
} from '../calendar.actions';
import { ROUTER_ON_LOCATION_CHANGED } from '@lagunovsky/redux-react-router';

function* loadMainCalendarByYearSaga(year) {
  const { cancelToken, cancel } = getCancelToken();

  try {
    const response = yield call(
      api.getCancelled,
      `/calendar/main/${year}`,
      cancelToken
    );

    if (response.status === 204) {
      yield put(calendarActionCreators.createCalendarFromStoredRequest(year));
    } else {
      yield put(
        calendarActionCreators.loadMainCalendarByYearSuccess(response.data)
      );
    }
  } catch (error) {
    yield put(calendarActionCreators.loadMainCalendarByYearFailure(error));
    yield put(errorActionCreators.setError(error.message));
  } finally {
    if (yield cancelled()) {
      cancel('Operation canceled by the user.');
    }
  }
}

function* manageLoadMainCalendarByYearSaga({ year }) {
  const forkedSaga = yield fork(loadMainCalendarByYearSaga, year);

  yield take(ROUTER_ON_LOCATION_CHANGED);

  yield cancel(forkedSaga);
}

export const loadMainCalendarByYearWatchers = [
  takeLatest(
    calendarActionTypes.LOAD_MAIN_CALENDAR_BY_YEAR_REQUEST,
    manageLoadMainCalendarByYearSaga
  ),
];
