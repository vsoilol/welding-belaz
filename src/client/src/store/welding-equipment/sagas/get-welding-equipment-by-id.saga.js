import {
  call,
  put,
  fork,
  cancel,
  take,
  cancelled,
  takeLatest,
} from 'redux-saga/effects';
import { LOCATION_CHANGE } from 'connected-react-router';
import api, { getCancelToken } from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  weldingEquipmentActionTypes,
  weldingEquipmentActionCreators,
} from '../welding-equipment.actions';

function* getWeldingEquipmentByIdSaga(id) {
  const { cancelToken, cancel } = getCancelToken();

  try {
    const response = yield call(
      api.getCancelled,
      `/weldingEquipment/${id}`,
      cancelToken
    );

    yield put(
      weldingEquipmentActionCreators.getWeldingEquipmentByIdSuccess(
        response.data
      )
    );
  } catch (error) {
    yield put(
      weldingEquipmentActionCreators.getWeldingEquipmentByIdFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  } finally {
    if (yield cancelled()) {
      cancel('Operation canceled by the user.');
    }
  }
}

function* manageGetWeldingEquipmentByIdSaga({ id }) {
  const forkedSaga = yield fork(getWeldingEquipmentByIdSaga, id);

  yield take(LOCATION_CHANGE);

  yield cancel(forkedSaga);
}

export const getWeldingEquipmentByIdWatchers = [
  takeLatest(
    weldingEquipmentActionTypes.GET_WELDING_EQUIPMENT_BY_ID_REQUEST,
    manageGetWeldingEquipmentByIdSaga
  ),
];
