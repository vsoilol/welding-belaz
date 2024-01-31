import { createReducer } from 'reduxsauce';

import { welderActionTypes } from './welder.actions';

const WELDER_INITIAL_STATE = {
  isLoading: true,
  error: null,
  welder: null,
};

const startLoading = (state = WELDER_INITIAL_STATE) => {
  return {
    ...state,
    isLoading: true,
    error: null,
  };
};

const loadingFailure = (state = WELDER_INITIAL_STATE, { error }) => {
  return {
    ...state,
    isLoading: false,
    error,
  };
};

export const updateStateWithLoadedWelder = (
  state = WELDER_INITIAL_STATE,
  { welder }
) => {
  return {
    ...state,
    isLoading: false,
    welder,
  };
};

export const HANDLERS = {
  [welderActionTypes.GET_WELDER_BY_ID_REQUEST]: startLoading,
  [welderActionTypes.GET_WELDER_BY_ID_SUCCESS]: updateStateWithLoadedWelder,
  [welderActionTypes.GET_WELDER_BY_ID_FAILURE]: loadingFailure,
};

export default createReducer(WELDER_INITIAL_STATE, HANDLERS);
