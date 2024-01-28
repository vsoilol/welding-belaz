import { call, put, takeLatest, select } from "redux-saga/effects";
import api from "services/api";
import { errorActionCreators } from "store/error";
import {
  calendarActionTypes,
  calendarActionCreators,
} from "../calendar-actions";

function* createCalendarFromStoredSaga({ year }) {
  let calendar = yield select((state) => state.calendar?.calendar);

  if (!calendar) {
    const previousYear = year - 1;
    const { data: fetchedCalendar } = yield call(
      api.get,
      `/calendar/main/${previousYear}`
    );
    calendar = fetchedCalendar;
  }

  const mainWorkingShifts = [
    {
      number: 1,
      shiftStart: "07:30",
      shiftEnd: "16:00",
      breakStart: "12:00",
      breakEnd: "12:30",
    },
    {
      number: 2,
      shiftStart: "16:00",
      shiftEnd: "00:30",
      breakStart: "20:00",
      breakEnd: "20:30",
    },
    {
      number: 3,
      shiftStart: "00:30",
      shiftEnd: "07:50",
      breakStart: "02:00",
      breakEnd: "02:20",
    },
  ];

  const updatedCalendar = {
    ...calendar,
    days: createNextYearCalendarDays(year),
    year,
    mainWorkingShift: mainWorkingShifts,
  };

  try {
    const { data: savedCalendar } = yield call(
      api.post,
      "/calendar/main",
      updatedCalendar
    );
    yield put(
      calendarActionCreators.createCalendarFromStoredSuccess(savedCalendar)
    );
  } catch (error) {
    yield put(calendarActionCreators.createCalendarFromStoredFailure(error));
    yield put(errorActionCreators.setError(error.message));
  }
}

export const createCalendarFromStoredWatchers = [
  takeLatest(
    calendarActionTypes.CREATE_CALENDAR_FROM_STORED_REQUEST,
    createCalendarFromStoredSaga
  ),
];

function createNextYearCalendarDays(year) {
  const newDays = [];

  const weekends = getAllWeekendsInYear(year);

  for (const weekend of weekends) {
    newDays.push({
      monthNumber: weekend.getMonth() + 1,
      Number: weekend.getDate(),
      isWorkingDay: false,
    });
  }

  return newDays;
}

function getAllWeekendsInYear(year) {
  const weekends = [];
  const date = new Date(year, 0, 1); // Start from January 1st

  while (date.getFullYear() === year) {
    const dayOfWeek = date.getDay();

    if (dayOfWeek === 0 || dayOfWeek === 6) {
      // 0 = Sunday, 6 = Saturday
      weekends.push(new Date(date)); // Add a copy of the date to the array
    }

    date.setDate(date.getDate() + 1); // Move to the next day
  }

  return weekends;
}
