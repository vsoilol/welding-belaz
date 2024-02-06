import { createReducer } from 'reduxsauce';
import { modalActionTypes } from './modal.actions';

const initialState = {
  isOpen: false,
  title: null,
  message: null,
};

const handleOpenModal = (state = initialState, { title, message }) => ({
  ...state,
  title,
  message,
  isOpen: true,
});

const handleCloseModal = (state = initialState) => ({
  ...state,
  title: null,
  message: null,
  isOpen: false,
});

const actionHandlers = {
  [modalActionTypes.OPEN_MODAL]: handleOpenModal,
  [modalActionTypes.CLOSE_MODAL]: handleCloseModal,
};

export default createReducer(initialState, actionHandlers);
