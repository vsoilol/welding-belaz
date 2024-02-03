import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import { taskActionTypes, taskActionCreators } from '../task.actions';

function* deleteTaskSaga({ taskId }) {
  try {
    yield call(api.remove, `/weldingTask/${taskId}`);

    yield put(taskActionCreators.deleteTaskSuccess(taskId));
  } catch (error) {
    yield put(taskActionCreators.deleteTaskFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

export const deleteTaskWatchers = [
  takeLatest(taskActionTypes.DELETE_TASK_REQUEST, deleteTaskSaga),
];
