import { createReducer } from "reduxsauce";
import actions from "./actions-file";
import { CALENDAR_INITIAL_STATE } from "./calendar-initial-state";
import { calendarTypes } from "./sagas";

const { Types } = actions;

export const request = (state = CALENDAR_INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    isLoading: true,
    error: null,
  };
};

export const failure = (state = CALENDAR_INITIAL_STATE, { error }) => {
  return {
    ...state,
    isRequesting: false,
    isLoading: false,
    error,
  };
};

export const loadCalendaryearSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { calendaryear }
) => {
  return {
    ...state,
    isRequesting: false,
    calendaryear,
  };
};

export const addCalendarmainSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { calendarMain }
) => {
  return {
    ...state,
    isRequesting: false,
    calendarMain,
  };
};

export const editEditcalendarSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { editcalendar }
) => {
  return {
    ...state,
    isRequesting: false,
    editcalendar: state.editcalendar.map((item) =>
      item.id === editcalendar.id ? (state.editcalendar = editcalendar) : item
    ),
  };
};

export const addCalendarwelderSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { calendarWelder }
) => {
  return {
    ...state,
    isRequesting: false,
    calendarWelder,
  };
};

export const loadCalendarwelderSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { loadCalendarwelder }
) => {
  return {
    ...state,
    isRequesting: false,
    loadCalendarwelder,
  };
};

export const addCalendarequipmentSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { calendarEquipment }
) => {
  return {
    ...state,
    isRequesting: false,
    calendarEquipment,
  };
};

export const loadCalendarequipmentSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { loadEquipment }
) => {
  return {
    ...state,
    isRequesting: false,
    loadEquipment,
  };
};

///Executor
export const loadExecutorsSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { executors }
) => {
  return {
    ...state,
    isRequesting: false,
    executors: executors?.map((executor) => {
      return { ...executor };
    }),
  };
};

///Equipment
export const loadEquipmentSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { equipment }
) => {
  return {
    ...state,
    isRequesting: false,
    equipment,
  };
};

////WorkingShift
export const editShiftSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { workingShift }
) => {
  return {
    ...state,
    isRequesting: false,
    workingShift: state.workingShift.map((item) =>
      item.id === workingShift.id ? (state.workingShift = workingShift) : item
    ),
  };
};

export const addShiftSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { workingShift }
) => {
  return {
    ...state,
    isRequesting: false,
    workingShift: [...state.workingShift, workingShift],
  };
};

////Day
export const editDaySuccess = (state = CALENDAR_INITIAL_STATE, { Day }) => {
  return {
    ...state,
    isRequesting: false,
    Day: state.Day.map((item) =>
      item.id === Day.id ? (state.Day = Day) : item
    ),
  };
};

export const addDaySuccess = (state = CALENDAR_INITIAL_STATE, { day }) => {
  return {
    ...state,
    isRequesting: false,
    days: state.calendaryear?.days?.push(day),
  };
};

export const loadDayByWelderSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { day }
) => {
  return {
    ...state,
    isRequesting: false,
    days: day,
  };
};

export const loadDayByEquipmentSuccess = (
  state = CALENDAR_INITIAL_STATE,
  { day }
) => {
  return {
    ...state,
    isRequesting: false,
    day,
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
  [Types.LOAD_CALENDARYEAR_REQUEST]: request,
  [Types.LOAD_CALENDARYEAR_SUCCESS]: loadCalendaryearSuccess,
  [Types.LOAD_CALENDARYEAR_FAILURE]: failure,

  [Types.ADD_CALENDARMAIN_REQUEST]: request,
  [Types.ADD_CALENDARMAIN_SUCCESS]: addCalendarmainSuccess,
  [Types.ADD_CALENDARMAIN_FAILURE]: failure,

  [Types.EDIT_EDITCALENDAR_REQUEST]: request,
  [Types.EDIT_EDITCALENDAR_REQUEST]: editEditcalendarSuccess,
  [Types.EDIT_EDITCALENDAR_REQUEST]: failure,

  [Types.ADD_CALENDARWELDER_REQUEST]: request,
  [Types.ADD_CALENDARWELDER_SUCCESS]: addCalendarwelderSuccess,
  [Types.ADD_CALENDARWELDER_FAILURE]: failure,

  [Types.LOAD_CALENDARWELDER_REQUEST]: request,
  [Types.LOAD_CALENDARWELDER_SUCCESS]: loadCalendarwelderSuccess,
  [Types.LOAD_CALENDARWELDER_FAILURE]: failure,

  [Types.ADD_CALENDAREQUIPMENT_REQUEST]: request,
  [Types.ADD_CALENDAREQUIPMENT_SUCCESS]: addCalendarequipmentSuccess,
  [Types.ADD_CALENDAREQUIPMENT_FAILURE]: failure,

  [Types.LOAD_CALENDAREQUIPMENT_REQUEST]: request,
  [Types.LOAD_CALENDAREQUIPMENT_SUCCESS]: loadCalendarequipmentSuccess,
  [Types.LOAD_CALENDAREQUIPMENT_FAILURE]: failure,

  ///Executor
  [Types.LOAD_EXECUTORS_REQUEST]: request,
  [Types.LOAD_EXECUTORS_SUCCESS]: loadExecutorsSuccess,
  [Types.LOAD_EXECUTORS_FAILURE]: failure,

  ///Equipment
  [Types.LOAD_EQUIPMENT_REQUEST]: request,
  [Types.LOAD_EQUIPMENT_SUCCESS]: loadEquipmentSuccess,
  [Types.LOAD_EQUIPMENT_FAILURE]: failure,

  ///WorkingShift
  [Types.EDIT_SHIFT_REQUEST]: request,
  [Types.EDIT_SHIFT_SUCCESS]: editShiftSuccess,
  [Types.EDIT_SHIFT_FAILURE]: failure,

  [Types.ADD_SHIFT_REQUEST]: request,
  [Types.ADD_SHIFT_SUCCESS]: addShiftSuccess,
  [Types.ADD_SHIFT_FAILURE]: failure,

  ///Day
  [Types.LOAD_DAYBYWELDER_REQUEST]: request,
  [Types.LOAD_DAYBYWELDER_SUCCESS]: loadDayByWelderSuccess,
  [Types.LOAD_DAYBYWELDER_FAILURE]: failure,

  [Types.LOAD_DAYEQUI_REQUEST]: request,
  [Types.LOAD_DAYEQUI_SUCCESS]: loadDayByEquipmentSuccess,
  [Types.LOAD_DAYEQUI_FAILURE]: failure,

  [Types.EDIT_DAY_REQUEST]: request,
  [Types.EDIT_DAY_SUCCESS]: editDaySuccess,
  [Types.EDIT_DAY_FAILURE]: failure,

  [Types.ADD_DAY_REQUEST]: request,
  [Types.ADD_DAY_SUCCESS]: addDaySuccess,
  [Types.ADD_DAY_FAILURE]: failure,

  [calendarTypes.LOAD_MAIN_CALENDAR_BY_YEAR_REQUEST]: request,
  [calendarTypes.LOAD_MAIN_CALENDAR_BY_YEAR_SUCCESS]:
    loadMainCalendarByYearSuccess,
  [calendarTypes.LOAD_MAIN_CALENDAR_BY_YEAR_FAILURE]: failure,
};

export default createReducer(CALENDAR_INITIAL_STATE, HANDLERS);
