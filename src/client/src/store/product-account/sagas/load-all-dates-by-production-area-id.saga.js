import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountActionTypes,
  productAccountActionCreators,
} from '../product-account.actions';

function* loadAllDatesByProductionAreaIdSaga({ productionAreaId }) {
  try {
    const { data } = yield call(
      api.get,
      `/productAccount/dates/${productionAreaId}`
    );

    yield put(
      productAccountActionCreators.loadAllDatesByProductionAreaIdSuccess(
        data,
        productionAreaId
      )
    );
  } catch (error) {
    yield put(
      productAccountActionCreators.loadAllDatesByProductionAreaIdFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const loadAllDatesByProductionAreaIdWatchers = [
  takeLatest(
    productAccountActionTypes.LOAD_ALL_DATES_BY_PRODUCTION_AREA_ID_REQUEST,
    loadAllDatesByProductionAreaIdSaga
  ),
];
