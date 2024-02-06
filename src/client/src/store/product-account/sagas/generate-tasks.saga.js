import { call, put, takeLatest } from 'redux-saga/effects';
import api from 'services/api';
import { errorActionCreators } from 'store/error';
import { modalActionCreators } from 'store/modal';
import {
  productAccountActionTypes,
  productAccountActionCreators,
} from '../product-account.actions';

function* generateTasksSaga({ date, masterId, productionAreaId }) {
  try {
    const request = {
      date,
      productionAreaId,
      masterId,
    };

    yield call(api.post, `/productAccount/generateTasks`, request);

    yield put(productAccountActionCreators.generateTasksSuccess());
    yield put(
      modalActionCreators.openModal('Успешно', 'Задания сгенерированы успешно')
    );
  } catch (error) {
    yield put(productAccountActionCreators.generateTasksFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

export const generateTasksWatchers = [
  takeLatest(
    productAccountActionTypes.GENERATE_TASKS_REQUEST,
    generateTasksSaga
  ),
];
