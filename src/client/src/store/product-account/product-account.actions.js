import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    loadAllDatesByProductionAreaIdRequest: ['productionAreaId'],
    loadAllDatesByProductionAreaIdSuccess: ['dates', 'productionAreaId'],
    loadAllDatesByProductionAreaIdFailure: ['error'],

    setSelectedDate: ['date'],
    setSelectedProductAccountId: ['productAccountId'],

    loadProductAccountByDateRequest: ['date', 'productionAreaId'],
    loadProductAccountByDateSuccess: ['productAccounts', 'date'],
    loadProductAccountByDateFailure: ['error'],

    generateTasksRequest: ['date', 'masterId', 'productionAreaId'],
    generateTasksSuccess: null,
    generateTasksFailure: ['error'],

    generateProductAccountsEmptyRequest: ['date', 'productionAreaId'],
    generateProductAccountsEmptySuccess: ['productAccounts', 'date'],
    generateProductAccountsEmptyFailure: ['error'],

    deleteProductAccountRequest: ['productAccountId'],
    deleteProductAccountSuccess: ['productAccountId'],
    deleteProductAccountFailure: ['error'],

    editProductAccountRequest: [
      'productAccountId',
      'amountFromPlan',
      'sequenceNumbers',
    ],
    editProductAccountSuccess: ['productAccount'],
    editProductAccountFailure: ['error'],

    uploadProductAccountFileRequest: ['formData', 'productionAreaId'],
    uploadProductAccountFileSuccess: null,
    uploadProductAccountFileFailure: ['error'],

    getProductAccountReportRequest: null,
    getProductAccountReportSuccess: null,
    getProductAccountReportFailure: ['error'],
  },
  {}
);

export const productAccountActionTypes = Types;
export const productAccountActionCreators = Creators;
