import { createReducer } from 'reduxsauce';
import { masterActionTypes } from './master.actions';

// Initial state definition with clearer naming
const initialState = {
  isLoading: false,
  error: null,
  masters: [],
  selectedMasterId: null,
};

// Handler function names now clearly describe the action they handle
const handleStartLoading = (state = initialState) => ({
  ...state,
  isLoading: true,
  error: null,
});

const handleCancelLoading = (state = initialState) => ({
  ...state,
  isLoading: false,
  error: null,
});

const handleLoadMastersSuccess = (state = initialState, action) => ({
  ...state,
  isLoading: false,
  masters: action.masters,
});

const handleFailure = (state = initialState, action) => ({
  ...state,
  isLoading: false,
  error: action.error,
});

const handleSetSelectedMasterId = (state = initialState, { masterId }) => ({
  ...state,
  selectedMasterId: masterId,
});

const actionHandlers = {
  [masterActionTypes.GET_ALL_MASTERS_REQUEST]: handleStartLoading,
  [masterActionTypes.GET_ALL_MASTERS_SUCCESS]: handleLoadMastersSuccess,
  [masterActionTypes.GET_ALL_MASTERS_FAILURE]: handleFailure,
  [masterActionTypes.GET_ALL_MASTERS_CANCEL]: handleCancelLoading,

  [masterActionTypes.SET_SELECTED_MASTER_ID]: handleSetSelectedMasterId,
};

// Creating reducer with the initialState and the actionHandlers
export default createReducer(initialState, actionHandlers);
