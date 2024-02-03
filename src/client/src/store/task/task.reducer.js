import { createReducer } from 'reduxsauce';
import { taskActionTypes } from './task.actions';

// Initial state definition with clearer naming
const initialState = {
  isLoading: false,
  error: null,
  tasks: [],
  selectedTaskId: null,
  isLoadingPassport: false,
};

// Handler function names now clearly describe the action they handle
const handleStartLoading = (state = initialState) => ({
  ...state,
  isLoading: true,
  error: null,
});

const handleStartLoadingPassport = (state = initialState) => ({
  ...state,
  isLoadingPassport: true,
  error: null,
});

const handleFinishLoadingPassport = (state = initialState) => ({
  ...state,
  isLoadingPassport: false,
  error: null,
});

const handleLoadTasksSuccess = (state = initialState, action) => ({
  ...state,
  isLoading: false,
  tasks: action.tasks,
});

const handleFailure = (state = initialState, action) => ({
  ...state,
  isLoading: false,
  isLoadingPassport: false,
  error: action.error,
});

const handleDeleteTaskSuccess = (state = initialState, action) => {
  return {
    ...state,
    // Ensure tasks is always an array to avoid null checks
    tasks: state.tasks.filter(task => task.id !== action.taskId),
    isLoading: false,
    selectedTaskId:
      action.taskId !== state.selectedTaskId ? state.selectedTaskId : null,
  };
};

const handleEditTaskSuccess = (
  state = initialState,
  { id, newDate, taskStatus }
) => {
  const updatedTasks = state.tasks.map(task => {
    if (task.id === id) {
      // Return a new object for the task with updated properties
      return {
        ...task,
        weldingDate: newDate,
        status: taskStatus,
      };
    }
    return task; // Return the task unmodified if it's not the one we're updating
  });

  return {
    ...state,
    tasks: updatedTasks,
    isLoading: false,
  };
};

const handleSetSelectedTaskId = (state = initialState, { taskId }) => ({
  ...state,
  selectedTaskId: taskId,
});

// No change needed for handleStartLoading and handleFailure
// as they are reused for DELETE actions which is a good practice

// Consolidating handlers with improved naming
const actionHandlers = {
  [taskActionTypes.LOAD_TASKS_REQUEST]: handleStartLoading,
  [taskActionTypes.LOAD_TASKS_SUCCESS]: handleLoadTasksSuccess,
  [taskActionTypes.LOAD_TASKS_FAILURE]: handleFailure,

  [taskActionTypes.DELETE_TASK_REQUEST]: handleStartLoading, // Reuse for loading indicator
  [taskActionTypes.DELETE_TASK_SUCCESS]: handleDeleteTaskSuccess,
  [taskActionTypes.DELETE_TASK_FAILURE]: handleFailure, // Reuse for error handling

  [taskActionTypes.SET_SELECTED_TASK_ID]: handleSetSelectedTaskId, // Reuse for error handling

  [taskActionTypes.EDIT_TASK_REQUEST]: handleStartLoading,
  [taskActionTypes.EDIT_TASK_SUCCESS]: handleEditTaskSuccess,
  [taskActionTypes.EDIT_TASK_FAILURE]: handleFailure,

  [taskActionTypes.GET_FULL_TASK_PASSPORT_REQUEST]: handleStartLoadingPassport,
  [taskActionTypes.GET_FULL_TASK_PASSPORT_SUCCESS]: handleFinishLoadingPassport,
  [taskActionTypes.GET_FULL_TASK_PASSPORT_FAILURE]: handleFailure,

  [taskActionTypes.GET_SHORT_TASK_PASSPORT_REQUEST]: handleStartLoadingPassport,
  [taskActionTypes.GET_SHORT_TASK_PASSPORT_SUCCESS]:
    handleFinishLoadingPassport,
  [taskActionTypes.GET_SHORT_TASK_PASSPORT_FAILURE]: handleFailure,
};

// Creating reducer with the initialState and the actionHandlers
export default createReducer(initialState, actionHandlers);
