import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    getWelderByIdRequest: ['id'],
    getWelderByIdSuccess: ['welder'],
    getWelderByIdFailure: ['error'],
  },
  {}
);

export const welderActionTypes = Types;
export const welderActionCreators = Creators;
