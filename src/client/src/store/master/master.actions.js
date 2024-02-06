import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    loadMastersRequest: null,
    loadMastersSuccess: ['masters'],
    loadMastersFailure: ['error'],
    loadMastersCancel: null,

    setSelectedMasterId: ['masterId'],
  },
  {}
);

export const masterActionTypes = Types;
export const masterActionCreators = Creators;
