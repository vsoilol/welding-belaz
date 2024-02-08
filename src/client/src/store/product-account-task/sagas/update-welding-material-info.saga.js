import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountTaskActionTypes,
  productAccountTaskActionCreators,
} from '../product-account-task.actions';

function* updateWeldingMaterialInfoSaga({
  productAccountTaskId,
  weldingMaterial,
  weldingMaterialBatchNumber,
}) {
  try {
    const request = {
      id: productAccountTaskId,
      weldingMaterial,
      weldingMaterialBatchNumber,
    };

    const { data } = yield call(
      api.put,
      `/productAccountTask/update-welding-material`,
      request
    );

    yield put(
      productAccountTaskActionCreators.updateWeldingMaterialInfoSuccess(data)
    );
  } catch (error) {
    yield put(
      productAccountTaskActionCreators.updateWeldingMaterialInfoFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const updateWeldingMaterialInfoWatchers = [
  takeLatest(
    productAccountTaskActionTypes.UPDATE_WELDING_MATERIAL_INFO_REQUEST,
    updateWeldingMaterialInfoSaga
  ),
];
