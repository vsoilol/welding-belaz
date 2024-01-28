import { createReducer } from "reduxsauce";
import actions from "./actions";

const { Types } = actions;
const INITIAL_STATE = {
  isRequesting: false,
  tasks: [],
  error: null,
};

const request = (state = INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    error: null,
  };
};
const loadTasksSuccess = (state = INITIAL_STATE, { tasks }) => {
  return {
    ...state,
    isRequesting: false,
    tasks,
  };
};

const loadInfoSuccess = (state = INITIAL_STATE, { info }) => {
  return {
    ...state,
    isRequesting: false,
    info,
  };
};

const editTaskSuccess = (state = INITIAL_STATE, { task }) => {
  return {
    ...state,
    isRequesting: false,
    tasks: state.tasks?.map((item) => (item.id === task.id ? task : item)),
  };
};

const deleteTaskSuccess = (state = INITIAL_STATE, { id }) => {
  return {
    ...state,
    isRequesting: false,
    tasks: state.tasks.filter((item) => item.id !== id),
  };
};

const addTaskSuccess = (state = INITIAL_STATE, { task }) => {
  return {
    ...state,
    isRequesting: false,
    tasks: [...state.tasks, task],
  };
};

const failure = (state = INITIAL_STATE, { error }) => {
  return {
    ...state,
    isRequesting: false,
    error,
  };
};

///Сварные швы
const loadSeamSuccess = (state = INITIAL_STATE, { seam }) => {
  return {
    ...state,
    isRequesting: false,
    seam,
  };
};

const loadTasktoolsSuccess = (state = INITIAL_STATE, { tasktools }) => {
  return {
    ...state,
    isRequesting: false,
    tasktools,
  };
};

///Ежедневный план
const loadAlldatesSuccess = (state = INITIAL_STATE, { alldates }) => {
  state.alldates = alldates;
  return {
    ...state,
    isRequesting: false,
  };
};
const addPlanSuccess = (state = INITIAL_STATE, { plan }) => {
  return {
    ...state,
    isRequesting: false,
  };
};

export const HANDLERS = {
  [Types.LOAD_TASKS_REQUEST]: request,
  [Types.LOAD_TASKS_SUCCESS]: loadTasksSuccess,
  [Types.LOAD_TASKS_FAILURE]: failure,

  [Types.EDIT_TASK_REQUEST]: request,
  [Types.EDIT_TASK_SUCCESS]: editTaskSuccess,
  [Types.EDIT_TASK_FAILURE]: failure,

  [Types.DELETE_TASK_REQUEST]: request,
  [Types.DELETE_TASK_SUCCESS]: deleteTaskSuccess,
  [Types.DELETE_TASK_FAILURE]: failure,

  [Types.ADD_TASK_REQUEST]: request,
  [Types.ADD_TASK_SUCCESS]: addTaskSuccess,
  [Types.ADD_TASK_FAILURE]: failure,

  [Types.LOAD_INFO_REQUEST]: request,
  [Types.LOAD_INFO_SUCCESS]: loadInfoSuccess,
  [Types.LOAD_INFO_FAILURE]: failure,

  ///Сварные швы
  [Types.LOAD_SEAM_REQUEST]: request,
  [Types.LOAD_SEAM_SUCCESS]: loadSeamSuccess,
  [Types.LOAD_SEAM_FAILURE]: failure,

  [Types.LOAD_TASKTOOLS_REQUEST]: request,
  [Types.LOAD_TASKTOOLS_SUCCESS]: loadTasktoolsSuccess,
  [Types.LOAD_TASKTOOLS_FAILURE]: failure,

  ///Ежедневный план
  [Types.LOAD_ALLDATES_REQUEST]: request,
  [Types.LOAD_ALLDATES_SUCCESS]: loadAlldatesSuccess,
  [Types.LOAD_ALLDATES_FAILURE]: failure,

  [Types.ADD_PLAN_REQUEST]: request,
  [Types.ADD_PLAN_SUCCESS]: addPlanSuccess,
  [Types.ADD_PLAN_FAILURE]: failure,
};

export default createReducer(INITIAL_STATE, HANDLERS);
