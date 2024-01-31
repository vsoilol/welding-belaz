export const generateCalendarEvents = (
  currentDate,
  calendarDays,
  mainWorkingShifts
) => {
  let events = [];
  const monthNumber = currentDate.getMonth() + 1;
  const monthStartDay = 1;
  const monthEndDay = new Date(
    currentDate.getFullYear(),
    monthNumber,
    0
  ).getDate();

  for (
    let dayOfMonth = monthStartDay;
    dayOfMonth <= monthEndDay;
    dayOfMonth++
  ) {
    const dayDetails = calendarDays.find(
      day => day.number === dayOfMonth && day.monthNumber === monthNumber
    );

    if (!dayDetails) {
      events = [
        ...events,
        ...generateDefaultShiftEvents(
          currentDate,
          dayOfMonth,
          mainWorkingShifts
        ),
      ];
    } else {
      events = dayDetails.isWorkingDay
        ? [
            ...events,
            ...generateWorkingShiftEvents(
              currentDate,
              dayOfMonth,
              dayDetails.workingShifts
            ),
          ]
        : [...events, generateNonWorkingDayEvent(currentDate, dayOfMonth)];
    }
  }

  return events;
};

const generateDefaultShiftEvents = (currentDate, dayOfMonth, workingShifts) => {
  return workingShifts
    .slice(0, 3)
    .map(shift => createShiftEvent(currentDate, dayOfMonth, shift));
};

const generateWorkingShiftEvents = (currentDate, dayOfMonth, workingShifts) => {
  return workingShifts
    .slice(0, 3)
    .map(shift => createShiftEvent(currentDate, dayOfMonth, shift, shift.id));
};

const generateNonWorkingDayEvent = (currentDate, dayOfMonth) => ({
  title: 'Выходной день',
  isWorkingDay: false,
  start: new Date(
    currentDate.getFullYear(),
    currentDate.getMonth(),
    dayOfMonth
  ),
  end: new Date(
    currentDate.getFullYear(),
    currentDate.getMonth(),
    dayOfMonth + 1
  ),
});

const createShiftEvent = (currentDate, dayOfMonth, shift, id = null) => {
  const start = parseShiftTime(currentDate, dayOfMonth, shift.shiftStart);
  const end = parseShiftTime(currentDate, dayOfMonth, shift.shiftEnd);
  const breakStart = shift.breakStart
    ? parseShiftTime(currentDate, dayOfMonth, shift.breakStart)
    : null;
  const breakEnd = shift.breakEnd
    ? parseShiftTime(currentDate, dayOfMonth, shift.breakEnd)
    : null;

  return {
    id,
    isWorkingDay: true,
    workingShiftNumber: shift.number,
    title: `Смена ${shift.number}`,
    start,
    end,
    breakStart,
    breakEnd,
  };
};

function parseShiftTime(date, dayOfMonth, timeString) {
  const [hours, minutes] = timeString.split(':').map(Number);
  return new Date(
    date.getFullYear(),
    date.getMonth(),
    dayOfMonth,
    hours,
    minutes
  );
}
