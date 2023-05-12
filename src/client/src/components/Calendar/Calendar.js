import React, { useState, useRef, useEffect } from 'react';
import { Calendar, momentLocalizer } from 'react-big-calendar';
import moment from 'moment';
import 'moment/locale/ru';

import "./styleCalendar.css";
import 'react-big-calendar/lib/css/react-big-calendar.css';
import styles from "./styles.module.css";

export const Calendars = ({
  executors,
  equipment,
  resultArrayDays,
}) => {

  const localizer = momentLocalizer(moment);
  moment.locale('ru');

  const events = resultArrayDays;

  const [selectedEvent, setSelectedEvent] = useState(null);

  const modalEventBodyRef = useRef(null);

  const handleSelectEvent = (event) => {
    setSelectedEvent(event);
  };

  const now = new Date();
  const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);
  const endOfMonth = new Date(now.getFullYear(), now.getMonth() + 1, 0);

  const messages = {
    today: 'Сегодня',
    previous: 'Назад',
    next: 'Вперед',
    month: 'Месяц',
    week: 'Неделя',
  };

  let InfoForCalendarEquipment = equipment[0]?.find(item => item.id === window.localStorage.getItem("equipmentId"));
  let InfoForCalendar = executors?.find(item => item.id === window.localStorage.getItem("executorId"));

  useEffect(() => {
    function handleClickOutside(event) {
      if (modalEventBodyRef.current && !modalEventBodyRef.current.contains(event.target)) {
        setSelectedEvent(null);
      }
    }

    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, [modalEventBodyRef]);
 
  
  return (
    <div className={styles.calendar_wrapper}>

     {/*  {events?.length !=0
        ? (
          <div class="preloader">
            <div class="loader"> </div>
            <h3>Подождите, идет загрузка...</h3>
          </div>
        )
        : <div></div>
      } */}
      {InfoForCalendar
        ? (
          <div className='InfoForCalendar'>
            <h2>Сварщик: <span>{InfoForCalendar?.middleName} {InfoForCalendar?.firstName} {InfoForCalendar?.lastName}</span></h2>
            <p>Цех: <span>{InfoForCalendar?.workshop?.name}</span>  </p>
            <p>Должность: <span>{InfoForCalendar?.position}</span>  </p>
            <p>Производственный участок: <span>{InfoForCalendar?.productionArea?.name}</span>  </p>
          </div>
        )
        : (
          <div className='InfoForCalendar'>
            <h2>Оборудование: <span>{InfoForCalendarEquipment?.name}</span> </h2>
            <p>Цех: <span>{InfoForCalendarEquipment?.workshop?.name}</span>  </p>
            <p>Маркировка: <span>{InfoForCalendarEquipment?.marking}</span>  </p>
            <p>Производственный участок: <span>{InfoForCalendarEquipment?.productionArea?.name}</span>  </p>
          </div>
        )
      }
      <Calendar
        localizer={localizer}
        events={events}
        startAccessor="start"
        endAccessor="end"
        titleAccessor="title"
        allDayAccessor="allDay"
        defaultView="month"
        selectable
        onSelectEvent={handleSelectEvent}
        min={startOfMonth}
        max={endOfMonth}
        views={['month', 'week']}
        messages={messages}
        weekdayFormat="dd"
        dayHeaderFormat="ddd"
        toolbar={['month', 'week']} 
      />
      {selectedEvent && (
        <div className='ModalEvent'>
          <div className='ModalEventBody' ref={modalEventBodyRef}>
            <h2>{selectedEvent.title}</h2>
            <p><span>Время смены:</span> <br></br> <em>{selectedEvent.start.toLocaleString()} - {selectedEvent.shiftEnd.toLocaleString()}</em> </p>
            <p><span>Время перерыва:</span> <br></br> <em>{selectedEvent.end.toLocaleString()} - {selectedEvent.breakEnd.toLocaleString()}</em></p>
          </div>
        </div>
      )}
    </div>
  );
};
