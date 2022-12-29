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
};

export default createReducer(INITIAL_STATE, HANDLERS);
