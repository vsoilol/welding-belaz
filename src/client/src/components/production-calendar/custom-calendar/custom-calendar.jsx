import React, { useState, useEffect } from 'react';
import { Calendar, momentLocalizer } from 'react-big-calendar';
import moment from 'moment';
import 'moment/locale/ru';

import 'react-big-calendar/lib/css/react-big-calendar.css';
import { EditDayWorkingShiftModal } from '../modals';
import { generateCalendarEvents } from './generate-calendar-events';

import { useCalendarStore } from 'store/calendar';

import styles from '../styles.module.scss';

const localizer = momentLocalizer(moment);

const calendarMessages = {
  today: 'Сегодня',
  previous: 'Назад',
  next: 'Вперед',
};

export const CustomCalendar = ({ currentDate, setCurrentDate }) => {
  const {
    calendar,
    loadMainCalendarByYear,
    loadCalendarByEquipment,
    loadCalendarByWelder,
  } = useCalendarStore();

  const [selectedEvent, setSelectedEvent] = useState(null);
  const [calendarEvents, setCalendarEvents] = useState([]);

  useEffect(() => {
    const events = generateCalendarEvents(
      currentDate,
      calendar?.days,
      calendar?.mainWorkingShifts
    );
    setCalendarEvents(events);
  }, [currentDate, calendar]);

  const handleEventSelection = event => {
    setSelectedEvent(event);
  };

  const loadAppropriateCalendar = year => {
    if (calendar.welderId) {
      loadCalendarByWelder(calendar.welderId, year);
      return;
    }

    if (calendar.weldingEquipmentId) {
      loadCalendarByEquipment(calendar.weldingEquipmentId, year);
      return;
    }

    loadMainCalendarByYear(year);
  };

  const handleNavigation = date => {
    const year = date.getFullYear();
    setCurrentDate(date);

    if (calendar?.year !== year) {
      loadAppropriateCalendar(year);
    }
  };

  return (
    <div className={styles.calendar_wrapper}>
      <Calendar
        localizer={localizer}
        startAccessor="start"
        endAccessor="end"
        selectable
        onSelectEvent={handleEventSelection}
        onNavigate={handleNavigation}
        date={currentDate}
        views={['month']}
        messages={calendarMessages}
        events={calendarEvents}
      />

      {selectedEvent && (
        <EditDayWorkingShiftModal
          dayEvent={selectedEvent}
          setDayEvent={setSelectedEvent}
        />
      )}
    </div>
  );
};
