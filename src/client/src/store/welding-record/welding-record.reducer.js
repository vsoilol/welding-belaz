import { createReducer } from 'reduxsauce';

import { weldingRecordActionTypes } from './welding-record.actions';

const initialState = {
  isLoading: true,
  error: null,
  records: null,
};

const handleStartLoading = (state = initialState) => ({
  ...state,
  isLoading: true,
  error: null,
});

const handleFinishLoading = (state = initialState) => ({
  ...state,
  isLoading: false,
  error: null,
});

const handleFailure = (state = initialState, action) => ({
  ...state,
  isLoading: false,
  error: action.error,
});

const handleLoadRecordsSuccess = (state = initialState, { records }) => ({
  ...state,
  isLoading: false,
  error: null,
  records,
});

const actionHandlers = {
  [weldingRecordActionTypes.GET_FILTERED_RECORDS]: handleStartLoading,
  [weldingRecordActionTypes.GET_FILTERED_RECORDS_SUCCESS]:
    handleLoadRecordsSuccess,
  [weldingRecordActionTypes.GET_FILTERED_RECORDS_FAILURE]: handleFailure,
  [weldingRecordActionTypes.GET_FILTERED_RECORDS_CANCEL]: handleFinishLoading,
};

export default createReducer(initialState, actionHandlers);
