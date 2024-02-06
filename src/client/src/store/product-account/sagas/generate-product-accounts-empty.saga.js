import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountActionTypes,
  productAccountActionCreators,
} from '../product-account.actions';

function* generateProductAccountsEmptySaga({ date, productionAreaId }) {
  try {
    const request = {
      newDate: date,
      productionAreaId,
    };

    const { data } = yield call(
      api.post,
      `/productAccount/generateEmpty`,
      request
    );

    yield put(
      productAccountActionCreators.generateProductAccountsEmptySuccess(
        data,
        date
      )
    );
  } catch (error) {
    yield put(
      productAccountActionCreators.generateProductAccountsEmptyFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const generateProductAccountsEmptyWatchers = [
  takeLatest(
    productAccountActionTypes.GENERATE_PRODUCT_ACCOUNTS_EMPTY_REQUEST,
    generateProductAccountsEmptySaga
  ),
];
