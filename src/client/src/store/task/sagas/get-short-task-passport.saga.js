import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import { taskActionTypes, taskActionCreators } from '../task.actions';

function* getShortTaskPassportSaga({
  taskId,
  sequenceNumber,
  averageIntervalSeconds,
  secondsToIgnoreBetweenGraphs,
}) {
  try {
    const { data } = yield call(
      api.get,
      `/file/based-seam-passport?taskId=${taskId}&sequenceNumber=${
        sequenceNumber ?? ''
      }&averageIntervalSeconds=${
        averageIntervalSeconds ?? ''
      }&secondsToIgnoreBetweenGraphs=${secondsToIgnoreBetweenGraphs ?? ''}`,
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

    yield put(taskActionCreators.getShortTaskPassportSuccess());
  } catch (error) {
    yield put(taskActionCreators.getShortTaskPassportFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

export const getShortTaskPassportWatchers = [
  takeLatest(
    taskActionTypes.GET_SHORT_TASK_PASSPORT_REQUEST,
    getShortTaskPassportSaga
  ),
];
