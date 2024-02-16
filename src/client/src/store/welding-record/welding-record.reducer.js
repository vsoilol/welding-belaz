import { createReducer } from 'reduxsauce';

import { weldingRecordActionTypes } from './welding-record.actions';

const initialState = {
  isLoading: true,
  error: null,
  records: null,
  additionalFilters: null,
  paginationInfo: null,
};

const handleGetFilteredRecords = (state = initialState, { payload }) => ({
  ...state,
  isLoading: true,
  error: null,
  paginationInfo: payload,
});

const handleSetAdditionalFilters = (
  state = initialState,
  { additionalFilters }
) => ({
  ...state,
  additionalFilters,
  paginationInfo: {
    ...state.paginationInfo,
    pageNumber: 1,
  },
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
  paginationInfo: null,
});

const handleLoadRecordsSuccess = (state = initialState, { records }) => ({
  ...state,
  isLoading: false,
  error: null,
  records,
});

const actionHandlers = {
  [weldingRecordActionTypes.GET_FILTERED_RECORDS]: handleGetFilteredRecords,
  [weldingRecordActionTypes.GET_FILTERED_RECORDS_SUCCESS]:
    handleLoadRecordsSuccess,
  [weldingRecordActionTypes.GET_FILTERED_RECORDS_FAILURE]: handleFailure,
  [weldingRecordActionTypes.GET_FILTERED_RECORDS_CANCEL]: handleFinishLoading,

  [weldingRecordActionTypes.SET_ADDITIONAL_FILTERS]: handleSetAdditionalFilters,
};

export default createReducer(initialState, actionHandlers);
