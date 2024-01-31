import { call, put, takeLatest, select } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  calendarActionTypes,
  calendarActionCreators,
} from '../calendar.actions';

function* createDaySaga({ day }) {
  try {
    yield call(api.post, '/day', day);

    yield put(calendarActionCreators.createDaySuccess());
  } catch (error) {
    yield put(calendarActionCreators.createDayFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

function* reloadCalendarAfterCreateDaySaga() {
  let { year, welderId, weldingEquipmentId } = yield select(
    state => state.calendar?.calendar
  );

  if (weldingEquipmentId) {
    yield put(
      calendarActionCreators.loadCalendarByEquipmentRequest(
        weldingEquipmentId,
        year
      )
    );
    return;
  }

  if (welderId) {
    yield put(
      calendarActionCreators.loadCalendarByWelderRequest(welderId, year)
    );
    return;
  }

  yield put(calendarActionCreators.loadMainCalendarByYearRequest(year));
}

export const createDayWatchers = [
  takeLatest(calendarActionTypes.CREATE_DAY_REQUEST, createDaySaga),
  takeLatest(
    calendarActionTypes.CREATE_DAY_SUCCESS,
    reloadCalendarAfterCreateDaySaga
  ),
];
