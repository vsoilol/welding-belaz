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
  let { year, welderId, weldingEquipmentId } = yield select(
    (state) => state.calendar?.calendar
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
