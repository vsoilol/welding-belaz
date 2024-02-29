import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  calendarActionTypes,
  calendarActionCreators,
} from '../calendar.actions';

function* createCalendarForWelderBasedOnMainSaga({ welderId, year }) {
  try {
    const { data: savedCalendar } = yield call(
      api.post,
      `/calendar/based-on-main/welder?year=${year}&welderId=${welderId}`
    );
    yield put(
      calendarActionCreators.createCalendarForWelderBasedOnMainSuccess(
        savedCalendar
      )
    );
  } catch (error) {
    yield put(
      calendarActionCreators.createCalendarForWelderBasedOnMainFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const createCalendarForWelderBasedOnMainWatchers = [
  takeLatest(
    calendarActionTypes.CREATE_CALENDAR_FOR_WELDER_BASED_ON_MAIN_REQUEST,
    createCalendarForWelderBasedOnMainSaga
  ),
];
