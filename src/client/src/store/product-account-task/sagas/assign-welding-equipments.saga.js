import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountTaskActionTypes,
  productAccountTaskActionCreators,
} from '../product-account-task.actions';

function* assignWeldingEquipmentsSaga({ productAccountTaskId, equipments }) {
  try {
    const request = {
      productAccountTaskId,
      weldingEquipmentIds:
        equipments && equipments.length > 0 ? equipments.map(_ => _.id) : [],
    };

    yield call(api.put, `/productAccountTask/assign-equipments`, request);

    yield put(
      productAccountTaskActionCreators.assignWeldingEquipmentsSuccess(
        productAccountTaskId,
        equipments
      )
    );
  } catch (error) {
    yield put(
      productAccountTaskActionCreators.assignWeldingEquipmentsFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const assignWeldingEquipmentsWatchers = [
  // assignProductAccountTaskToWeldingEquipmentsRequest
  takeLatest(
    productAccountTaskActionTypes.ASSIGN_WELDING_EQUIPMENTS_REQUEST,
    assignWeldingEquipmentsSaga
  ),
];
