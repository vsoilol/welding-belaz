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
    const { data } = yield call(
      api.post,
      `/TechnologicalInstruction`,
      variables.payload
    );
    yield put(addInstSuccess(variables.payload));
    yield call(loadInstructions); // выполнение функции loadInstructions
  } catch (error) {
    yield put(addInstFailure(error));
    yield put(setError(error.message));
  }
}
function* editInst(variables) {
  try {
    const { data } = yield call(
      api.put,
      `/TechnologicalInstruction`,
      variables.payload
    );
    yield put(addInstSuccess(variables.payload));
    yield call(loadInstructions); // выполнение функции loadInstructions
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

// export function* texprocweldingSaga() {
//   ///Технологические процессы
//   yield takeLatest(LOAD_TEXPROCWELDING_REQUEST, loadTexprocwelding);
//   ///Технологические инструкции
//   yield takeLatest(LOAD_INSTRUCTIONS_REQUEST, loadInstructions);

//   yield takeLatest(ADD_INST_REQUEST, addInst);
//   yield takeLatest(EDIT_INST_REQUEST, editInst);

//   ///Сварные швы
//   yield takeLatest(LOAD_SEAM_REQUEST, loadSeam);
// }

export default [
  ///Технологические процессы
  takeLatest(LOAD_TEXPROCWELDING_REQUEST, loadTexprocwelding),
  ///Технологические инструкции
  takeLatest(LOAD_INSTRUCTIONS_REQUEST, loadInstructions),

  takeLatest(ADD_INST_REQUEST, addInst),
  takeLatest(EDIT_INST_REQUEST, editInst),

  ///Сварные швы
  takeLatest(LOAD_SEAM_REQUEST, loadSeam),
];
