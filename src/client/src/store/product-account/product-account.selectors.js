export const selectIsLoading = state => state.productAccount.isLoading;

export const selectIsLoadingGenerateTasks = state =>
  state.productAccount.isLoadingGenerateTasks;

export const selectIsAdditionalLoading = state =>
  state.productAccount.isAdditionalLoading;

export const selectProductionAreaId = state =>
  state.productAccount.productionAreaId;

export const selectDates = state => state.productAccount.dates;

export const selectSelectedDate = state => state.productAccount.selectedDate;

export const selectProductAccountDate = state =>
  state.productAccount.productAccountDate;

export const selectProductAccounts = state =>
  state.productAccount.productAccounts;

export const selectSelectedProductAccountId = state =>
  state.productAccount.selectedProductAccountId;

export const selectSelectedProductAccount = state =>
  state.productAccount.productAccounts.find(
    productAccount =>
      productAccount.id === state.productAccount.selectedProductAccountId
  );

export const selectProductAccountId = (state, productAccountId) =>
  state.productAccount.productAccounts.find(
    productAccount => productAccount.id === productAccountId
  );
