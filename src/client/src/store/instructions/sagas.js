import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import instructionsActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: {
    LOAD_INSTRUCTIONS_REQUEST,
    ADD_INSTRUCTION_REQUEST,
    EDIT_INSTRUCTION_REQUEST,
    DELETE_INSTRUCTION_REQUEST,
    LOAD_WPS_INSTRUCTIONS_REQUEST,
    ADD_WPS_INSTRUCTION_REQUEST,
    EDIT_WPS_INSTRUCTION_REQUEST,
    DELETE_WPS_INSTRUCTION_REQUEST,
  },
  Creators: {
    loadInstructionsSuccess,
    loadInstructionsFailure,
    addInstructionSuccess,
    addInstructionFailure,
    deleteInstructionSuccess,
    deleteInstructionFailure,
    editInstructionSuccess,
    editInstructionFailure,
    loadWpsInstructionsSuccess,
    loadWpsInstructionsFailure,
    addWpsInstructionSuccess,
    addWpsInstructionFailure,
    deleteWpsInstructionSuccess,
    deleteWpsInstructionFailure,
    editWpsInstructionSuccess,
    editWpsInstructionFailure,
  },
} = instructionsActions;

const {
  Creators: { setError },
} = errorActions;

function* loadInstructions() {
  try {
    const { data } = yield call(api.get, `/instructions`);
    yield put(loadInstructionsSuccess(data));
  } catch (error) {
    yield put(loadInstructionsFailure(error));
    yield put(setError(error.message));
  }
}

function* addInstruction({ payload }) {
  try {
    const { data } = yield call(api.post, `/instructions`, payload);
    yield put(addInstructionSuccess(data));
  } catch (error) {
    yield put(addInstructionFailure(error));
    yield put(setError(error.message));
  }
}

function* editInstruction({ payload }) {
  try {
    const { data } = yield call(api.put, `/instructions/${payload.id}`, payload);
    yield put(editInstructionSuccess(data));
  } catch (error) {
    yield put(editInstructionFailure(error));
    yield put(setError(error.message));
  }
}

function* deleteInstruction({ payload }) {
  try {
    const { data } = yield call(api.remove, `/instructions/${payload.id}`);
    yield put(deleteInstructionSuccess(data));
  } catch (error) {
    yield put(deleteInstructionFailure(error));
    yield put(setError(error.message));
  }
}

function* loadWpsInstructions() {
  try {
    const { data } = yield call(api.get, `/instructions/wps`);
    yield put(loadWpsInstructionsSuccess(data));
  } catch (error) {
    yield put(loadWpsInstructionsFailure(error));
    yield put(setError(error.message));
  }
}

function* addWpsInstruction({ payload }) {
  try {
    const { data } = yield call(api.post, `/instructions/wps`, payload);
    yield put(addWpsInstructionSuccess(data));
  } catch (error) {
    yield put(addWpsInstructionFailure(error));
    yield put(setError(error.message));
  }
}

function* editWpsInstruction({ payload }) {
  try {
    const { data } = yield call(api.put, `/instructions/wps/${payload.id}`, payload);
    yield put(editWpsInstructionSuccess(data));
  } catch (error) {
    yield put(editWpsInstructionFailure(error));
    yield put(setError(error.message));
  }
}

function* deleteWpsInstruction({ payload }) {
  try {
    const { data } = yield call(api.remove, `/instructions/wps/${payload.id}`);
    yield put(deleteWpsInstructionSuccess(data));
  } catch (error) {
    yield put(deleteWpsInstructionFailure(error));
    yield put(setError(error.message));
  }
}

export function* instructionsSaga() {
  yield takeLatest(LOAD_INSTRUCTIONS_REQUEST, loadInstructions);
  yield takeLatest(ADD_INSTRUCTION_REQUEST, addInstruction);
  yield takeLatest(DELETE_INSTRUCTION_REQUEST, deleteInstruction);
  yield takeLatest(EDIT_INSTRUCTION_REQUEST, editInstruction);
  yield takeLatest(LOAD_WPS_INSTRUCTIONS_REQUEST, loadWpsInstructions);
  yield takeLatest(ADD_WPS_INSTRUCTION_REQUEST, addWpsInstruction);
  yield takeLatest(DELETE_WPS_INSTRUCTION_REQUEST, deleteWpsInstruction);
  yield takeLatest(EDIT_WPS_INSTRUCTION_REQUEST, editWpsInstruction);
}
