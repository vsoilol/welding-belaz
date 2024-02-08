import { useDispatch, useSelector } from 'react-redux';
import { useCallback } from 'react';
import { productAccountTaskActionCreators } from 'store/product-account-task';
import {
  selectIsLoading,
  selectProductAccountTasks,
  selectSelectedProductAccountTaskId,
  selectSelectedProductAccountTask,
  selectIsLoadingPassport,
} from './product-account-task.selectors';

export const useProductAccountTaskStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const productAccountTasks = useSelector(selectProductAccountTasks);
  const isLoading = useSelector(selectIsLoading);
  const isLoadingPassport = useSelector(selectIsLoadingPassport);

  const selectedProductAccountTask = useSelector(
    selectSelectedProductAccountTask
  );
  const selectedProductAccountTaskId = useSelector(
    selectSelectedProductAccountTaskId
  );

  // Actions
  const loadProductAccountTasks = useCallback(
    () =>
      dispatch(
        productAccountTaskActionCreators.loadProductAccountTasksRequest()
      ),
    [dispatch]
  );

  const loadProductAccountTasksCancel = useCallback(
    () =>
      dispatch(
        productAccountTaskActionCreators.loadProductAccountTasksCancel()
      ),
    [dispatch]
  );

  const setSelectedProductAccountTaskId = useCallback(
    productAccountTaskId =>
      dispatch(
        productAccountTaskActionCreators.setSelectedProductAccountTaskId(
          productAccountTaskId
        )
      ),
    [dispatch]
  );

  const assignWeldingEquipments = useCallback(
    (productAccountTaskId, equipments) =>
      dispatch(
        productAccountTaskActionCreators.assignWeldingEquipmentsRequest(
          productAccountTaskId,
          equipments
        )
      ),
    [dispatch]
  );

  const changeDefectiveAmount = useCallback(
    (productAccountTaskId, inspectorId, defectiveReason, defectiveAmount) =>
      dispatch(
        productAccountTaskActionCreators.changeDefectiveAmountRequest(
          productAccountTaskId,
          inspectorId,
          defectiveReason,
          defectiveAmount
        )
      ),
    [dispatch]
  );

  const changeEndWeldingDate = useCallback(
    (productAccountTaskId, weldingEndDate) =>
      dispatch(
        productAccountTaskActionCreators.changeEndWeldingDateRequest(
          productAccountTaskId,
          weldingEndDate
        )
      ),
    [dispatch]
  );

  const changeManufacturedAmount = useCallback(
    (productAccountTaskId, manufacturedAmount) =>
      dispatch(
        productAccountTaskActionCreators.changeManufacturedAmountRequest(
          productAccountTaskId,
          manufacturedAmount
        )
      ),
    [dispatch]
  );

  const editProductAccountTask = useCallback(
    request =>
      dispatch(
        productAccountTaskActionCreators.editProductAccountTaskRequest(request)
      ),
    [dispatch]
  );

  const updateWeldingMaterialInfo = useCallback(
    (productAccountTaskId, weldingMaterial, weldingMaterialBatchNumber) =>
      dispatch(
        productAccountTaskActionCreators.updateWeldingMaterialInfoRequest(
          productAccountTaskId,
          weldingMaterial,
          weldingMaterialBatchNumber
        )
      ),
    [dispatch]
  );

  const getShortProductAccountTaskPassport = useCallback(
    (
      productAccountTaskId,
      averageIntervalSeconds = null,
      secondsToIgnoreBetweenGraphs = null
    ) =>
      dispatch(
        productAccountTaskActionCreators.getShortProductAccountTaskPassportRequest(
          productAccountTaskId,
          averageIntervalSeconds,
          secondsToIgnoreBetweenGraphs
        )
      ),
    [dispatch]
  );

  const getFullProductAccountTaskPassport = useCallback(
    productAccountTaskId =>
      dispatch(
        productAccountTaskActionCreators.getFullProductAccountTaskPassportRequest(
          productAccountTaskId
        )
      ),
    [dispatch]
  );

  return {
    productAccountTasks,
    isLoading,
    selectedProductAccountTaskId,
    selectedProductAccountTask,
    isLoadingPassport,

    loadProductAccountTasks,
    loadProductAccountTasksCancel,
    setSelectedProductAccountTaskId,
    assignWeldingEquipments,
    changeDefectiveAmount,
    changeEndWeldingDate,
    changeManufacturedAmount,
    editProductAccountTask,
    updateWeldingMaterialInfo,
    getShortProductAccountTaskPassport,
    getFullProductAccountTaskPassport,
  };
};
