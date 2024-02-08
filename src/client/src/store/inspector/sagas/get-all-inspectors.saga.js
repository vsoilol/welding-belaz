import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  inspectorActionTypes,
  inspectorActionCreators,
} from '../inspector.actions';

function* getAllInspectorsSaga() {
  try {
    const { data } = yield call(api.get, `/inspector`);

    yield put(inspectorActionCreators.getAllInspectorsSuccess(data));
  } catch (error) {
    yield put(inspectorActionCreators.getAllInspectorsFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

export const getAllInspectorsWatchers = [
  takeLatest(
    inspectorActionTypes.GET_ALL_INSPECTORS_REQUEST,
    getAllInspectorsSaga
  ),
];
