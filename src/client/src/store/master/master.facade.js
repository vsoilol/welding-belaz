import { useDispatch, useSelector } from 'react-redux';
import { useCallback, useMemo } from 'react';
import { masterActionCreators } from 'store/master';
import {
  selectIsLoading,
  selectMasterById,
  selectMasters,
  selectSelectedMaster,
  selectSelectedMasterId,
} from './master.selectors';

export const useMasterById = masterId => {
  const masterSelector = useMemo(
    () => state => selectMasterById(state, masterId),
    [masterId]
  );

  const master = useSelector(masterSelector);
  return master;
};

export const useMasterStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const masters = useSelector(selectMasters);
  const isLoading = useSelector(selectIsLoading);
  const selectedMasterId = useSelector(selectSelectedMasterId);
  const selectedMaster = useSelector(selectSelectedMaster);

  // Actions
  const setSelectedMasterId = useCallback(
    masterId => dispatch(masterActionCreators.setSelectedMasterId(masterId)),
    [dispatch]
  );

  const getAllMasters = useCallback(
    () => dispatch(masterActionCreators.getAllMastersRequest()),
    [dispatch]
  );

  const cancelGetAllMasters = useCallback(
    () => dispatch(masterActionCreators.getAllMastersCancel()),
    [dispatch]
  );

  return {
    masters,
    isLoading,
    selectedMasterId,
    selectedMaster,
    setSelectedMasterId,
    getAllMasters,
    cancelGetAllMasters,
  };
};
