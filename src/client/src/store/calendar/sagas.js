import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import workplaceActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: {
    ///Календарь 
    LOAD_EQUIPMENT_REQUEST,
    LOAD_CALENDAR_REQUEST,
    LOAD_EXECUTORS_REQUEST,
    
  },
  Creators: {
    ///Календарь 
    loadCalendarSuccess,
    loadCalendarFailure,


    loadExecutorsSuccess,
    loadExecutorsFailure,


    loadEquipmentSuccess,
    loadEquipmentFailure,
 
  },
} = workplaceActions;

const {
  Creators: { setError },
} = errorActions;
///Календарь 
function* loadCalendar() {
  try {
    const { data } = yield call(api.get, `/calendar/main/2023`); 
    console.log(data)
    yield put(loadCalendarSuccess(data));
  } catch (error) {
    yield put(loadCalendarFailure(error));
    yield put(setError(error.message));
  }
}
function* loadExecutors() {
  try {
    const { data } = yield call(api.get, `/welder`);  
    yield put(loadExecutorsSuccess(data));
  } catch (error) {
    yield put(loadExecutorsFailure(error));
    yield put(setError(error.message));
  }
}
function* loadEquipment() {
  try {
    const { data } = yield call(api.get, `/WeldingEquipment`);
    const downtime = yield call(api.get, `/WeldingEquipment/downtime`);
    let data_equipment = [data, downtime.data]
    yield put(loadEquipmentSuccess(data_equipment));
  } catch (error) {
    yield put(loadEquipmentFailure(error));
    yield put(setError(error.message));
  }
}

export function* CalendarSaga() {
  ///Календарь 
  yield takeLatest(LOAD_CALENDAR_REQUEST, loadCalendar); 
  yield takeLatest(LOAD_EXECUTORS_REQUEST, loadExecutors);
  yield takeLatest(LOAD_EQUIPMENT_REQUEST, loadEquipment);
}

