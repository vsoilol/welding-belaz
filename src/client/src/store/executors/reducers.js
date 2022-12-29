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
      return { ...executor.userData, executorId: executor.executorId };
    }),
  };
};

const editExecutorSuccess = (state = INITIAL_STATE, { executor, userId }) => {
  return {
    ...state,
    isRequesting: false,
    executors: state.executors?.map((item) => {
      return item.executorId === userId ? { ...item, ...flattenObject(executor) } : item;
    }),
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
    executors: [...state.executors, flattenObject(executor)],
  };
};

const loadMastersSuccess = (state = INITIAL_STATE, { masters }) => {
  return {
    ...state,
    isRequesting: false,
    masters: masters?.map((master) => {
      return flattenObject(master);
    }),
  };
};

const editMasterSuccess = (state = INITIAL_STATE, { master, userId }) => {
  return {
    ...state,
    isRequesting: false,
    masters: state.masters?.map((item) =>
      item.masterId === userId ? { ...item, ...flattenObject(master) } : item
    ),
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
    masters: [...state.masters, flattenObject(master)],
  };
};

const loadTechsSuccess = (state = INITIAL_STATE, { techs }) => {
  return {
    ...state,
    isRequesting: false,
    techs: techs?.map((tech) => {
      return flattenObject(tech);
    }),
  };
};

const editTechSuccess = (state = INITIAL_STATE, { tech, userId }) => {
  return {
    ...state,
    isRequesting: false,
    techs: state.techs?.map((item) =>
      item.techUserId === userId ? { ...item, ...flattenObject(tech) } : item
    ),
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
    techs: [...state.techs, flattenObject(tech)],
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
};

export default createReducer(INITIAL_STATE, HANDLERS);
