import { call, put, takeLatest, select } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar.actions";

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

export const updateDayWatchers = [
  takeLatest(calendarActionTypes.UPDATE_DAY_REQUEST, updateDaySaga),
  takeLatest(
    calendarActionTypes.UPDATE_DAY_SUCCESS,
    reloadCalendarAfterUpdateDaySaga
  ),
];
