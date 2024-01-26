import { takeLatest } from "redux-saga/effects";
import { calendarTypes, loadMainCalendarByYear } from "./actions";

export default function* calendarSaga() {
  yield takeLatest(
    calendarTypes.LOAD_MAIN_CALENDAR_BY_YEAR_REQUEST,
    loadMainCalendarByYear
  );
}
