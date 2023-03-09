import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import texprocweldingActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: {
    ///Технологические процессы 
    LOAD_TEXPROCWELDING_REQUEST,
    ///Технологические инструкции  
    LOAD_INSTRUCTIONS_REQUEST,
    ADD_INST_REQUEST,
    EDIT_INST_REQUEST,
     ///Сварные швы
     LOAD_SEAM_REQUEST,
  },
  Creators: {
    ///Технологические процессы 
    loadTexprocweldingSuccess,
    loadTexprocweldingFailure,
    ///Технологические инструкции  
    loadInstructionsSuccess,
    loadInstructionsFailure,

    addInstSuccess,
    addInstFailure,

    editInstSuccess,
    editInstFailure,

     ///Сварные швы
     loadSeamSuccess,
     loadSeamFailure,


  },
} = texprocweldingActions;

const {
  Creators: { setError },
} = errorActions;
///Технологические процессы 
function* loadTexprocwelding() {
  try {
    const { data } = yield call(api.get, `/TechnologicalProcess`);
    yield put(loadTexprocweldingSuccess(data));
  } catch (error) {
    yield put(loadTexprocweldingFailure(error));
    yield put(setError(error.message));
  }
}
///Технологические инструкции  
function* loadInstructions() {
  try {
    const { data } = yield call(api.get, `/TechnologicalInstruction`); 
    yield put(loadInstructionsSuccess(data));
  } catch (error) {
    yield put(loadInstructionsFailure(error));
    yield put(setError(error.message));
  }
}

function* addInst(variables) {
  try {   
    const { data } = yield call(api.post, `/TechnologicalInstruction`, {
      "number": variables.payload.number,
      "name": variables.payload.name,
      "seamId": variables.payload.seamId,
      "technologicalProcessId": variables.payload.technologicalProcessId,
      "weldPassages": [
        {
          "name": variables.payload.weldPassagesName,
          "number": variables.payload.number,
          "weldingCurrentMin": Number(variables.payload.weldingCurrentMin),
          "weldingCurrentMax": Number(variables.payload.weldingCurrentMax),
          "arcVoltageMin": Number(variables.payload.arcVoltageMin),
          "arcVoltageMax": Number(variables.payload.arcVoltageMax),
          "preheatingTemperatureMin": Number(variables.payload.preheatingTemperatureMin),
          "preheatingTemperatureMax": Number(variables.payload.preheatingTemperatureMax)
        }
      ]
    });
    window.location.reload();
    // yield put(addInstSuccess(variables.payload));
  } catch (error) {
    yield put(addInstFailure(error));
    yield put(setError(error.message));
  }
}
function* editInst(variables) {
  try {  
    const { data } = yield call(api.put, `/TechnologicalInstruction`, {
      "id": variables.payload.id,
      "number": Number(variables.payload.number),
      "name": variables.payload.name,  
      "weldPassages": [
        {
          "id": variables.payload.weldPassagesId,
          "number": Number(variables.payload.number),
          "name": variables.payload.weldPassagesName,
          "weldingCurrentMin": Number(variables.payload.weldingCurrentMin),
          "weldingCurrentMax": Number(variables.payload.weldingCurrentMax),
          "arcVoltageMin": Number(variables.payload.arcVoltageMin),
          "arcVoltageMax": Number(variables.payload.arcVoltageMax),
          "preheatingTemperatureMin": Number(variables.payload.preheatingTemperatureMin),
          "preheatingTemperatureMax": Number(variables.payload.preheatingTemperatureMax)
        }
      ]
    }); 
    yield put(editInstSuccess(data));
  } catch (error) {
    yield put(editInstFailure(error));
    yield put(setError(error.message));
  }
}
///Сварные швы
function* loadSeam() {
  try {
    const { data } = yield call(api.get, `/seam/byControlSubject/true`);
    yield put(loadSeamSuccess(data));
  } catch (error) {
    yield put(loadSeamFailure(error));
    yield put(setError(error.message));
  }
}

export function* texprocweldingSaga() {
  ///Технологические процессы 
  yield takeLatest(LOAD_TEXPROCWELDING_REQUEST, loadTexprocwelding);
  ///Технологические инструкции 
  yield takeLatest(LOAD_INSTRUCTIONS_REQUEST, loadInstructions);

  yield takeLatest(ADD_INST_REQUEST, addInst);
  yield takeLatest(EDIT_INST_REQUEST, editInst);

   ///Сварные швы
   yield takeLatest(LOAD_SEAM_REQUEST, loadSeam);
}
