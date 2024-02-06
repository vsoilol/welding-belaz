import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  productAccountActionTypes,
  productAccountActionCreators,
} from '../product-account.actions';

function* uploadProductAccountFileSaga({ formData, productionAreaId }) {
  try {
    yield call(api.post, `/uploadFile/product-account`, formData);

    yield put(productAccountActionCreators.uploadProductAccountFileSuccess());
    yield put(
      productAccountActionCreators.loadAllDatesByProductionAreaIdRequest(
        productionAreaId
      )
    );
  } catch (error) {
    yield put(
      productAccountActionCreators.uploadProductAccountFileFailure(error)
    );
    yield put(errorActionCreators.setError(error.message));
  }
}

export const uploadProductAccountFileWatchers = [
  takeLatest(
    productAccountActionTypes.UPLOAD_PRODUCT_ACCOUNT_FILE_REQUEST,
    uploadProductAccountFileSaga
  ),
];
