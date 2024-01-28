import { call, put, takeLatest, select } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar-actions";

function* createDaySaga({ day }) {
  try {
    yield call(api.post, "/day", day);

    yield put(calendarActionCreators.createDaySuccess());
  } catch (error) {
    yield put(calendarActionCreators.createDayFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

function* reloadCalendarAfterCreateDaySaga() {
  let calendarYear = yield select((state) => state.calendar?.calendar?.year);
  yield put(calendarActionCreators.loadMainCalendarByYearRequest(calendarYear));
}

export const createDayWatchers = [
  takeLatest(calendarActionTypes.CREATE_DAY_REQUEST, createDaySaga),
  takeLatest(
    calendarActionTypes.CREATE_DAY_SUCCESS,
    reloadCalendarAfterCreateDaySaga
  ),
];
