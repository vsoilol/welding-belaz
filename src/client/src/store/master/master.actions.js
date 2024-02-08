import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    getAllMastersRequest: null,
    getAllMastersSuccess: ['masters'],
    getAllMastersFailure: ['error'],
    getAllMastersCancel: null,

    setSelectedMasterId: ['masterId'],
  },
  {}
);

export const masterActionTypes = Types;
export const masterActionCreators = Creators;
