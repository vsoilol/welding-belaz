import { call, put, takeLatest, select } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar-actions";

function* updateWorkingShiftSaga({ workingShift }) {
  try {
    yield call(api.put, `/workingShift`, workingShift);

    yield put(calendarActionCreators.updateWorkingShiftSuccess());
  } catch (error) {
    yield put(calendarActionCreators.updateWorkingShiftFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

function* reloadCalendarAfterUpdateWorkingShiftSaga() {
  let calendarYear = yield select((state) => state.calendar?.calendar?.year);
  yield put(calendarActionCreators.loadMainCalendarByYearRequest(calendarYear));
}

export const updateWorkingShiftWatchers = [
  takeLatest(
    calendarActionTypes.UPDATE_WORKING_SHIFT_REQUEST,
    updateWorkingShiftSaga
  ),
  takeLatest(
    calendarActionTypes.UPDATE_WORKING_SHIFT_SUCCESS,
    reloadCalendarAfterUpdateWorkingShiftSaga
  ),
];
