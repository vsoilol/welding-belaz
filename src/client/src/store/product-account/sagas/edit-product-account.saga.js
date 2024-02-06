import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountActionTypes,
  productAccountActionCreators,
} from '../product-account.actions';

function* editProductAccountSaga({
  productAccountId,
  amountFromPlan,
  sequenceNumbers,
}) {
  try {
    const request = { amountFromPlan, sequenceNumbers, productAccountId };

    const { data } = yield call(api.put, `/productAccount/edit`, request);

    yield put(productAccountActionCreators.editProductAccountSuccess(data));
  } catch (error) {
    yield put(productAccountActionCreators.editProductAccountFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

export const editProductAccountWatchers = [
  takeLatest(
    productAccountActionTypes.EDIT_PRODUCT_ACCOUNT_REQUEST,
    editProductAccountSaga
  ),
];
