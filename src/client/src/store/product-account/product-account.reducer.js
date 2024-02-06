import { createReducer } from 'reduxsauce';
import { productAccountActionTypes } from './product-account.actions';

// Initial state definition with clearer naming
const initialState = {
  isLoading: false,
  error: null,
  productAccounts: [],
  dates: [],
  selectedDate: null,
  selectedProductAccountId: null,
  productionAreaId: null,
  productAccountDate: null,
  isLoadingGenerateTasks: false,
  isAdditionalLoading: false,
};

// Handler function names now clearly describe the action they handle
const handleStartLoading = (state = initialState) => ({
  ...state,
  isLoading: true,
  error: null,
});

const handleStartAdditionalLoading = (state = initialState) => ({
  ...state,
  isAdditionalLoading: true,
  error: null,
});

const handleFinishAdditionalLoading = (state = initialState) => ({
  ...state,
  isAdditionalLoading: false,
  error: null,
});

const handleGenerateTasksStartLoading = (state = initialState) => ({
  ...state,
  isLoadingGenerateTasks: true,
  error: null,
});

const handleGenerateTasksFinishLoading = (state = initialState) => ({
  ...state,
  isLoadingGenerateTasks: false,
  error: null,
});

const handleLoadDatesSuccess = (state = initialState, action) => ({
  ...state,
  isLoading: false,
  isAdditionalLoading: false,
  dates: action.dates,
  productionAreaId: action.productionAreaId,
});

const handleLoadProductAccountsSuccess = (
  state = initialState,
  { productAccounts, date }
) => ({
  ...state,
  isLoading: false,
  productAccounts: productAccounts,
  productAccountDate: date,
});

const handleGenerateProductAccountsEmptySuccess = (
  state = initialState,
  { productAccounts, date }
) => {
  return {
    ...state,
    isLoading: false,
    productAccounts: productAccounts,
    productAccountDate: date,
    selectedDate: date,
    dates: [...state.dates, date],
  };
};

const handleDeleteProductAccountSuccess = (
  state = initialState,
  { productAccountId }
) => {
  return {
    ...state,
    productAccounts: state.productAccounts.filter(
      productAccount => productAccount.id !== productAccountId
    ),
    isLoading: false,
    selectedTaskId:
      productAccountId !== state.selectedProductAccountId
        ? state.selectedProductAccountId
        : null,
  };
};

const handleEditProductAccountSuccess = (
  state = initialState,
  { productAccount }
) => {
  const updatedProductAccounts = state.productAccounts.map(item =>
    item.id === productAccount.id ? productAccount : item
  );

  return {
    ...state,
    productAccounts: updatedProductAccounts,
    isLoading: false,
    selectedTaskId: null,
  };
};

const handleSetSelectedProductAccountId = (
  state = initialState,
  { productAccountId }
) => ({
  ...state,
  selectedProductAccountId: productAccountId,
});

const handleSetSelectedDate = (state = initialState, { date }) => ({
  ...state,
  selectedDate: date,
});

const handleFailure = (state = initialState, action) => ({
  ...state,
  isLoading: false,
  isLoadingGenerateTasks: false,
  isAdditionalLoading: false,
  error: action.error,
});

const actionHandlers = {
  [productAccountActionTypes.LOAD_ALL_DATES_BY_PRODUCTION_AREA_ID_REQUEST]:
    handleStartAdditionalLoading,
  [productAccountActionTypes.LOAD_ALL_DATES_BY_PRODUCTION_AREA_ID_SUCCESS]:
    handleLoadDatesSuccess,
  [productAccountActionTypes.LOAD_ALL_DATES_BY_PRODUCTION_AREA_ID_FAILURE]:
    handleFailure,

  [productAccountActionTypes.SET_SELECTED_DATE]: handleSetSelectedDate,

  [productAccountActionTypes.LOAD_PRODUCT_ACCOUNT_BY_DATE_REQUEST]:
    handleStartLoading,
  [productAccountActionTypes.LOAD_PRODUCT_ACCOUNT_BY_DATE_SUCCESS]:
    handleLoadProductAccountsSuccess,
  [productAccountActionTypes.LOAD_PRODUCT_ACCOUNT_BY_DATE_FAILURE]:
    handleFailure,

  [productAccountActionTypes.GENERATE_TASKS_REQUEST]:
    handleGenerateTasksStartLoading,
  [productAccountActionTypes.GENERATE_TASKS_SUCCESS]:
    handleGenerateTasksFinishLoading,
  [productAccountActionTypes.GENERATE_TASKS_FAILURE]: handleFailure,

  [productAccountActionTypes.GENERATE_PRODUCT_ACCOUNTS_EMPTY_REQUEST]:
    handleStartLoading,
  [productAccountActionTypes.GENERATE_PRODUCT_ACCOUNTS_EMPTY_SUCCESS]:
    handleGenerateProductAccountsEmptySuccess,
  [productAccountActionTypes.GENERATE_PRODUCT_ACCOUNTS_EMPTY_FAILURE]:
    handleFailure,

  [productAccountActionTypes.SET_SELECTED_PRODUCT_ACCOUNT_ID]:
    handleSetSelectedProductAccountId,

  [productAccountActionTypes.DELETE_PRODUCT_ACCOUNT_REQUEST]:
    handleStartLoading,
  [productAccountActionTypes.DELETE_PRODUCT_ACCOUNT_SUCCESS]:
    handleDeleteProductAccountSuccess,
  [productAccountActionTypes.DELETE_PRODUCT_ACCOUNT_FAILURE]: handleFailure,

  [productAccountActionTypes.EDIT_PRODUCT_ACCOUNT_REQUEST]: handleStartLoading,
  [productAccountActionTypes.EDIT_PRODUCT_ACCOUNT_SUCCESS]:
    handleEditProductAccountSuccess,
  [productAccountActionTypes.EDIT_PRODUCT_ACCOUNT_FAILURE]: handleFailure,

  [productAccountActionTypes.UPLOAD_PRODUCT_ACCOUNT_FILE_REQUEST]:
    handleStartAdditionalLoading,
  [productAccountActionTypes.UPLOAD_PRODUCT_ACCOUNT_FILE_SUCCESS]:
    handleFinishAdditionalLoading,
  [productAccountActionTypes.UPLOAD_PRODUCT_ACCOUNT_FILE_FAILURE]:
    handleFailure,

  [productAccountActionTypes.GET_PRODUCT_ACCOUNT_REPORT_REQUEST]:
    handleStartAdditionalLoading,
  [productAccountActionTypes.GET_PRODUCT_ACCOUNT_REPORT_SUCCESS]:
    handleFinishAdditionalLoading,
  [productAccountActionTypes.GET_PRODUCT_ACCOUNT_REPORT_FAILURE]: handleFailure,
};

// Creating reducer with the initialState and the actionHandlers
export default createReducer(initialState, actionHandlers);
