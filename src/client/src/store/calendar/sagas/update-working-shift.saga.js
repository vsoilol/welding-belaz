import { call, put, takeLatest, select } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar.actions";

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
