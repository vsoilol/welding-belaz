import { createReducer } from 'reduxsauce';
import { inspectorActionTypes } from './inspector.actions';

const initialState = {
  isLoading: false,
  error: null,
  inspectors: [],
};

const handleStartLoading = (state = initialState) => ({
  ...state,
  isLoading: true,
  error: null,
});

const handleFailure = (state = initialState, action) => ({
  ...state,
  isLoading: false,
  error: action.error,
});

const handleGetAllInspectorsSuccess = (
  state = initialState,
  { inspectors }
) => ({
  ...state,
  isLoading: false,
  error: null,
  inspectors,
});

const actionHandlers = {
  [inspectorActionTypes.GET_ALL_INSPECTORS_REQUEST]: handleStartLoading,
  [inspectorActionTypes.GET_ALL_INSPECTORS_SUCCESS]:
    handleGetAllInspectorsSuccess,
  [inspectorActionTypes.GET_ALL_INSPECTORS_FAILURE]: handleFailure,
};

// Creating reducer with the initialState and the actionHandlers
export default createReducer(initialState, actionHandlers);
