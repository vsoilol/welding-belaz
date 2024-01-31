import {
  call,
  put,
  fork,
  cancel,
  take,
  cancelled,
  takeLatest,
} from 'redux-saga/effects';
import { LOCATION_CHANGE } from 'connected-react-router';
import api, { getCancelToken } from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  calendarActionTypes,
  calendarActionCreators,
} from '../calendar.actions';

function* loadCalendarByWelderSaga(year, welderId) {
  const { cancelToken, cancel } = getCancelToken();

  try {
    const response = yield call(
      api.getCancelled,
      `/calendar/byWelder?WelderId=${welderId}&Year=${year}`,
      cancelToken
    );

    if (response.status === 204) {
      const emptyCalendar = {
        year,
        welderId,
        days: null,
        mainWorkingShift: null,
      };

      const { data: savedCalendar } = yield call(
        api.post,
        '/calendar/withWelder',
        emptyCalendar
      );
      yield put(
        calendarActionCreators.loadCalendarByWelderSuccess(savedCalendar)
      );
    } else {
      yield put(
        calendarActionCreators.loadCalendarByWelderSuccess(response.data)
      );
    }
  } catch (error) {
    yield put(calendarActionCreators.loadCalendarByWelderFailure(error));
    yield put(errorActionCreators.setError(error.message));
  } finally {
    if (yield cancelled()) {
      cancel('Operation canceled by the user.');
    }
  }
}

function* manageLoadCalendarByWelderSaga({ welderId, year }) {
  const forkedSaga = yield fork(loadCalendarByWelderSaga, year, welderId);

  yield take(LOCATION_CHANGE);

  yield cancel(forkedSaga);
}

export const loadCalendarByWelderWatchers = [
  takeLatest(
    calendarActionTypes.LOAD_CALENDAR_BY_WELDER_REQUEST,
    manageLoadCalendarByWelderSaga
  ),
];
