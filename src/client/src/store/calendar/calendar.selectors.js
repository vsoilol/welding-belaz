export const selectCalendarIsLoading = (state) => state.calendar.isLoading;

export const selectCalendar = (state) => state.calendar.calendar;

export const selectCalendarYear = (state) => state.calendar.calendar?.year;

export const selectCalendarId = (state) => state.calendar.calendar?.id;

export const selectCalendarMainWorkingShifts = (state) =>
  state.calendar.calendar?.mainWorkingShifts;
