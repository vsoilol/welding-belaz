import { createReducer } from "reduxsauce";
import actions from "./actions";
import { flattenObject } from "services/makeFlat";

const { Types } = actions;
const INITIAL_STATE = {
  isRequesting: false,
  executors: [],
  masters: [],
  techs: [],
  error: null,
};

const request = (state = INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    error: null,
  };
};
const loadExecutorsSuccess = (state = INITIAL_STATE, { executors }) => {
  return {
    ...state,
    isRequesting: false,
    executors: executors?.map((executor) => {
      return { ...executor };
    }),
  };
};

const editExecutorSuccess = (state = INITIAL_STATE, { executor, userId }) => {
  return {
    ...state,
    isRequesting: false,
    executors:state.executors.map((item,index) => item.id === executor.id?state.executors[index]=executor:item)
  };
};

const deleteExecutorSuccess = (state = INITIAL_STATE, { id }) => {
  return {
    ...state,
    isRequesting: false,
    executors: state.executors?.filter((item) => item.executorId !== id),
  };
};

const addExecutorSuccess = (state = INITIAL_STATE, { executor }) => {
  return {
    ...state,
    isRequesting: false,
    executors: [...state.executors, executor], 
  }; 
};

const loadMastersSuccess = (state = INITIAL_STATE, { masters }) => {
  
  return {
    ...state,
    isRequesting: false,
    masters: masters?.map((masters) => {
      return { ...masters };
    }),
  };
};

const editMasterSuccess = (state = INITIAL_STATE, { master, userId }) => {
  return {
    ...state,
    isRequesting: false, 
    masters:state.masters.map((item,index) => item.id === master.id?state.masters[index]=master:item)
  };
};

const deleteMasterSuccess = (state = INITIAL_STATE, { id }) => {
  return {
    ...state,
    isRequesting: false,
    masters: state.masters?.filter((item) => item.masterId !== id),
  };
};

const addMasterSuccess = (state = INITIAL_STATE, { master }) => {
  return {
    ...state,
    isRequesting: false,
    masters: [...state.masters, master],
  };
};

const loadTechsSuccess = (state = INITIAL_STATE, { techs }) => { 
  return {
    ...state,
    isRequesting: false,
    techs: techs?.map((techs) => {
      return { ...techs };
    }),
  };
};

const editTechSuccess = (state = INITIAL_STATE, { tech, userId }) => {
  return {
    ...state,
    isRequesting: false,  
    techs:state.techs.map((item,index) => item.id === tech.id?state.techs[index]=tech:item)
  };
};

const deleteTechSuccess = (state = INITIAL_STATE, { id }) => {
  return {
    ...state,
    isRequesting: false,
    techs: state.techs?.filter((item) => item.techUserId !== id),
  };
};

const addTechSuccess = (state = INITIAL_STATE, { tech }) => {
  return {
    ...state,
    isRequesting: false,
    techs: [...state.techs, tech], 
  };
};

  ///Оборудование
const loadEquipmentSuccess = (state = INITIAL_STATE, { equipment }) => {
  return {
    ...state,
    isRequesting: false,
    equipment,
  };
};
///Цеха 
const loadWorkshopSuccess = (state = INITIAL_STATE, { workshop }) => {
  return {
    ...state,
    isRequesting: false,
    workshop,
  };
};
///Производственные участки 
const loadAreaSuccess = (state = INITIAL_STATE, { productionArea }) => {
  return {
    ...state,
    isRequesting: false,
    productionArea,
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
  [Types.LOAD_EXECUTORS_REQUEST]: request,
  [Types.LOAD_EXECUTORS_SUCCESS]: loadExecutorsSuccess,
  [Types.LOAD_EXECUTORS_FAILURE]: failure,

  [Types.LOAD_EQUIPMENT_REQUEST]: request,
  [Types.LOAD_EQUIPMENT_SUCCESS]: loadEquipmentSuccess,
  [Types.LOAD_EQUIPMENT_FAILURE]: failure,

  [Types.EDIT_EXECUTOR_REQUEST]: request,
  [Types.EDIT_EXECUTOR_SUCCESS]: editExecutorSuccess,
  [Types.EDIT_EXECUTOR_FAILURE]: failure,

  [Types.DELETE_EXECUTOR_REQUEST]: request,
  [Types.DELETE_EXECUTOR_SUCCESS]: deleteExecutorSuccess,
  [Types.DELETE_EXECUTOR_FAILURE]: failure,

  [Types.ADD_EXECUTOR_REQUEST]: request,
  [Types.ADD_EXECUTOR_SUCCESS]: addExecutorSuccess,
  [Types.ADD_EXECUTOR_FAILURE]: failure,

  [Types.LOAD_MASTERS_REQUEST]: request,
  [Types.LOAD_MASTERS_SUCCESS]: loadMastersSuccess,
  [Types.LOAD_MASTERS_FAILURE]: failure,

  [Types.EDIT_MASTER_REQUEST]: request,
  [Types.EDIT_MASTER_SUCCESS]: editMasterSuccess,
  [Types.EDIT_MASTER_FAILURE]: failure,

  [Types.DELETE_MASTER_REQUEST]: request,
  [Types.DELETE_MASTER_SUCCESS]: deleteMasterSuccess,
  [Types.DELETE_MASTER_FAILURE]: failure,

  [Types.ADD_MASTER_REQUEST]: request,
  [Types.ADD_MASTER_SUCCESS]: addMasterSuccess,
  [Types.ADD_MASTER_FAILURE]: failure,

  [Types.LOAD_TECHS_REQUEST]: request,
  [Types.LOAD_TECHS_SUCCESS]: loadTechsSuccess,
  [Types.LOAD_TECHS_FAILURE]: failure,

  [Types.EDIT_TECH_REQUEST]: request,
  [Types.EDIT_TECH_SUCCESS]: editTechSuccess,
  [Types.EDIT_TECH_FAILURE]: failure,

  [Types.DELETE_TECH_REQUEST]: request,
  [Types.DELETE_TECH_SUCCESS]: deleteTechSuccess,
  [Types.DELETE_TECH_FAILURE]: failure,

  [Types.ADD_TECH_REQUEST]: request,
  [Types.ADD_TECH_SUCCESS]: addTechSuccess,
  [Types.ADD_TECH_FAILURE]: failure,

  ///Цеха 
  [Types.LOAD_WORKSHOP_REQUEST]: request,
  [Types.LOAD_WORKSHOP_SUCCESS]: loadWorkshopSuccess,
  [Types.LOAD_WORKSHOP_FAILURE]: failure,

 ///Производственные участки 
 [Types.LOAD_AREA_REQUEST]: request,
 [Types.LOAD_AREA_SUCCESS]: loadAreaSuccess,
 [Types.LOAD_AREA_FAILURE]: failure,
};

export default createReducer(INITIAL_STATE, HANDLERS);
