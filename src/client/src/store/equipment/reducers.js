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
  return {
    ...state,
    isRequesting: false,
    equipment: state.equipment?.map((item) =>
      item.machineId === equipment.machineId ? equipment : item
    ),
  };
};

const deleteEquipmentSuccess = (state = INITIAL_STATE, { machineId }) => {
  return {
    ...state,
    isRequesting: false,
    equipment: state.equipment?.filter((item) => item.machineId !== machineId),
  };
};

const addEquipmentSuccess = (state = INITIAL_STATE, { equipment }) => {
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
};

export default createReducer(INITIAL_STATE, HANDLERS);
