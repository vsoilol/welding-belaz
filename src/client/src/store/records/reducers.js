import { createReducer } from 'reduxsauce';
import actions from './actions';

const { Types } = actions;
const INITIAL_STATE = {
  isRequesting: false,
  records: [],
  error: null,
};

const request = (state = INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    error: null,
  };
};

const loadRecordsSuccess = (state = INITIAL_STATE, { records }) => {
  return {
    ...state,
    isRequesting: false,
    records,
  };
};
const deleteRecordsSuccess = (state = INITIAL_STATE, { id }) => {
  /* return {
    ...state,
    isRequesting: false,
    records: state.records?.filter((item) => item.executorId !== id),
  }; */
};
const failure = (state = INITIAL_STATE, { error }) => {
  return {
    ...state,
    isRequesting: false,
    error,
  };
};

export const HANDLERS = {
  [Types.LOAD_RECORDS_REQUEST]: request,
  [Types.LOAD_RECORDS_SUCCESS]: loadRecordsSuccess,
  [Types.LOAD_RECORDS_FAILURE]: failure,

  [Types.DELETE_RECORDS_REQUEST]: request,
  [Types.DELETE_RECORDS_SUCCESS]: deleteRecordsSuccess,
  [Types.DELETE_RECORDS_FAILURE]: failure,
};

export default createReducer(INITIAL_STATE, HANDLERS);
