import { call, put, takeLatest, select } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar-actions";

function* createWorkingShiftSaga({ workingShift }) {
  try {
    yield call(api.post, "/workingShift", workingShift);

    yield put(calendarActionCreators.createWorkingShiftSuccess());
  } catch (error) {
    yield put(calendarActionCreators.createWorkingShiftFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

function* reloadCalendarAfterCreateWorkingShiftSaga() {
  let calendarYear = yield select((state) => state.calendar?.calendar?.year);
  yield put(calendarActionCreators.loadMainCalendarByYearRequest(calendarYear));
}

export const createWorkingShiftWatchers = [
  takeLatest(
    calendarActionTypes.CREATE_WORKING_SHIFT_REQUEST,
    createWorkingShiftSaga
  ),
  takeLatest(
    calendarActionTypes.CREATE_WORKING_SHIFT_SUCCESS,
    reloadCalendarAfterCreateWorkingShiftSaga
  ),
];
