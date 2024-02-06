import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountActionTypes,
  productAccountActionCreators,
} from '../product-account.actions';

function* getProductAccountReportSaga() {
  try {
    const response = yield call(api.get, `/file/product-account-report`);

    window.open(response.request.responseURL);

    yield put(productAccountActionCreators.getProductAccountReportSuccess());
  } catch (error) {
    yield put(
      productAccountActionCreators.getProductAccountReportFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const getProductAccountReportWatchers = [
  takeLatest(
    productAccountActionTypes.GET_PRODUCT_ACCOUNT_REPORT_REQUEST,
    getProductAccountReportSaga
  ),
];
