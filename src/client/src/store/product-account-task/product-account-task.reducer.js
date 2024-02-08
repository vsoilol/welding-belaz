import { createReducer } from 'reduxsauce';
import { productAccountTaskActionTypes } from './product-account-task.actions';

// Initial state definition with clearer naming
const initialState = {
  isLoading: false,
  error: null,
  productAccountTasks: [],
  selectedProductAccountTaskId: null,
};

// Handler function names now clearly describe the action they handle
const handleStartLoading = (state = initialState) => ({
  ...state,
  isLoading: true,
  error: null,
});

const handleFinishLoading = (state = initialState) => ({
  ...state,
  isLoading: false,
  error: null,
});

const handleFailure = (state = initialState, action) => ({
  ...state,
  isLoading: false,
  error: action.error,
});

const handleLoadProductAccountTasksSuccess = (
  state = initialState,
  { productAccountTasks }
) => ({
  ...state,
  isLoading: false,
  error: null,
  productAccountTasks: productAccountTasks,
});

const handleSetSelectedProductAccountTaskId = (
  state = initialState,
  { productAccountTaskId }
) => ({
  ...state,
  selectedProductAccountTaskId: productAccountTaskId,
});

const handleAssignWeldingEquipmentsSuccess = (
  state = initialState,
  { productAccountTaskId, equipments }
) => {
  const updatedProductAccountTasks = state.productAccountTasks.map(
    productAccountTask => {
      if (productAccountTask.id === productAccountTaskId) {
        return {
          ...productAccountTask,
          weldingEquipments: equipments,
        };
      }
      return productAccountTask;
    }
  );

  return {
    ...state,
    isLoading: false,
    error: null,
    productAccountTasks: updatedProductAccountTasks,
    selectedProductAccountTaskId: null,
  };
};

const handleEditProductAccountTaskSuccess = (
  state = initialState,
  { productAccountTask }
) => {
  const updatedProductAccountTasks = state.productAccountTasks.map(item =>
    item.id === productAccountTask.id
      ? { ...productAccountTask, number: item.number }
      : item
  );

  return {
    ...state,
    productAccountTasks: updatedProductAccountTasks,
    isLoading: false,
    selectedProductAccountTaskId: null,
  };
};

const actionHandlers = {
  [productAccountTaskActionTypes.LOAD_PRODUCT_ACCOUNT_TASKS_REQUEST]:
    handleStartLoading,
  [productAccountTaskActionTypes.LOAD_PRODUCT_ACCOUNT_TASKS_SUCCESS]:
    handleLoadProductAccountTasksSuccess,
  [productAccountTaskActionTypes.LOAD_PRODUCT_ACCOUNT_TASKS_FAILURE]:
    handleFailure,
  [productAccountTaskActionTypes.LOAD_PRODUCT_ACCOUNT_TASKS_CANCEL]:
    handleFinishLoading,

  [productAccountTaskActionTypes.SET_SELECTED_PRODUCT_ACCOUNT_TASK_ID]:
    handleSetSelectedProductAccountTaskId,

  [productAccountTaskActionTypes.ASSIGN_WELDING_EQUIPMENTS_REQUEST]:
    handleStartLoading,
  [productAccountTaskActionTypes.ASSIGN_WELDING_EQUIPMENTS_SUCCESS]:
    handleAssignWeldingEquipmentsSuccess,
  [productAccountTaskActionTypes.ASSIGN_WELDING_EQUIPMENTS_FAILURE]:
    handleFailure,

  [productAccountTaskActionTypes.CHANGE_END_WELDING_DATE_REQUEST]:
    handleStartLoading,
  [productAccountTaskActionTypes.CHANGE_END_WELDING_DATE_SUCCESS]:
    handleEditProductAccountTaskSuccess,
  [productAccountTaskActionTypes.CHANGE_END_WELDING_DATE_FAILURE]:
    handleFailure,

  [productAccountTaskActionTypes.CHANGE_MANUFACTURED_AMOUNT_REQUEST]:
    handleStartLoading,
  [productAccountTaskActionTypes.CHANGE_MANUFACTURED_AMOUNT_SUCCESS]:
    handleEditProductAccountTaskSuccess,
  [productAccountTaskActionTypes.CHANGE_MANUFACTURED_AMOUNT_FAILURE]:
    handleFailure,

  [productAccountTaskActionTypes.CHANGE_DEFECTIVE_AMOUNT_REQUEST]:
    handleStartLoading,
  [productAccountTaskActionTypes.CHANGE_DEFECTIVE_AMOUNT_SUCCESS]:
    handleEditProductAccountTaskSuccess,
  [productAccountTaskActionTypes.CHANGE_DEFECTIVE_AMOUNT_FAILURE]:
    handleFailure,

  [productAccountTaskActionTypes.UPDATE_WELDING_MATERIAL_INFO_REQUEST]:
    handleStartLoading,
  [productAccountTaskActionTypes.UPDATE_WELDING_MATERIAL_INFO_SUCCESS]:
    handleEditProductAccountTaskSuccess,
  [productAccountTaskActionTypes.UPDATE_WELDING_MATERIAL_INFO_FAILURE]:
    handleFailure,
};

// Creating reducer with the initialState and the actionHandlers
export default createReducer(initialState, actionHandlers);
