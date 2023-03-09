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

    LOAD_SEAM_REQUEST,

    LOAD_TASKTOOLS_REQUEST
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

    loadTasktoolsSuccess,
    loadTasktoolsFailure,
 
  },
} = tasksActions;

const {
  Creators: { setError },
} = errorActions;

function* loadTasks() {
  try {
    const { data } = yield call(api.get, `/WeldingTask/uncompleted`); 
    const tasks  = yield call(api.get, `/WeldingTask/completed`);
 
    let datas = {
      fullNames:data,
      tasks:tasks.data
    } 
    yield put(loadTasksSuccess(datas));
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
 



function* loadTasktools(dataTools) {
  try {

    console.log(dataTools)
    ///получение всех дат по Id производственного участка 
    // if (numberTools===1) { 
    //   const { data } = yield call(api.get, `/productAccount/dates/${productionAreaId}`);
    //   console.log(data)
    //   yield put(loadTasktoolsSuccess(data));
    // }
   
  } catch (error) {
    yield put(loadTasktoolsFailure(error));
    yield put(setError(error.message));
  }
}
 



export function* tasksSaga() {
  yield takeLatest(LOAD_TASKS_REQUEST, loadTasks);
  yield takeLatest(LOAD_INFO_REQUEST, loadInfo);
  // yield takeLatest(LOAD_SEAM_REQUEST, loadSeam);


  yield takeLatest(ADD_TASK_REQUEST, addTask);
  yield takeLatest(DELETE_TASK_REQUEST, deleteTask);
  yield takeLatest(EDIT_TASK_REQUEST, editTask);


  yield takeLatest(LOAD_TASKTOOLS_REQUEST, loadTasktools);

}
