import { call, put, takeLatest, select } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar-actions";

function* updateDaySaga({ day }) {
  try {
    yield call(api.put, "/day", day);

    yield put(calendarActionCreators.updateDaySuccess());
  } catch (error) {
    yield put(calendarActionCreators.updateDayFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

function* reloadCalendarAfterUpdateDaySaga() {
  let calendarYear = yield select((state) => state.calendar?.calendar?.year);
  yield put(calendarActionCreators.loadMainCalendarByYearRequest(calendarYear));
}

export const updateDayWatchers = [
  takeLatest(calendarActionTypes.UPDATE_DAY_REQUEST, updateDaySaga),
  takeLatest(
    calendarActionTypes.UPDATE_DAY_SUCCESS,
    reloadCalendarAfterUpdateDaySaga
  ),
];
