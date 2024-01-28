import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import recordsActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: { LOAD_RECORDS_REQUEST, DELETE_RECORDS_REQUEST },
  Creators: {
    loadRecordsSuccess,
    loadRecordsFailure,
    deleteRecordsSuccess,
    deleteRecordsFailure,
  },
} = recordsActions;

const {
  Creators: { setError },
} = errorActions;

function* loadRecords() {
  try {
    const { data } = yield call(api.get, `/weldingRecord`);
    yield put(loadRecordsSuccess(data));
  } catch (error) {
    yield put(loadRecordsFailure(error));
    yield put(setError(error.message));
  }
}
function* deleteRecords({ payload }) {
  try {
    const { data } = yield call(api.remove, `/weldingRecord/${payload}`);
    yield put(deleteRecordsSuccess(payload));
    yield call(loadRecords);
  } catch (error) {
    yield put(deleteRecordsFailure(error));
    yield put(setError(error.message));
  }
}

// export function* recordsSaga() {
//   yield takeLatest(LOAD_RECORDS_REQUEST, loadRecords);
//   yield takeLatest(DELETE_RECORDS_REQUEST, deleteRecords);
// }

export default [
  takeLatest(LOAD_RECORDS_REQUEST, loadRecords),
  takeLatest(DELETE_RECORDS_REQUEST, deleteRecords),
];
