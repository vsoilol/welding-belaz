import { call, put, takeLatest, select } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar-actions";

function* deleteWorkingShiftSaga({ workingShiftId }) {
  try {
    yield call(api.remove, `/workingShift/${workingShiftId}`);

    yield put(calendarActionCreators.deleteWorkingShiftSuccess());
  } catch (error) {
    yield put(calendarActionCreators.deleteWorkingShiftFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

function* reloadCalendarAfterDeleteWorkingShiftSaga() {
  let calendarYear = yield select((state) => state.calendar?.calendar?.year);
  yield put(calendarActionCreators.loadMainCalendarByYearRequest(calendarYear));
}

export const deleteWorkingShiftWatchers = [
  takeLatest(
    calendarActionTypes.DELETE_WORKING_SHIFT_REQUEST,
    deleteWorkingShiftSaga
  ),
  takeLatest(
    calendarActionTypes.DELETE_WORKING_SHIFT_SUCCESS,
    reloadCalendarAfterDeleteWorkingShiftSaga
  ),
];
