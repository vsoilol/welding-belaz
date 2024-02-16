import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    getFilteredRecords: ['payload'],
    getFilteredRecordsSuccess: ['records'],
    getFilteredRecordsFailure: ['error'],
    getFilteredRecordsCancel: null,

    setAdditionalFilters: ['additionalFilters'],
  },
  {}
);

export const weldingRecordActionTypes = Types;
export const weldingRecordActionCreators = Creators;
