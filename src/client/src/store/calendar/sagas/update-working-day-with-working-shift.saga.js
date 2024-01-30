import { call, put, takeLatest, select } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar.actions";

function* updateWorkingDayWithWorkingShiftSaga({ day, workingShift }) {
  let calendar = yield select((state) => state.calendar?.calendar);

  if (!calendar) {
    return;
  }

  try {
    if (!day.isWorkingDay) {
      day.isWorkingDay = true;
      yield call(api.put, "/day", day);
    }

    workingShift.calendarId = null;
    workingShift.dayId = day.id;

    yield call(api.post, "/workingShift", workingShift);

    yield put(calendarActionCreators.updateWorkingDayWithWorkingShiftSuccess());
  } catch (error) {
    yield put(
      calendarActionCreators.updateWorkingDayWithWorkingShiftFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

function* reloadCalendarAfterUpdateSaga() {
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

export const updateWorkingDayWithWorkingShiftWatchers = [
  takeLatest(
    calendarActionTypes.UPDATE_WORKING_DAY_WITH_WORKING_SHIFT_REQUEST,
    updateWorkingDayWithWorkingShiftSaga
  ),
  takeLatest(
    calendarActionTypes.UPDATE_WORKING_DAY_WITH_WORKING_SHIFT_SUCCESS,
    reloadCalendarAfterUpdateSaga
  ),
];
