import { call, put, takeLatest, all } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import { taskActionTypes, taskActionCreators } from '../task.actions';

function* editTaskSaga({ id, newDate, taskStatus }) {
  try {
    const changeStatusRequest = {
      id: id,
      status: taskStatus,
    };

    const changeDateRequest = {
      id: id,
      date: newDate,
    };

    yield all([
      call(api.put, `/weldingTask/changeStatus`, changeStatusRequest),
      call(api.put, `/weldingTask/changeDate`, changeDateRequest),
    ]);

    yield put(taskActionCreators.editTaskSuccess(id, newDate, taskStatus));
  } catch (error) {
    yield put(taskActionCreators.editTaskFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

export const editTaskWatchers = [
  takeLatest(taskActionTypes.EDIT_TASK_REQUEST, editTaskSaga),
];
