import { useDispatch, useSelector } from 'react-redux';
import { useCallback } from 'react';
import { weldingRecordActionCreators } from './welding-record.actions';
import { selectIsLoading, selectRecords } from './welding-record.selectors';

export const useWeldingRecordStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const records = useSelector(selectRecords);
  const isLoading = useSelector(selectIsLoading);

  // Actions
  const getFilteredRecords = useCallback(
    payload =>
      dispatch(weldingRecordActionCreators.getFilteredRecords(payload)),
    [dispatch]
  );

  const getFilteredRecordsCancel = useCallback(
    () => dispatch(weldingRecordActionCreators.getFilteredRecordsCancel()),
    [dispatch]
  );

  const setAdditionalFilters = useCallback(
    additionalFilters =>
      dispatch(
        weldingRecordActionCreators.setAdditionalFilters(additionalFilters)
      ),
    [dispatch]
  );

  return {
    records,
    isLoading,
    getFilteredRecords,
    getFilteredRecordsCancel,
    setAdditionalFilters,
  };
};
