import React, { useState, useEffect } from "react";
import { Calendar, momentLocalizer } from "react-big-calendar";
import moment from "moment";
import "moment/locale/ru";

import "react-big-calendar/lib/css/react-big-calendar.css";
import { EditDayWorkingShiftModal } from "../modals";
import { generateCalendarEvents } from "./generate-calendar-events";

import styles from "../styles.module.scss";

const localizer = momentLocalizer(moment);

export const CustomCalendar = ({
  userRole,
  calendarDays,
  mainWorkingShifts,
  loadMainCalendarByYear,
  calendarYear,
  currentDate,
  setCurrentDate,
  updateWorkingShift,
  createDay,
  deleteWorkingShift,
}) => {
  const messages = {
    today: "Сегодня",
    previous: "Назад",
    next: "Вперед",
  };

  const [selectedDayEvent, setSelectedDayEvent] = useState(null);
  const [events, setEvents] = useState([]);

  const handleSelectEvent = (event) => {
    setSelectedDayEvent(event);
  };

  const updateCalendarEvents = (currentDate) => {
    const newEvents = generateCalendarEvents(
      currentDate,
      calendarDays,
      mainWorkingShifts
    );
    setEvents(newEvents);
  };

  useEffect(() => {
    updateCalendarEvents(currentDate);
  }, [calendarYear]);

  const handleMonthChange = (date) => {
    setCurrentDate(date);
    const currentYear = date.getFullYear();

    if (calendarYear === currentYear) {
      updateCalendarEvents(date);
      return;
    }

    loadMainCalendarByYear(currentYear);
  };

  return (
    <div className={styles.calendar_wrapper}>
      <Calendar
        localizer={localizer}
        startAccessor="start"
        endAccessor="end"
        selectable
        onSelectEvent={handleSelectEvent}
        onNavigate={handleMonthChange}
        date={currentDate}
        views={["month"]}
        messages={messages}
        events={events}
      />

      {selectedDayEvent && (
        <EditDayWorkingShiftModal
          dayEvent={selectedDayEvent}
          setDayEvent={setSelectedDayEvent}
          userRole={userRole}
          updateWorkingShift={updateWorkingShift}
          calendarDays={calendarDays}
          mainWorkingShifts={mainWorkingShifts}
          createDay={createDay}
          deleteWorkingShift={deleteWorkingShift}
        />
      )}
    </div>
  );
};
