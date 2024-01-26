import { createReducer } from "reduxsauce";

import { calendarTypes } from "./actions";

const CALENDAR_INITIAL_STATE = {
  isRequesting: false,
  isLoading: false,
  workplace: [],
  error: null,
  calendar: null,
};

const startLoading = (state = CALENDAR_INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    isLoading: true,
    error: null,
  };
};

const loadingFailure = (state = CALENDAR_INITIAL_STATE, { error }) => {
  console.log(error);
  return {
    ...state,
    isRequesting: false,
    isLoading: false,
    error,
  };
};

export const loadMainCalendarByYearSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { calendar }
) => {
  return {
    ...state,
    isRequesting: false,
    isLoading: false,
    calendar,
  };
};

export const HANDLERS = {
  [calendarTypes.LOAD_MAIN_CALENDAR_BY_YEAR_REQUEST]: startLoading,
  [calendarTypes.LOAD_MAIN_CALENDAR_BY_YEAR_SUCCESS]:
    loadMainCalendarByYearSuccess,
  [calendarTypes.LOAD_MAIN_CALENDAR_BY_YEAR_FAILURE]: loadingFailure,
};

export default createReducer(CALENDAR_INITIAL_STATE, HANDLERS);
