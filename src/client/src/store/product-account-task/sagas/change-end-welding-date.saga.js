import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountTaskActionTypes,
  productAccountTaskActionCreators,
} from '../product-account-task.actions';

function* changeEndWeldingDateSaga({ productAccountTaskId, weldingEndDate }) {
  try {
    const request = {
      productAccountTaskId,
      weldingEndDate,
    };

    const { data } = yield call(
      api.put,
      `/productAccountTask/update-welding-end-date`,
      request
    );

    yield put(
      productAccountTaskActionCreators.changeEndWeldingDateSuccess(data)
    );
  } catch (error) {
    yield put(
      productAccountTaskActionCreators.changeEndWeldingDateFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const changeEndWeldingDateWatchers = [
  takeLatest(
    productAccountTaskActionTypes.CHANGE_END_WELDING_DATE_REQUEST,
    changeEndWeldingDateSaga
  ),
];
