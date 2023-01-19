import { createReducer } from "reduxsauce";
import actions from "./actions";

const { Types } = actions;
const INITIAL_STATE = {
  isRequesting: false,
  equipment: [],
  error: null,
};

const request = (state = INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    error: null,
  };
};
const loadEquipmentSuccess = (state = INITIAL_STATE, { equipment }) => {
  return {
    ...state,
    isRequesting: false,
    equipment,
  };
}; 

const editEquipmentSuccess = (state = INITIAL_STATE, { equipment }) => {
  window.location.reload()
  return {
    ...state,
    isRequesting: false,
    equipment: state.equipment[0].map((item,index) => item.id === equipment.id?state.equipment[index]=equipment:item)
  } 
};

const deleteEquipmentSuccess = (state = INITIAL_STATE, { machineId }) => {
  return {
    ...state,
    isRequesting: false,
    equipment: state.equipment?.filter((item) => item.machineId !== machineId),
  };
};

const addEquipmentSuccess = (state = INITIAL_STATE, { equipment }) => { 
  window.location.reload()
  return {
    ...state,
    isRequesting: false,
    equipment: [...state.equipment, equipment],
  };
};

const failure = (state = INITIAL_STATE, { error }) => {
  return {
    ...state,
    isRequesting: false,
    error,
  };
};

///Посты
const loadPostsSuccess = (state = INITIAL_STATE, { posts }) => {
  return {
    ...state,
    isRequesting: false,
    posts,
  };
};


////Downtime

const addDowntimeSuccess = (state = INITIAL_STATE, { downtime }) => {  
  return {
    ...state,
    isRequesting: false,
    equipment: [...state.equipment[1], downtime], 
  };
};

const editDowntimeSuccess = (state = INITIAL_STATE, { downtime }) => { 
  return {
    ...state,
    isRequesting: false,
    downtime:state.downtime.map((item,index) => item.id === downtime.id?state.downtime[index]=downtime:item)
  } 
};
const loaddowntimeReasonRequest = (state = INITIAL_STATE, { reason }) => {
  return {
    ...state,
    isRequesting: false,
    reason,
  };
};

export const HANDLERS = {
  [Types.LOAD_EQUIPMENT_REQUEST]: request,
  [Types.LOAD_EQUIPMENT_SUCCESS]: loadEquipmentSuccess,
  [Types.LOAD_EQUIPMENT_FAILURE]: failure,

  [Types.EDIT_EQUIPMENT_REQUEST]: request,
  [Types.EDIT_EQUIPMENT_SUCCESS]: editEquipmentSuccess,
  [Types.EDIT_EQUIPMENT_FAILURE]: failure,

  [Types.DELETE_EQUIPMENT_REQUEST]: request,
  [Types.DELETE_EQUIPMENT_SUCCESS]: deleteEquipmentSuccess,
  [Types.DELETE_EQUIPMENT_FAILURE]: failure,

  [Types.ADD_EQUIPMENT_REQUEST]: request,
  [Types.ADD_EQUIPMENT_SUCCESS]: addEquipmentSuccess,
  [Types.ADD_EQUIPMENT_FAILURE]: failure,


  ///Посты
  [Types.LOAD_POSTS_REQUEST]: request,
  [Types.LOAD_POSTS_SUCCESS]: loadPostsSuccess,
  [Types.LOAD_POSTS_FAILURE]: failure,

  ///Downtime
  [Types.EDIT_DOWNTIME_REQUEST]: request,
  [Types.EDIT_DOWNTIME_SUCCESS]: editDowntimeSuccess,
  [Types.EDIT_DOWNTIME_FAILURE]: failure,
  

  [Types.ADD_DOWNTIME_REQUEST]: request,
  [Types.ADD_DOWNTIME_SUCCESS]: addDowntimeSuccess,
  [Types.ADD_DOWNTIME_FAILURE]: failure,


  [Types.LOAD_REASON_REQUEST]: request,
  [Types.LOAD_REASON_SUCCESS]: loaddowntimeReasonRequest,
  [Types.LOAD_REASON_FAILURE]: failure,


};

export default createReducer(INITIAL_STATE, HANDLERS);
