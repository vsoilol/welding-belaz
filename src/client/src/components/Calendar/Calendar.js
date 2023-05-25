import React, { useState, useRef, useEffect , useCallback} from 'react';
import { Calendar, momentLocalizer } from 'react-big-calendar';
import moment from 'moment';
import 'moment/locale/ru';

import "./styleCalendar.css";
import 'react-big-calendar/lib/css/react-big-calendar.css';
import styles from "./styles.module.css";

export const Calendars = ({
  executors,
  equipment,
  arrayDays,
}) => {

  const localizer = momentLocalizer(moment);
  moment.locale('ru');
 
  console.log(arrayDays)
  const events=[]   

  const modalEventBodyRef = useRef(null); 
 
  const now = new Date();
  const startOfMonth = new Date(new Date().getFullYear(), new Date().getMonth(), 1);
  const endOfMonth = new Date(new Date().getFullYear(), new Date().getMonth() + 1, 0); 

  function dayWork(now) {
    events.length = 0;
    events.push(...Array.from({length: endOfMonth.getDate()}, (_, i) => ({
      title: 'Смена 1',
      start: new Date(now.getFullYear(), now.getMonth(), i + 1, 7, 30),
      end: new Date(now.getFullYear(), now.getMonth(), i + 1, 16, 0)
    }))); 
  } 
  dayWork(now);

  const messages = {
    today: 'Сегодня',
    previous: 'Назад',
    next: 'Вперед',
    month: 'Месяц',
    week: 'Неделя',
  }; 
 
  const handleNavigate  = (date) =>{
    dayWork(moment(date).toDate());
  }
   
  
  return (
    <div className={styles.calendar_wrapper}>   
      <Calendar
        localizer={localizer}
        events={events}
        startAccessor="start"
        endAccessor="end"
        titleAccessor="title"
        allDayAccessor="allDay"
        defaultView="month"
        selectable 
        min={startOfMonth}
        max={endOfMonth}
        views={['month', 'week']}
        messages={messages}
        weekdayFormat="dd"
        dayHeaderFormat="ddd"
        toolbar={['month', 'week']} 
        onNavigate={handleNavigate}
      /> 
    </div>
  );
};
