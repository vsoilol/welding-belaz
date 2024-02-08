export const selectIsLoading = state => state.productAccountTask.isLoading;

export const selectIsLoadingPassport = state =>
  state.productAccountTask.isLoadingPassport;

export const selectProductAccountTasks = state =>
  state.productAccountTask.productAccountTasks;

export const selectSelectedProductAccountTaskId = state =>
  state.productAccountTask.selectedProductAccountTaskId;

export const selectSelectedProductAccountTask = state =>
  state.productAccountTask.productAccountTasks.find(
    productAccountTask =>
      productAccountTask.id ===
      state.productAccountTask.selectedProductAccountTaskId
  );
