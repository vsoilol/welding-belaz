import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import { taskActionTypes, taskActionCreators } from '../task.actions';

function* getFullTaskPassportSaga({ taskId, sequenceNumber }) {
  try {
    const { data } = yield call(
      api.get,
      `/file/seamPassport?taskId=${taskId}&sequenceNumber=${
        sequenceNumber ?? ''
      }`,
      {
        responseType: 'arraybuffer',
        dataType: 'blob',
      }
    );

    const file = new Blob([data], {
      type: 'application/pdf',
    });
    const fileURL = URL.createObjectURL(file);
    window.open(fileURL);

    yield put(taskActionCreators.getFullTaskPassportSuccess());
  } catch (error) {
    yield put(taskActionCreators.getFullTaskPassportFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

export const getFullTaskPassportWatchers = [
  takeLatest(
    taskActionTypes.GET_FULL_TASK_PASSPORT_REQUEST,
    getFullTaskPassportSaga
  ),
];
