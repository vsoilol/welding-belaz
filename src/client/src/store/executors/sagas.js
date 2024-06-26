import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import executorsActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: {
    LOAD_EXECUTORS_REQUEST,
    EDIT_EXECUTOR_REQUEST,
    DELETE_EXECUTOR_REQUEST,
    ADD_EXECUTOR_REQUEST,
    LOAD_MASTERS_REQUEST,
    EDIT_MASTER_REQUEST,
    DELETE_MASTER_REQUEST,
    ADD_MASTER_REQUEST,
    LOAD_TECHS_REQUEST,
    EDIT_TECH_REQUEST,
    DELETE_TECH_REQUEST,
    ADD_TECH_REQUEST,
    ///Оборудование
    LOAD_EQUIPMENT_REQUEST,
    ///Цеха 
    LOAD_WORKSHOP_REQUEST,
    ///Производственные участки 
    LOAD_AREA_REQUEST,
  },
  Creators: {
    loadExecutorsSuccess,
    loadExecutorsFailure,
    editExecutorSuccess,
    editExecutorFailure,
    addExecutorSuccess,
    addExecutorFailure,
    deleteExecutorSuccess,
    deleteExecutorFailure,
    loadMastersSuccess,
    loadMastersFailure,
    editMasterSuccess,
    editMasterFailure,
    addMasterSuccess,
    addMasterFailure,
    deleteMasterSuccess,
    deleteMasterFailure,
    loadTechsSuccess,
    loadTechsFailure,
    editTechSuccess,
    editTechFailure,
    addTechSuccess,
    addTechFailure,
    deleteTechSuccess,
    deleteTechFailure,
    ///Оборудование
    loadEquipmentSuccess,
    loadEquipmentFailure,
    ///Цеха 
    loadWorkshopSuccess,
    loadWorkshopFailure,
   ///Производственные участки 
   loadAreaSuccess,
   loadAreaFailure,
  },
} = executorsActions;

const {
  Creators: { setError },
} = errorActions;

function* loadExecutors() {
  try {
    const { data } = yield call(api.get, `/welder`);  
    yield put(loadExecutorsSuccess(data));
  } catch (error) {
    yield put(loadExecutorsFailure(error));
    yield put(setError(error.message));
  }
}

function* addExecutor({ payload }) {
  try {  
    const { data } = yield call(api.post, `/welder`, {
      "rfidTag": payload.rfidTag,
      "firstName": payload.firstName,
      "lastName":payload.lastName,
      "middleName": payload.middleName,
      "productionAreaId": payload.productionAreaId,
      "workplaceId": payload.workplaceId,
      "weldingEquipmentId": payload.weldingEquipment[0].id
    }); 
    yield put(addExecutorSuccess(data));
  } catch (error) {
    yield put(addExecutorFailure(error));
    yield put(setError(error.message));
  }
}

function* editExecutor({ payload, userId }) {
  try {  
    const { data } = yield call(api.put, `/Welder`, {
      "id": payload.id,
      "rfidTag": payload.rfidTag,
      "firstName": payload.firstName,
      "lastName": payload.lastName,
      "middleName": payload.middleName,
      "productionAreaId": payload.productionAreaId,
      "workplaceId": payload.workplaceId,
      "weldingEquipmentId": payload.weldingEquipmentId
    }); 
    yield put(editExecutorSuccess(data));
  } catch (error) {
    yield put(editExecutorFailure(error));
    yield put(setError(error.message));
  }
}

function* deleteExecutor({ payload }) {
  try {
    const { data } = yield call(
      api.remove,
      `/users/executors/${payload.executorId}`
    );
    yield put(deleteExecutorSuccess(data.toString()));
  } catch (error) {
    yield put(deleteExecutorFailure(error));
    yield put(setError(error.message));
  }
}

function* loadMasters() {
  try {
    const { data } = yield call(api.get, `/Master`); 
    yield put(loadMastersSuccess(data));
  } catch (error) {
    yield put(loadMastersFailure(error));
    yield put(setError(error.message));
  }
}

function* addMaster({ payload }) {
  try {  
    const { data } = yield call(api.post, `/Master`, {
      "rfidTag": payload.rfidTag,
      "firstName": payload.firstName,
      "lastName": payload.lastName,
      "middleName": payload.middleName,
      "productionAreaId": payload.productionAreaId,
      "weldingEquipmentId": payload.weldingEquipmentId
    }); 
    yield put(addMasterSuccess(data));
  } catch (error) {
    yield put(addMasterFailure(error));
    yield put(setError(error.message));
  }
}

function* editMaster({payload}) {
  try {  
    const { data } = yield call(api.put, `/Master`, {
      "rfidTag": payload.rfidTag,
      "firstName": payload.firstName,
      "lastName": payload.lastName,
      "middleName": payload.middleName,
      "productionAreaId": payload.productionAreaId,
      "weldingEquipmentId": payload.weldingEquipmentId,
      "id": payload.id
    }); 
    yield put(editMasterSuccess(data));
  } catch (error) {
    yield put(editMasterFailure(error));
    yield put(setError(error.message));
  }
}

function* deleteMaster({ payload }) {
  try {
    const { data } = yield call(
      api.remove,
      `/users/masters/${payload.masterId}`
    );
    yield put(deleteMasterSuccess(data.toString()));
  } catch (error) {
    yield put(deleteMasterFailure(error));
    yield put(setError(error.message));
  }
}

function* loadTechs() {
  try {
    const { data } = yield call(api.get, `/Inspector`);
    yield put(loadTechsSuccess(data));
  } catch (error) {
    yield put(loadTechsFailure(error));
    yield put(setError(error.message));
  }
}

function* addTech({ payload }) {
  try {
   
    const { data } = yield call(api.post, `/Inspector`, {
      "rfidTag": payload.rfidTag,
      "firstName": payload.firstName,
      "lastName": payload.lastName,
      "middleName": payload.middleName,
      "productionAreaId": payload.productionAreaId
    }); 
    yield put(addTechSuccess(data));
  } catch (error) {
    yield put(addTechFailure(error));
    yield put(setError(error.message));
  }
}

function* editTech({ payload, userId }) {
  try { 
    const { data } = yield call(api.put, `/Inspector`, {
       "rfidTag": payload.rfidTag,
       "firstName": payload.firstName,
       "lastName": payload.lastName,
       "middleName": payload.middleName,
       "productionAreaId": payload.productionAreaId,
       "id": payload.id
    }); 
    yield put(editTechSuccess(data));
  } catch (error) {
    yield put(editTechFailure(error));
    yield put(setError(error.message));
  }
}

function* deleteTech({ payload }) {
  try {
    const { data } = yield call(
      api.remove,
      `/users/technicals/${payload.techUserId}`
    );
    yield put(deleteTechSuccess(data.toString()));
  } catch (error) {
    yield put(deleteTechFailure(error));
    yield put(setError(error.message));
  }
}

///Оборудование
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
///Производственные участки 
function* loadArea() {
  try {
    const { data } = yield call(api.get, `/ProductionArea`);
    yield put(loadAreaSuccess(data));
  } catch (error) {
    yield put(loadAreaFailure(error));
    yield put(setError(error.message));
  }
}
///Цеха 
function* loadWorkshop() {
  try {
    const { data } = yield call(api.get, `/Workshop`);
    yield put(loadWorkshopSuccess(data));
  } catch (error) {
    yield put(loadWorkshopFailure(error));
    yield put(setError(error.message));
  }
}
export function* executorsSaga() {
  yield takeLatest(LOAD_EXECUTORS_REQUEST, loadExecutors);
  yield takeLatest(ADD_EXECUTOR_REQUEST, addExecutor);
  yield takeLatest(DELETE_EXECUTOR_REQUEST, deleteExecutor);
  yield takeLatest(EDIT_EXECUTOR_REQUEST, editExecutor);
  yield takeLatest(LOAD_MASTERS_REQUEST, loadMasters);
  yield takeLatest(ADD_MASTER_REQUEST, addMaster);
  yield takeLatest(DELETE_MASTER_REQUEST, deleteMaster);
  yield takeLatest(EDIT_MASTER_REQUEST, editMaster);
  yield takeLatest(LOAD_TECHS_REQUEST, loadTechs);
  yield takeLatest(ADD_TECH_REQUEST, addTech);
  yield takeLatest(DELETE_TECH_REQUEST, deleteTech);
  yield takeLatest(EDIT_TECH_REQUEST, editTech);


  yield takeLatest(LOAD_EQUIPMENT_REQUEST, loadEquipment);

   ///Цеха 
   yield takeLatest(LOAD_WORKSHOP_REQUEST, loadWorkshop);
   ///Производственные участки 
  yield takeLatest(LOAD_AREA_REQUEST, loadArea);

}
