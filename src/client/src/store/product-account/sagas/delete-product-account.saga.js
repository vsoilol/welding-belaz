import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountActionTypes,
  productAccountActionCreators,
} from '../product-account.actions';

function* deleteProductAccountSaga({ productAccountId }) {
  try {
    yield call(api.remove, `/productAccount/${productAccountId}`);

    yield put(
      productAccountActionCreators.deleteProductAccountSuccess(productAccountId)
    );
  } catch (error) {
    yield put(productAccountActionCreators.deleteProductAccountFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

export const deleteProductAccountWatchers = [
  takeLatest(
    productAccountActionTypes.DELETE_PRODUCT_ACCOUNT_REQUEST,
    deleteProductAccountSaga
  ),
];
