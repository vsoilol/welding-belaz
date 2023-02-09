import { createReducer } from "reduxsauce";
import actions from "./actions";
import { flattenObject } from "services/makeFlat";

const { Types } = actions;
const INITIAL_STATE = {
  isRequesting: false,
  workplace: [],
  error: null,
};

const request = (state = INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    error: null,
  };
};
///Календарь 
const loadCalendaryearSuccess = (state = INITIAL_STATE, { calendaryear }) => { 
  return {
    ...state,
    isRequesting: false,
    calendaryear,
  };
}
const addCalendarmainSuccess = (state = INITIAL_STATE, { calendarMain }) => {
  return {
    ...state,
    isRequesting: false,
    calendarMain,
  };
}
const editEditcalendarSuccess = (state = INITIAL_STATE, { editcalendar }) => {
  return {
    ...state,
    isRequesting: false,
    editcalendar: state.editcalendar.map(item => item.id === editcalendar.id ? state.editcalendar = editcalendar : item)
  }
};
const addCalendarwelderSuccess = (state = INITIAL_STATE, { calendarWelder }) => {
  return {
    ...state,
    isRequesting: false,
    calendarWelder,
  };
}
const loadCalendarwelderSuccess = (state = INITIAL_STATE, { loadCalendarwelder }) => {
  return {
    ...state,
    isRequesting: false,
    loadCalendarwelder,
  };
}
const addCalendarequipmentSuccess = (state = INITIAL_STATE, { calendarEquipment }) => {
  return {
    ...state,
    isRequesting: false,
    calendarEquipment,
  };
}
const loadCalendarequipmentSuccess = (state = INITIAL_STATE, { loadEquipment }) => {
  return {
    ...state,
    isRequesting: false,
    loadEquipment,
  };
}
///Executor
const loadExecutorsSuccess = (state = INITIAL_STATE, { executors }) => { 
  return {
    ...state,
    isRequesting: false,
    executors: executors?.map((executor) => {
      return { ...executor };
    }),
  };
};
///Equipment
const loadEquipmentSuccess = (state = INITIAL_STATE, { equipment }) => { 
  return {
    ...state,
    isRequesting: false,
    equipment,
  };
};


////WorkingShift
const editShiftSuccess = (state = INITIAL_STATE, { workingShift }) => {
  return {
    ...state,
    isRequesting: false,
    workingShift: state.workingShift.map(item => item.id === workingShift.id ? state.workingShift = workingShift : item)
  }
};
const addShiftSuccess = (state = INITIAL_STATE, { workingShift }) => {
  return {
    ...state,
    isRequesting: false,
    workingShift: [...state.workingShift, workingShift],
  };
};


////Day
const editDaySuccess = (state = INITIAL_STATE, { Day }) => {
  return {
    ...state,
    isRequesting: false,
    Day: state.Day.map(item => item.id === Day.id ? state.Day = Day : item)
  }
};
const addDaySuccess = (state = INITIAL_STATE, { day }) => {  
  return {
    ...state,
    isRequesting: false,
    days: state.calendaryear?.days?.push(day)
  }; 
};
const loadDayByWelderSuccess = (state = INITIAL_STATE, { day }) => {
  return {
    ...state,
    isRequesting: false,
    day,
  };
};

const loadDayByEquipmentSuccess = (state = INITIAL_STATE, { day }) => {
  return {
    ...state,
    isRequesting: false,
    day,
  };
};

const failure = (state = INITIAL_STATE, { error }) => {
  console.log(error)
  return {
    ...state,
    isRequesting: false,
    error,
  };
};


export const HANDLERS = {
  ///Календарь 
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
  [Types.ADD_DAY_FAILURE]: failure

};

export default createReducer(INITIAL_STATE, HANDLERS);
