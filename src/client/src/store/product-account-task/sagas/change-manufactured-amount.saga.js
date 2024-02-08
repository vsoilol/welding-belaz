import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountTaskActionTypes,
  productAccountTaskActionCreators,
} from '../product-account-task.actions';

function* changeManufacturedAmountSaga({
  productAccountTaskId,
  manufacturedAmount,
}) {
  try {
    const request = {
      id: productAccountTaskId,
      manufacturedAmount,
    };

    const { data } = yield call(
      api.put,
      `/productAccountTask/manufactured-amount`,
      request
    );

    yield put(
      productAccountTaskActionCreators.changeManufacturedAmountSuccess(data)
    );
  } catch (error) {
    yield put(
      productAccountTaskActionCreators.changeManufacturedAmountFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const changeManufacturedAmountWatchers = [
  takeLatest(
    productAccountTaskActionTypes.CHANGE_MANUFACTURED_AMOUNT_REQUEST,
    changeManufacturedAmountSaga
  ),
];
