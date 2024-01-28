import { createReducer } from "reduxsauce";

import { calendarActionTypes } from "./calendar-actions";

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

const finishLoading = (state = CALENDAR_INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: false,
    isLoading: false,
    error: null,
  };
};

const loadingFailure = (state = CALENDAR_INITIAL_STATE, { error }) => {
  return {
    ...state,
    isRequesting: false,
    isLoading: false,
    error,
  };
};

export const updateStateWithLoadedCalendar = (
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
  [calendarActionTypes.LOAD_MAIN_CALENDAR_BY_YEAR_REQUEST]: startLoading,
  [calendarActionTypes.LOAD_MAIN_CALENDAR_BY_YEAR_SUCCESS]:
    updateStateWithLoadedCalendar,
  [calendarActionTypes.LOAD_MAIN_CALENDAR_BY_YEAR_FAILURE]: loadingFailure,

  [calendarActionTypes.CREATE_CALENDAR_FROM_STORED_REQUEST]: startLoading,
  [calendarActionTypes.CREATE_CALENDAR_FROM_STORED_SUCCESS]:
    updateStateWithLoadedCalendar,
  [calendarActionTypes.CREATE_CALENDAR_FROM_STORED_FAILURE]: loadingFailure,

  [calendarActionTypes.UPDATE_WORKING_DAY_WITH_WORKING_SHIFT_REQUEST]:
    startLoading,
  [calendarActionTypes.UPDATE_WORKING_DAY_WITH_WORKING_SHIFT_SUCCESS]:
    finishLoading,
  [calendarActionTypes.UPDATE_WORKING_DAY_WITH_WORKING_SHIFT_FAILURE]:
    loadingFailure,

  [calendarActionTypes.CREATE_DAY_REQUEST]: startLoading,
  [calendarActionTypes.CREATE_DAY_SUCCESS]: finishLoading,
  [calendarActionTypes.CREATE_DAY_FAILURE]: loadingFailure,

  [calendarActionTypes.UPDATE_DAY_REQUEST]: startLoading,
  [calendarActionTypes.UPDATE_DAY_SUCCESS]: finishLoading,
  [calendarActionTypes.UPDATE_DAY_FAILURE]: loadingFailure,

  [calendarActionTypes.CREATE_WORKING_SHIFT_REQUEST]: startLoading,
  [calendarActionTypes.CREATE_WORKING_SHIFT_SUCCESS]: finishLoading,
  [calendarActionTypes.CREATE_WORKING_SHIFT_FAILURE]: loadingFailure,

  [calendarActionTypes.DELETE_WORKING_SHIFT_REQUEST]: startLoading,
  [calendarActionTypes.DELETE_WORKING_SHIFT_SUCCESS]: finishLoading,
  [calendarActionTypes.DELETE_WORKING_SHIFT_FAILURE]: loadingFailure,

  [calendarActionTypes.UPDATE_WORKING_SHIFT_REQUEST]: startLoading,
  [calendarActionTypes.UPDATE_WORKING_SHIFT_SUCCESS]: finishLoading,
  [calendarActionTypes.UPDATE_WORKING_SHIFT_FAILURE]: loadingFailure,
};

export default createReducer(CALENDAR_INITIAL_STATE, HANDLERS);
