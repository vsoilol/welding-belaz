import { createActions } from "reduxsauce";
import { call, put } from "redux-saga/effects";
import api from "services/api";
import { errorCreators } from "store/error";

const {
  Types: {
    LOAD_MAIN_CALENDAR_BY_YEAR_REQUEST,
    LOAD_MAIN_CALENDAR_BY_YEAR_SUCCESS,
    LOAD_MAIN_CALENDAR_BY_YEAR_FAILURE,
  },
  Creators: {
    loadMainCalendarByYearSuccess,
    loadMainCalendarByYearFailure,
    loadMainCalendarByYearRequest,
  },
} = createActions({
  loadMainCalendarByYearRequest: ["year"],
  loadMainCalendarByYearSuccess: ["calendar"],
  loadMainCalendarByYearFailure: ["error"],
});

export function* loadMainCalendarByYear({ year }) {
  try {
    const { data } = yield call(api.get, `/calendar/main/${year}`);
    yield put(loadMainCalendarByYearSuccess(data));
  } catch (error) {
    yield put(loadMainCalendarByYearFailure(error));
    yield put(errorCreators.setError(error.message));
  }
}

const calendarTypes = {
  LOAD_MAIN_CALENDAR_BY_YEAR_REQUEST,
  LOAD_MAIN_CALENDAR_BY_YEAR_SUCCESS,
  LOAD_MAIN_CALENDAR_BY_YEAR_FAILURE,
};

const calendarActions = {
  loadMainCalendarByYearSuccess,
  loadMainCalendarByYearFailure,
  loadMainCalendarByYearRequest,
};

export { calendarTypes, calendarActions };
