import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    openModal: ['title', 'message'],
    closeModal: null,
  },
  {}
);

export const modalActionTypes = Types;
export const modalActionCreators = Creators;
