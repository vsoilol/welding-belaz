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
const loadCalendarSuccess = (state = INITIAL_STATE, { workshop }) => {
  return {
    ...state,
    isRequesting: false,
    workshop,
  }; 
}
const loadExecutorsSuccess = (state = INITIAL_STATE, { executors }) => {
  return {
    ...state,
    isRequesting: false,
    executors: executors?.map((executor) => {
      return { ...executor };
    }),
  };
};
const loadEquipmentSuccess = (state = INITIAL_STATE, { equipment }) => {
  return {
    ...state,
    isRequesting: false,
    equipment,
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
  [Types.LOAD_CALENDAR_REQUEST]: request,
  [Types.LOAD_CALENDAR_SUCCESS]: loadCalendarSuccess,
  [Types.LOAD_CALENDAR_FAILURE]: failure,


  [Types.LOAD_EXECUTORS_REQUEST]: request,
  [Types.LOAD_EXECUTORS_SUCCESS]: loadExecutorsSuccess,
  [Types.LOAD_EXECUTORS_FAILURE]: failure,



  [Types.LOAD_EQUIPMENT_REQUEST]: request,
  [Types.LOAD_EQUIPMENT_SUCCESS]: loadEquipmentSuccess,
  [Types.LOAD_EQUIPMENT_FAILURE]: failure,
 
};

export default createReducer(INITIAL_STATE, HANDLERS);
