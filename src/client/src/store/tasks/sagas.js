import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import tasksActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: {
    LOAD_TASKS_REQUEST,
    ADD_TASK_REQUEST,
    EDIT_TASK_REQUEST,
    DELETE_TASK_REQUEST,
    LOAD_INFO_REQUEST,

    LOAD_SEAM_REQUEST
  },
  Creators: {
    loadTasksSuccess,
    loadTasksFailure,
    addTaskSuccess,
    addTaskFailure,
    deleteTaskSuccess,
    deleteTaskFailure,
    editTaskSuccess,
    editTaskFailure,
    loadInfoSuccess,
    loadInfoFailure,
    ///Сварные швы
    loadSeamSuccess,
    loadSeamFailure,
  },
} = tasksActions;

const {
  Creators: { setError },
} = errorActions;

function* loadTasks() {
  try {
    const { data } = yield call(api.get, `/WeldingTask/fullNames`); 
    yield put(loadTasksSuccess(data));
  } catch (error) {
    yield put(loadTasksFailure(error));
    yield put(setError(error.message));
  }
}

function* loadInfo() {
  try {
    const { data } = yield call(api.get, `/WeldingTask/registrarInfo`);
    console.log(data)
    yield put(loadInfoSuccess(data));
  } catch (error) {
    yield put(loadInfoFailure(error));
    yield put(setError(error.message));
  }
}

function* addTask({ payload }) {
  try {
    const { data } = yield call(api.post, `/tasks`, payload);
    yield put(addTaskSuccess(data));
  } catch (error) {
    yield put(addTaskFailure(error));
    yield put(setError(error.message));
  }
}

function* editTask({ payload }) {
  try {
    const { data } = yield call(api.put, `/tasks/${payload.id}`, payload);
    yield put(editTaskSuccess(data));
  } catch (error) {
    yield put(editTaskFailure(error));
    yield put(setError(error.message));
  }
}

function* deleteTask({ payload }) {
  try {
    const { data } = yield call(api.remove, `/tasks/${payload.id}`);
    yield put(deleteTaskSuccess(data));
  } catch (error) {
    yield put(deleteTaskFailure(error));
    yield put(setError(error.message));
  }
}
///Сварные швы
// function* loadSeam() {
//   try {
//     const { data } = yield call(api.get, `/seam/byControlSubject/true`);
//     yield put(loadSeamSuccess(data));
//   } catch (error) {
//     yield put(loadSeamFailure(error));
//     yield put(setError(error.message));
//   }
// }

export function* tasksSaga() {
  yield takeLatest(LOAD_TASKS_REQUEST, loadTasks);
  yield takeLatest(LOAD_INFO_REQUEST, loadInfo);
  // yield takeLatest(LOAD_SEAM_REQUEST, loadSeam);


  yield takeLatest(ADD_TASK_REQUEST, addTask);
  yield takeLatest(DELETE_TASK_REQUEST, deleteTask);
  yield takeLatest(EDIT_TASK_REQUEST, editTask);
}
