import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountTaskActionTypes,
  productAccountTaskActionCreators,
} from '../product-account-task.actions';

function* getFullProductAccountTaskPassportSaga({ productAccountTaskId }) {
  try {
    const { data } = yield call(
      api.get,
      `/file/product-account-seam-passport?productAccountTaskId=${productAccountTaskId}`,
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
      productAccountTaskActionCreators.getFullProductAccountTaskPassportSuccess()
    );
  } catch (error) {
    yield put(
      productAccountTaskActionCreators.getFullProductAccountTaskPassportFailure(
        error
      )
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const getFullProductAccountTaskPassportWatchers = [
  takeLatest(
    productAccountTaskActionTypes.GET_FULL_PRODUCT_ACCOUNT_TASK_PASSPORT_REQUEST,
    getFullProductAccountTaskPassportSaga
  ),
];
