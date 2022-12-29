import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import recordsActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: {
    LOAD_RECORDS_REQUEST,
  },
  Creators: {
    loadRecordsSuccess,
    loadRecordsFailure,
  },
} = recordsActions;

const {
  Creators: { setError },
} = errorActions;

function* loadRecords() {
  try {
    const { data } = yield call(api.get, `/records`);
    yield put(loadRecordsSuccess(data));
  } catch (error) {
    yield put(loadRecordsFailure(error));
    yield put(setError(error.message));
  }
}


export function* recordsSaga() {
  yield takeLatest(LOAD_RECORDS_REQUEST, loadRecords);
}
