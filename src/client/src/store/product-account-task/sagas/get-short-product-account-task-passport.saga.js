import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountTaskActionTypes,
  productAccountTaskActionCreators,
} from '../product-account-task.actions';

function* getShortProductAccountTaskPassportSaga({
  productAccountTaskId,
  averageIntervalSeconds,
  secondsToIgnoreBetweenGraphs,
}) {
  try {
    const { data } = yield call(
      api.get,
      `/file/product-account-based-seam-passport?productAccountTaskId=${productAccountTaskId}&averageIntervalSeconds=${
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

    yield put(
      productAccountTaskActionCreators.getShortProductAccountTaskPassportSuccess()
    );
  } catch (error) {
    yield put(
      productAccountTaskActionCreators.getShortProductAccountTaskPassportFailure(
        error
      )
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const getShortProductAccountTaskPassportWatchers = [
  takeLatest(
    productAccountTaskActionTypes.GET_SHORT_PRODUCT_ACCOUNT_TASK_PASSPORT_REQUEST,
    getShortProductAccountTaskPassportSaga
  ),
];
