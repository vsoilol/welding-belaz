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
    ///Downtime
    EDIT_DOWNTIME_REQUEST,
    ADD_DOWNTIME_REQUEST,


    LOAD_REASON_REQUEST
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
    ///Downtime,
    editDowntimeSuccess,
    editDowntimeFailure,
    addDowntimeSuccess,
    addDowntimeFailure,


    loadReasonSuccess,
    loadReasonFailure

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
// function* loadPosts() {
//   try {
//     const { data } = yield call(api.get, `/post`);
//     yield put(loadPostsSuccess(data));
//   } catch (error) {
//     yield put(loadPostsFailure(error));
//     yield put(setError(error.message));
//   }
// }






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
      "groupNumber": String(payload.groupNumber),
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
    yield put(addEquipmentSuccess(data));
  } catch (error) {
    yield put(addEquipmentFailure(error));
    yield put(setError(error.message));
  }
}

function* editEquipment({ payload }) {
  try {

    console.log({
      "id": payload.id, 
      "rfidTag": payload.rfidTag,
      "name": payload.name,
      "marking": payload.marking,
      "factoryNumber": payload.factoryNumber,
      "commissioningDate": payload.commissioningDate,
      "height": Number(payload.height),
      "width": Number(payload.width),
      "lenght": Number(payload.lenght),
      "groupNumber": String(payload.groupNumber),
      "manufacturerName": payload.manufacturerName,
      "nextAttestationDate": payload.nextAttestationDate,
      "weldingProcess": payload.weldingProcess,
      "loadDuration": null,
      "idleVoltage": Number(payload.idleVoltage),
      "weldingCurrentMin": Number(payload.weldingCurrentMin),
      "weldingCurrentMax": Number(payload.weldingCurrentMax),
      "arcVoltageMin": Number(payload.arcVoltageMin),
      "arcVoltageMax": Number(payload.arcVoltageMax),
      "postId": payload.postId,
    })
  
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
      "groupNumber": String(payload.groupNumber),
      "loadDuration": null,
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


///Downtime
function* addDowntime({ payload }) {
  try { 
    const { data } = yield call(api.post, `/WeldingEquipment/downtime`, {
      "weldingEquipmentId": payload.weldingEquipmentId,
      "downtimeReasonId":  payload.downtimeReasonId,
      "date":  payload.Date,
      "startConditionTime":  payload.timeStates,
      "time": payload.time
    }); 
    window.location.reload()
    // yield put(addDowntimeSuccess(data)); 
  } catch (error) {
    yield put(addDowntimeFailure(error));
    yield put(setError(error.message));
  }
}

function* editDowntime({ payload }) {
  try {   
    console.log({
      "id": payload.idDownti,
      "weldingEquipmentId":  payload.weldingEquipmentId,
      "downtimeReasonId": payload.downtimeReasonId,
      "date":   payload.Date,
      "startConditionTime":  payload.timeStates,
      "time":  payload.time,
    })
    const { data } = yield call(api.put, `/WeldingEquipment/downtime`, {
      "id": payload.idDownti,
      "weldingEquipmentId":  payload.weldingEquipmentId,
      "downtimeReasonId": payload.downtimeReasonId,
      "date":   payload.Date,
      "startConditionTime":  payload.timeStates,
      "time":  payload.time,
    }); 
    window.location.reload()
    // yield put(editDowntimeSuccess(data));
  } catch (error) {
    yield put(editDowntimeFailure(error));
    yield put(setError(error.message));
  }
}
function* loadDowntime() {
  try {
    const { data } = yield call(api.get, `/downtimeReason`); 
    yield put(loadReasonSuccess(data));  
  } catch (error) {
    yield put(loadReasonFailure(error));
    yield put(setError(error.message));
  }
}

export function* equipmentSaga() {
  yield takeLatest(LOAD_EQUIPMENT_REQUEST, loadEquipment);
  yield takeLatest(ADD_EQUIPMENT_REQUEST, addEquipment);
  yield takeLatest(DELETE_EQUIPMENT_REQUEST, deleteEquipment);
  yield takeLatest(EDIT_EQUIPMENT_REQUEST, editEquipment);
  ///Посты
  // yield takeLatest(LOAD_POSTS_REQUEST, loadPosts); 
  ///Downtime
  yield takeLatest(ADD_DOWNTIME_REQUEST, addDowntime); 
  yield takeLatest(EDIT_DOWNTIME_REQUEST, editDowntime);


  yield takeLatest(LOAD_REASON_REQUEST, loadDowntime); 

  
  
}




