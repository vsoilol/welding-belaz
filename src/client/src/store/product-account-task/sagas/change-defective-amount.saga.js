import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountTaskActionTypes,
  productAccountTaskActionCreators,
} from '../product-account-task.actions';

function* changeDefectiveAmountSaga({
  productAccountTaskId,
  inspectorId,
  defectiveReason,
  defectiveAmount,
}) {
  try {
    const request = {
      productAccountTaskId,
      inspectorId,
      defectiveReason,
      defectiveAmount,
    };

    const { data } = yield call(
      api.put,
      `/productAccountTask/update-defective-amount`,
      request
    );

    yield put(
      productAccountTaskActionCreators.changeDefectiveAmountSuccess(data)
    );
  } catch (error) {
    yield put(
      productAccountTaskActionCreators.changeDefectiveAmountFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const changeDefectiveAmountWatchers = [
  // changeDefectiveAmountRequest
  takeLatest(
    productAccountTaskActionTypes.CHANGE_DEFECTIVE_AMOUNT_REQUEST,
    changeDefectiveAmountSaga
  ),
];
