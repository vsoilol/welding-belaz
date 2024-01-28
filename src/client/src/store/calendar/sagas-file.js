import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import calendarActions from "./actions-file";
import errorActions from "../error/actions";
import { calendarTypes, loadMainCalendarByYear } from "./sagas/index";

const {
  Types: {
    ///Календарь
    LOAD_CALENDARYEAR_REQUEST,
    ADD_CALENDARMAIN_REQUEST,
    EDIT_EDITCALENDAR_REQUEST,
    ADD_CALENDARWELDER_REQUEST,
    LOAD_CALENDARWELDER_REQUEST,
    ADD_CALENDAREQUIPMENT_REQUEST,
    LOAD_CALENDAREQUIPMENT_REQUEST,

    ////WorkingShift
    EDIT_SHIFT_REQUEST,
    ADD_SHIFT_REQUEST,

    ////Day
    LOAD_DAYEQUI_REQUEST,
    LOAD_DAYBYWELDER_REQUEST,
    EDIT_DAY_REQUEST,
    ADD_DAY_REQUEST,

    // LOAD_MAIN_CALENDAR_BY_YEAR_REQUEST,
  },
  Creators: {
    ///Календарь
    loadCalendaryearSuccess,
    loadCalendaryearFailure,

    addCalendarmainSuccess,
    addCalendarmainFailure,

    editEditcalendarFailure,

    addCalendarwelderFailure,

    loadCalendarwelderFailure,

    loadCalendarequipmentFailure,

    loadDayByWelderSuccess,

    editShiftFailure,

    addShiftSuccess,
    addShiftFailure,

    editDayFailure,

    addDayFailure,

    loadDayequiSuccess,
    loadDayequiFailure,
  },
} = calendarActions;

const {
  Creators: { setError },
} = errorActions;

///Календарь
function* loadCalendaryear(date) {
  try {
    const { data } = yield call(api.get, `/calendar/main/${date.payload}`);
    yield put(loadCalendaryearSuccess(data));
  } catch (error) {
    yield put(loadCalendaryearFailure(error));
    yield put(setError(error.message));
  }
}

function* addCalendarmain({ payload }) {
  try {
    const { data } = yield call(api.post, `/calendar/main`, {
      year: 2023,
      mainWorkingShift: [
        {
          number: 1,
          shiftStart: "11:30",
          shiftEnd: "11:30",
          breakStart: "11:30",
          breakEnd: "11:30",
        },
      ],
      days: [
        {
          monthNumber: 1,
          number: 24,
          isWorkingDay: true,
          workingShifts: [
            {
              number: 1,
              shiftStart: "11:30",
              shiftEnd: "11:30",
              breakStart: "11:30",
              breakEnd: "11:30",
            },
          ],
        },
      ],
    });
    yield put(addCalendarmainSuccess(data));
  } catch (error) {
    yield put(addCalendarmainFailure(error));
    yield put(setError(error.message));
  }
}

function* editEditcalendar({ payload }) {
  try {
  } catch (error) {
    yield put(editEditcalendarFailure(error));
    yield put(setError(error.message));
  }
}

function* addCalendarwelder({ payload }) {
  try {
    // yield put(addCalendarwelderSuccess(data));
  } catch (error) {
    yield put(addCalendarwelderFailure(error));
    yield put(setError(error.message));
  }
}

function* loadCalendarwelder() {
  try {
    // const { data } = yield call(api.get, `/calendar/byWelde`);
    // console.log(data)
    // yield put(loadCalendarwelderSuccess(data));
  } catch (error) {
    yield put(loadCalendarwelderFailure(error));
    yield put(setError(error.message));
  }
}

function* addCalendarequipment({ payload }) {
  try {
    // yield put(addCalendarwelderSuccess(data));
  } catch (error) {
    yield put(addCalendarwelderFailure(error));
    yield put(setError(error.message));
  }
}

function* loadCalendarequipment() {
  try {
    // const { data } = yield call(api.get, `/calendar/byEquipment`);
    // console.log(data)
    // yield put(loadCalendarequipmentSuccess(data));
  } catch (error) {
    yield put(loadCalendarequipmentFailure(error));
    yield put(setError(error.message));
  }
}

///WorkingShift
function* addShift({ payload }) {
  try {
    const { data } = yield call(api.post, `/workingShift`, {
      number: payload.shiftNumb,
      shiftStart: payload.shiftStart,
      shiftEnd: payload.shiftEnd,
      breakStart: payload.breakStart,
      breakEnd: payload.breakEnd,
      year: 2023,
      dayId: null,
    });
    window.location.reload();
    yield put(addShiftSuccess(data));
  } catch (error) {
    yield put(addShiftFailure(error));
    yield put(setError(error.message));
  }
}

function* editShift({ payload }) {
  try {
    // yield put(editShiftSuccess(data));
  } catch (error) {
    yield put(editShiftFailure(error));
    yield put(setError(error.message));
  }
}

///Day
function* addDay({ payload }) {
  try {
    const { data } = yield call(api.post, `/day`, payload);
    yield call(loadDayByWelder(payload.welderId));
  } catch (error) {
    yield put(addDayFailure(error));
    yield put(setError(error.message));
  }
}

function* editDay({ payload }) {
  try {
    const { data } = yield call(api.put, `/day`, {
      id: payload.daiID,
      monthNumber: payload.monthNumber,
      number: payload.number,
      isWorkingDay: true,
      year: 2023,
    });

    /* window.location.reload() */
    // yield put(editDaySuccess(data));
  } catch (error) {
    yield put(editDayFailure(error));
    yield put(setError(error.message));
  }
}

/// Day by  Welder
function* loadDayByWelder({ payload }) {
  try {
    const { data } = yield call(api.get, `/day/byWelder/${payload}`);
    yield put(loadDayByWelderSuccess(data));
  } catch (error) {
    yield put(addDayFailure(error));
    yield put(setError(error.message));
  }
}

function* loadDayByEquipment({ payload }) {
  try {
    const { data } = yield call(api.get, `/day/byEquipment/${payload}`);
    yield put(loadDayequiSuccess(data));
  } catch (error) {
    yield put(loadDayequiFailure(error));
    yield put(setError(error.message));
  }
}

export function* CalendarSaga() {
  ///Календарь
  yield takeLatest(LOAD_CALENDARYEAR_REQUEST, loadCalendaryear);
  yield takeLatest(ADD_CALENDARMAIN_REQUEST, addCalendarmain);
  yield takeLatest(EDIT_EDITCALENDAR_REQUEST, editEditcalendar);
  yield takeLatest(ADD_CALENDARWELDER_REQUEST, addCalendarwelder);
  yield takeLatest(LOAD_CALENDARWELDER_REQUEST, loadCalendarwelder);
  yield takeLatest(ADD_CALENDAREQUIPMENT_REQUEST, addCalendarequipment);
  yield takeLatest(LOAD_CALENDAREQUIPMENT_REQUEST, loadCalendarequipment);

  ///WorkingShift

  yield takeLatest(ADD_SHIFT_REQUEST, addShift);
  yield takeLatest(EDIT_SHIFT_REQUEST, editShift);

  ///Day
  yield takeLatest(LOAD_DAYBYWELDER_REQUEST, loadDayByWelder);
  yield takeLatest(LOAD_DAYEQUI_REQUEST, loadDayByEquipment);

  yield takeLatest(ADD_DAY_REQUEST, addDay);
  yield takeLatest(EDIT_DAY_REQUEST, editDay);

  yield takeLatest(
    calendarTypes.LOAD_MAIN_CALENDAR_BY_YEAR_REQUEST,
    loadMainCalendarByYear
  );
}
