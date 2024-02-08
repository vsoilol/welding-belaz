import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    getAllInspectorsRequest: null,
    getAllInspectorsSuccess: ['inspectors'],
    getAllInspectorsFailure: ['error'],
  },
  {}
);

export const inspectorActionTypes = Types;
export const inspectorActionCreators = Creators;
