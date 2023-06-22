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
    ///Downtime
    EDIT_DOWNTIME_REQUEST,
    ADD_DOWNTIME_REQUEST,


    LOAD_REASON_REQUEST,

    ASSIGN_WELDERS_REQUEST, 
    ASSIGN_MASTER_REQUEST
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
    ///Downtime,
    editDowntimeSuccess,
    editDowntimeFailure,
    addDowntimeSuccess,
    addDowntimeFailure,


    loadReasonSuccess,
    loadReasonFailure,

    addassignWeldersSuccess,
    addassignWeldersFailure,

    assignMasterSuccess,
    assignMasterFailure,

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




function* addEquipment({ payload }) {
  try {
    
    const { data } = yield call(api.post, `/WeldingEquipment`, {
      "postId": payload.postId,
      "rfidTag": payload.rfidTag,
      "name": payload.name,
      "marking": payload.marking,
      "factoryNumber": `${payload.factoryNumber}`,
      "commissioningDate": payload.commissioningDate,
      "height": Number(payload.height),
      "width": Number(payload.width),
      "lenght": Number(payload.lenght),
      "groupNumber": String(payload.groupNumber),
      "manufacturerName": payload.manufacturerName,
      "nextAttestationDate": payload.nextAttestationDate,
      "weldingProcess": payload.weldingProcess,
      "idleVoltage": Number(payload.idleVoltage),
      "weldingCurrentMin": Number(payload.weldingCurrentMin),
      "weldingCurrentMax": Number(payload.weldingCurrentMax),
      "arcVoltageMin": Number(payload.arcVoltageMin),
      "arcVoltageMax": Number(payload.arcVoltageMax),
      "postId": payload.postId,
      "workplaceIds": payload.workplaceIds
    }); 
    yield put(addEquipmentSuccess(payload)); 
    /* yield call(loadEquipment);   */
    window.location.reload()
    /* yield put(addEquipmentSuccess(data)); */
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
      "factoryNumber": `${payload.factoryNumber}`,
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
      "workplaceIds": payload.workplaceIds
    });  
    yield put(editEquipmentSuccess(data));
    yield call(loadEquipment);  
  } catch (error) {
    yield put(editEquipmentFailure(error));
    yield put(setError(error.message));
  }
}

function* deleteEquipment({ payload }) {
  try { 
    const { data } = yield call(api.remove, `/WeldingEquipment/${payload}`);  
    yield put(deleteEquipmentSuccess(data));
    yield call(loadEquipment);  
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
      "time": 10
    });  
    yield put(addDowntimeSuccess(data)); 
    yield call(loadDowntime);  
  } catch (error) {
    yield put(addDowntimeFailure(error));
    yield put(setError(error.message));
  }
}

function* editDowntime({ payload }) {
  try {    
    const { data } = yield call(api.put, `/WeldingEquipment/downtime`, {
      "id": payload.idDownti,
      "weldingEquipmentId":  payload.weldingEquipmentId,
      "downtimeReasonId": payload.downtimeReasonId,
      "date":   payload.Date,
      "startConditionTime":  payload.timeStates,
      "time":  10
    }); 
    
    yield put(editDowntimeSuccess(data));
    yield call(loadDowntime);  
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


function* assignWelders({ payload }) {
  try { 
    const { data } = yield call(api.put, `/weldingEquipment/assignWelders`, {
      "weldingEquipmentIds": [ payload.weldingEquipmentId],
      "welderIds": payload.welderIds
    });  
    // yield put(addassignWeldersSuccess(data));  
    window.location.reload()
  } catch (error) {
    yield put(addassignWeldersFailure(error));
    yield put(setError(error.message));
  }
}

function* assignMaster({ payload }) {
  try { 
    const { data } = yield call(api.put, `/weldingEquipment/assignMaster`, {
      "weldingEquipmentIds": [ payload.weldingEquipmentIds],
      "masterId": payload.masterId
    });  
    // yield put(addassignWeldersSuccess(data));  
    window.location.reload()
  } catch (error) {
    yield put(addassignWeldersFailure(error));
    yield put(setError(error.message));
  }
}


export function* equipmentSaga() {
  yield takeLatest(LOAD_EQUIPMENT_REQUEST, loadEquipment);
  yield takeLatest(ADD_EQUIPMENT_REQUEST, addEquipment);
  yield takeLatest(DELETE_EQUIPMENT_REQUEST, deleteEquipment);
  yield takeLatest(EDIT_EQUIPMENT_REQUEST, editEquipment); 


  ///Downtime
  yield takeLatest(ADD_DOWNTIME_REQUEST, addDowntime); 
  yield takeLatest(EDIT_DOWNTIME_REQUEST, editDowntime);


  yield takeLatest(LOAD_REASON_REQUEST, loadDowntime); 



  yield takeLatest(ASSIGN_WELDERS_REQUEST, assignWelders); 
  yield takeLatest(ASSIGN_MASTER_REQUEST, assignMaster); 

  
  
}




