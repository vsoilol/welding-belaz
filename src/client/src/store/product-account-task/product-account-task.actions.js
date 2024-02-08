import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    loadProductAccountTasksRequest: null,
    loadProductAccountTasksSuccess: ['productAccountTasks'],
    loadProductAccountTasksFailure: ['error'],
    loadProductAccountTasksCancel: null,

    setSelectedProductAccountTaskId: ['productAccountTaskId'],

    assignWeldingEquipmentsRequest: ['productAccountTaskId', 'equipments'],
    assignWeldingEquipmentsSuccess: ['productAccountTaskId', 'equipments'],
    assignWeldingEquipmentsFailure: ['error'],

    changeEndWeldingDateRequest: ['productAccountTaskId', 'weldingEndDate'],
    changeEndWeldingDateSuccess: ['productAccountTask'],
    changeEndWeldingDateFailure: ['error'],

    changeManufacturedAmountRequest: [
      'productAccountTaskId',
      'manufacturedAmount',
    ],
    changeManufacturedAmountSuccess: ['productAccountTask'],
    changeManufacturedAmountFailure: ['error'],

    changeDefectiveAmountRequest: [
      'productAccountTaskId',
      'inspectorId',
      'defectiveReason',
      'defectiveAmount',
    ],
    changeDefectiveAmountSuccess: ['productAccountTask'],
    changeDefectiveAmountFailure: ['error'],

    editProductAccountTaskRequest: ['request'],

    updateWeldingMaterialInfoRequest: [
      'productAccountTaskId',
      'weldingMaterial',
      'weldingMaterialBatchNumber',
    ],
    updateWeldingMaterialInfoSuccess: ['productAccountTask'],
    updateWeldingMaterialInfoFailure: ['error'],
  },
  {}
);

export const productAccountTaskActionTypes = Types;
export const productAccountTaskActionCreators = Creators;
