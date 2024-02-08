import { put, take, takeLatest, all } from 'redux-saga/effects';
import {
  productAccountTaskActionTypes,
  productAccountTaskActionCreators,
} from '../product-account-task.actions';

function* editProductAccountTaskSaga({ request }) {
  const {
    productAccountTaskId,
    manufacturedAmount,
    inspectorId,
    defectiveReason,
    defectiveAmount,
    weldingEndDate,
    weldingMaterial,
    weldingMaterialBatchNumber,
  } = request;

  yield put(
    productAccountTaskActionCreators.changeManufacturedAmountRequest(
      productAccountTaskId,
      manufacturedAmount
    )
  );

  yield take(productAccountTaskActionTypes.CHANGE_MANUFACTURED_AMOUNT_SUCCESS);

  yield all([
    put(
      productAccountTaskActionCreators.changeDefectiveAmountRequest(
        productAccountTaskId,
        inspectorId,
        defectiveReason,
        defectiveAmount
      )
    ),

    put(
      productAccountTaskActionCreators.changeEndWeldingDateRequest(
        productAccountTaskId,
        weldingEndDate
      )
    ),

    put(
      productAccountTaskActionCreators.updateWeldingMaterialInfoRequest(
        productAccountTaskId,
        weldingMaterial,
        weldingMaterialBatchNumber
      )
    ),
  ]);

  yield all([
    take(productAccountTaskActionTypes.CHANGE_DEFECTIVE_AMOUNT_SUCCESS),
    take(productAccountTaskActionTypes.CHANGE_END_WELDING_DATE_SUCCESS),
    take(productAccountTaskActionTypes.UPDATE_WELDING_MATERIAL_INFO_SUCCESS),
  ]);
}

export const editProductAccountTaskWatchers = [
  takeLatest(
    productAccountTaskActionTypes.EDIT_PRODUCT_ACCOUNT_TASK_REQUEST,
    editProductAccountTaskSaga
  ),
];
