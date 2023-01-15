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
    ///Посты
    LOAD_POSTS_REQUEST,
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
    ///Посты
    loadPostsSuccess,
    loadPostsFailure,

  },
} = equipmentActions;

const {
  Creators: { setError },
} = errorActions;

function* loadEquipment() {
  try {
    const { data } = yield call(api.get, `/WeldingEquipment`);
    const downtime = yield call(api.get, `/WeldingEquipment/downtime`);
    let data_equipment = [data, downtime.data]
    yield put(loadEquipmentSuccess(data_equipment));
  } catch (error) {
    yield put(loadEquipmentFailure(error));
    yield put(setError(error.message));
  }
}
///Посты
function* loadPosts() {
  try {
    const { data } = yield call(api.get, `/post`);
    yield put(loadPostsSuccess(data));
  } catch (error) {
    yield put(loadPostsFailure(error));
    yield put(setError(error.message));
  }
}






function* addEquipment({ payload }) {
  try {
    
    const { data } = yield call(api.post, `/WeldingEquipment`, {
      "postId": payload.postId,
      "rfidTag": payload.rfidTag,
      "name": payload.name,
      "marking": payload.marking,
      "factoryNumber": payload.factoryNumber,
      "commissioningDate": new Date(payload.commissioningDate).toLocaleDateString(),
      "height": Number(payload.height),
      "width": Number(payload.width),
      "lenght": Number(payload.lenght),
      "groupNumber": Number(payload.groupNumber),
      "manufacturerName": payload.manufacturerName,
      "nextAttestationDate": new Date(payload.nextAttestationDate).toLocaleDateString(),
      "weldingProcess": payload.weldingProcess,
      "idleVoltage": Number(payload.idleVoltage),
      "weldingCurrentMin": Number(payload.weldingCurrentMin),
      "weldingCurrentMax": Number(payload.weldingCurrentMax),
      "arcVoltageMin": Number(payload.arcVoltageMin),
      "arcVoltageMax": Number(payload.arcVoltageMax),
      "postId": payload.postId
    });
    window.location.reload()
    // yield put(addEquipmentSuccess(data));
  } catch (error) {
    yield put(addEquipmentFailure(error));
    yield put(setError(error.message));
  }
}

function* editEquipment({ payload }) {
  try {
  
    const { data } = yield call(api.put, `/WeldingEquipment`, {
      "id": payload.id, 
      "rfidTag": payload.rfidTag,
      "name": payload.name,
      "marking": payload.marking,
      "factoryNumber": payload.factoryNumber,
      "commissioningDate": payload.commissioningDate,
      "height": Number(payload.height),
      "width": Number(payload.width),
      "lenght": Number(payload.lenght),
      "groupNumber": Number(payload.groupNumber),
      "manufacturerName": payload.manufacturerName,
      "nextAttestationDate": payload.nextAttestationDate,
      "weldingProcess": payload.weldingProcess,
      "idleVoltage": Number(payload.idleVoltage),
      "weldingCurrentMin": Number(payload.weldingCurrentMin),
      "weldingCurrentMax": Number(payload.weldingCurrentMax),
      "arcVoltageMin": Number(payload.arcVoltageMin),
      "arcVoltageMax": Number(payload.arcVoltageMax),
      "postId": payload.postId,
    });
    window.location.reload()
    // yield put(editEquipmentSuccess(payload));
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
  ///Посты
  yield takeLatest(LOAD_POSTS_REQUEST, loadPosts);


}
