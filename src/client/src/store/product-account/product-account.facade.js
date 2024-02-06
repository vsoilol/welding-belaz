import { useDispatch, useSelector } from 'react-redux';
import { useCallback, useMemo } from 'react';
import { productAccountActionCreators } from 'store/product-account';
import {
  selectDates,
  selectIsLoading,
  selectProductAccounts,
  selectSelectedDate,
  selectSelectedProductAccount,
  selectSelectedProductAccountId,
  selectProductAccountId,
  selectProductAccountDate,
  selectIsLoadingGenerateTasks,
  selectProductionAreaId,
  selectIsAdditionalLoading,
} from './product-account.selectors';

export const useProductAccountById = productAccountId => {
  const productAccountSelector = useMemo(
    () => state => selectProductAccountId(state, productAccountId),
    [productAccountId]
  );

  const productAccount = useSelector(productAccountSelector);
  return productAccount;
};

export const useProductAccountStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const dates = useSelector(selectDates);
  const isLoading = useSelector(selectIsLoading);
  const isAdditionalLoading = useSelector(selectIsAdditionalLoading);
  const productionAreaId = useSelector(selectProductionAreaId);
  const isLoadingGenerateTasks = useSelector(selectIsLoadingGenerateTasks);
  const productAccounts = useSelector(selectProductAccounts);
  const selectedDate = useSelector(selectSelectedDate);
  const selectedProductAccount = useSelector(selectSelectedProductAccount);
  const selectedProductAccountId = useSelector(selectSelectedProductAccountId);
  const productAccountDate = useSelector(selectProductAccountDate);

  // Actions
  const loadAllDatesByProductionAreaId = useCallback(
    productionAreaId =>
      dispatch(
        productAccountActionCreators.loadAllDatesByProductionAreaIdRequest(
          productionAreaId
        )
      ),
    [dispatch]
  );

  const setSelectedDate = useCallback(
    date => dispatch(productAccountActionCreators.setSelectedDate(date)),
    [dispatch]
  );

  const loadProductAccountByDate = useCallback(
    (date, productionAreaId) =>
      dispatch(
        productAccountActionCreators.loadProductAccountByDateRequest(
          date,
          productionAreaId
        )
      ),
    [dispatch]
  );

  const generateTasks = useCallback(
    (date, masterId, productionAreaId) =>
      dispatch(
        productAccountActionCreators.generateTasksRequest(
          date,
          masterId,
          productionAreaId
        )
      ),
    [dispatch]
  );

  const generateProductAccountsEmpty = useCallback(
    (date, productionAreaId) =>
      dispatch(
        productAccountActionCreators.generateProductAccountsEmptyRequest(
          date,
          productionAreaId
        )
      ),
    [dispatch]
  );

  const setSelectedProductAccountId = useCallback(
    productAccountId =>
      dispatch(
        productAccountActionCreators.setSelectedProductAccountId(
          productAccountId
        )
      ),
    [dispatch]
  );

  const deleteProductAccount = useCallback(
    productAccountId =>
      dispatch(
        productAccountActionCreators.deleteProductAccountRequest(
          productAccountId
        )
      ),
    [dispatch]
  );

  const editProductAccount = useCallback(
    (productAccountId, amountFromPlan, sequenceNumbers) =>
      dispatch(
        productAccountActionCreators.editProductAccountRequest(
          productAccountId,
          amountFromPlan,
          sequenceNumbers
        )
      ),
    [dispatch]
  );

  const uploadProductAccountFile = useCallback(
    (formData, productionAreaId) =>
      dispatch(
        productAccountActionCreators.uploadProductAccountFileRequest(
          formData,
          productionAreaId
        )
      ),
    [dispatch]
  );

  const getProductAccountReport = useCallback(
    () =>
      dispatch(productAccountActionCreators.getProductAccountReportRequest()),
    [dispatch]
  );

  return {
    dates,
    isLoading,
    isLoadingGenerateTasks,
    isAdditionalLoading,
    selectedDate,
    productionAreaId,
    productAccounts,
    productAccountDate,
    selectedProductAccount,
    selectedProductAccountId,
    loadAllDatesByProductionAreaId,
    setSelectedDate,
    loadProductAccountByDate,
    generateTasks,
    generateProductAccountsEmpty,
    setSelectedProductAccountId,
    deleteProductAccount,
    editProductAccount,
    uploadProductAccountFile,
    getProductAccountReport,
  };
};
