import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import equipmentActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: {
    LOAD_EQUIPMENT_REQUEST,
    DELETE_EQUIPMENT_REQUEST,
    ADD_EQUIPMENT_REQUEST,
    EDIT_EQUIPMENT_REQUEST,
  },
  Creators: {
    loadEquipmentSuccess,
    loadEquipmentFailure,
    addEquipmentSuccess,
    addEquipmentFailure,
    editEquipmentSuccess,
    editEquipmentFailure,
    deleteEquipmentSuccess,
    deleteEquipmentFailure,
  },
} = equipmentActions;

const {
  Creators: { setError },
} = errorActions;

function* loadEquipment() {
  try {
    const { data } = yield call(api.get, `/machines`);
    yield put(loadEquipmentSuccess(data));
  } catch (error) {
    yield put(loadEquipmentFailure(error));
    yield put(setError(error.message));
  }
}

function* addEquipment({ payload }) {
  try {
    const { data } = yield call(api.post, `/machines`, payload);
    yield put(addEquipmentSuccess(data));
  } catch (error) {
    yield put(addEquipmentFailure(error));
    yield put(setError(error.message));
  }
}

function* editEquipment({ payload }) {
  try {
    const { data } = yield call(
      api.put,
      `/machines/${payload.machineId}`,
      payload
    );
    yield put(editEquipmentSuccess(data));
  } catch (error) {
    yield put(editEquipmentFailure(error));
    yield put(setError(error.message));
  }
}

function* deleteEquipment({ payload }) {
  try {
    const { data } = yield call(
      api.remove,
      `/machines/${payload.machineId}`
    );
    yield put(deleteEquipmentSuccess(data));
  } catch (error) {
    yield put(deleteEquipmentFailure(error));
    yield put(setError(error.message));
  }
}

export function* equipmentSaga() {
  yield takeLatest(LOAD_EQUIPMENT_REQUEST, loadEquipment);
  yield takeLatest(ADD_EQUIPMENT_REQUEST, addEquipment);
  yield takeLatest(DELETE_EQUIPMENT_REQUEST, deleteEquipment);
  yield takeLatest(EDIT_EQUIPMENT_REQUEST, editEquipment);
}
