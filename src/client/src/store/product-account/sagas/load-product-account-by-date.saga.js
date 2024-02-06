import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountActionTypes,
  productAccountActionCreators,
} from '../product-account.actions';

function* loadProductAccountByDateSaga({ date, productionAreaId }) {
  try {
    const { data } = yield call(
      api.get,
      `/productAccount/byDate?Date=${date}&ProductionAreaId=${productionAreaId}`
    );

    yield put(
      productAccountActionCreators.loadProductAccountByDateSuccess(data, date)
    );
  } catch (error) {
    yield put(
      productAccountActionCreators.loadProductAccountByDateFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const loadProductAccountByDateWatchers = [
  takeLatest(
    productAccountActionTypes.LOAD_PRODUCT_ACCOUNT_BY_DATE_REQUEST,
    loadProductAccountByDateSaga
  ),
];
