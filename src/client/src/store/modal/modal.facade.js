import { useDispatch, useSelector } from 'react-redux';
import { useCallback } from 'react';
import { modalActionCreators } from 'store/modal';
import { selectIsOpen, selectMessage, selectTitle } from './modal.selectors';

export const useModalStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const isOpen = useSelector(selectIsOpen);
  const title = useSelector(selectTitle);
  const message = useSelector(selectMessage);

  // Actions
  const openModal = useCallback(
    (title, message) => dispatch(modalActionCreators.openModal(title, message)),
    [dispatch]
  );

  const closeModal = useCallback(
    () => dispatch(modalActionCreators.closeModal()),
    [dispatch]
  );

  return {
    isOpen,
    title,
    message,
    openModal,
    closeModal,
  };
};
