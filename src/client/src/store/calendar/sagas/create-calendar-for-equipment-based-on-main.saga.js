import { call, put, takeLatest } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar.actions";

function* createCalendarForEquipmentBasedOnMainSaga({ equipmentId, year }) {
  try {
    const { data: savedCalendar } = yield call(
      api.post,
      `/calendar/based-on-main/equipment?year=${year}&equipmentId=${equipmentId}`
    );
    yield put(
      calendarActionCreators.createCalendarForEquipmentBasedOnMainSuccess(
        savedCalendar
      )
    );
  } catch (error) {
    yield put(
      calendarActionCreators.createCalendarForEquipmentBasedOnMainFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const createCalendarForEquipmentBasedOnMainWatchers = [
  takeLatest(
    calendarActionTypes.CREATE_CALENDAR_FOR_EQUIPMENT_BASED_ON_MAIN_REQUEST,
    createCalendarForEquipmentBasedOnMainSaga
  ),
];
