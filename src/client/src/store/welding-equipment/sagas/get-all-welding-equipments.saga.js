import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  weldingEquipmentActionTypes,
  weldingEquipmentActionCreators,
} from '../welding-equipment.actions';

function* getAllWeldingEquipmentsSaga() {
  try {
    const { data } = yield call(api.get, `/weldingEquipment`);

    yield put(
      weldingEquipmentActionCreators.getAllWeldingEquipmentsSuccess(data)
    );
  } catch (error) {
    yield put(
      weldingEquipmentActionCreators.getAllWeldingEquipmentsFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const getAllWeldingEquipmentsWatchers = [
  takeLatest(
    weldingEquipmentActionTypes.GET_ALL_WELDING_EQUIPMENTS_REQUEST,
    getAllWeldingEquipmentsSaga
  ),
];
