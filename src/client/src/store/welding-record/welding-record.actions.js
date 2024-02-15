import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    getFilteredRecords: ['payload'],
    getFilteredRecordsSuccess: ['records'],
    getFilteredRecordsFailure: ['error'],
    getFilteredRecordsCancel: null,
  },
  {}
);

export const weldingRecordActionTypes = Types;
export const weldingRecordActionCreators = Creators;
