import { useDispatch, useSelector } from 'react-redux';
import { useCallback } from 'react';
import { inspectorActionCreators } from 'store/inspector';
import { selectInspectors, selectIsLoading } from './inspector.selectors';

export const useInspectorStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const inspectors = useSelector(selectInspectors);
  const isLoading = useSelector(selectIsLoading);

  // Actions
  const getAllInspectors = useCallback(
    () => dispatch(inspectorActionCreators.getAllInspectorsRequest()),
    [dispatch]
  );

  return {
    inspectors,
    isLoading,

    getAllInspectors,
  };
};
