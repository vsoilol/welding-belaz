import {
  call,
  put,
  fork,
  cancel,
  take,
  cancelled,
  takeLatest,
} from 'redux-saga/effects';
import { LOCATION_CHANGE } from 'connected-react-router';
import api, { getCancelToken } from 'services/api';
import { errorActionCreators } from 'store/error';
import {
  calendarActionTypes,
  calendarActionCreators,
} from '../calendar.actions';

function* loadCalendarByEquipmentSaga(year, equipmentId) {
  const { cancelToken, cancel } = getCancelToken();

  try {
    const response = yield call(
      api.getCancelled,
      `/calendar/byEquipment?WeldingEquipmentId=${equipmentId}&Year=${year}`,
      cancelToken
    );

    if (response.status === 204) {
      const emptyCalendar = {
        year,
        weldingEquipmentId: equipmentId,
        days: null,
        mainWorkingShift: null,
      };

      const { data: savedCalendar } = yield call(
        api.post,
        '/calendar/withEquipment',
        emptyCalendar
      );
      yield put(
        calendarActionCreators.loadCalendarByEquipmentSuccess(savedCalendar)
      );
    } else {
      yield put(
        calendarActionCreators.loadCalendarByEquipmentSuccess(response.data)
      );
    }
  } catch (error) {
    yield put(calendarActionCreators.loadCalendarByEquipmentFailure(error));
    yield put(errorActionCreators.setError(error.message));
  } finally {
    if (yield cancelled()) {
      cancel('Operation canceled by the user.');
    }
  }
}

function* manageLoadCalendarByEquipmentSaga({ equipmentId, year }) {
  const forkedSaga = yield fork(loadCalendarByEquipmentSaga, year, equipmentId);

  yield take(LOCATION_CHANGE);

  yield cancel(forkedSaga);
}

export const loadCalendarByEquipmentWatchers = [
  takeLatest(
    calendarActionTypes.LOAD_CALENDAR_BY_EQUIPMENT_REQUEST,
    manageLoadCalendarByEquipmentSaga
  ),
];
