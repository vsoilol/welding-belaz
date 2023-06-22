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

  const events = []; 
  /* events.push(...Array.from({length: endOfMonth.getDate()}, (_, i) => ({
      title: 'Смена 1',
      start: new Date(now.getFullYear(), now.getMonth(), i + 1, 7, 30),
      end: new Date(now.getFullYear(), now.getMonth(), i + 1, 16, 0)
    })));  */
  
  const messages = {
    today: 'Сегодня',
    previous: 'Назад',
    next: 'Вперед',
    month: 'Месяц',
    week: 'Неделя',
  }; 
 
  const handleNavigate  = (date) =>{ 
    dayWork(new Date(moment(date).toDate()).getMonth()+1 , new Date(moment(date).toDate()).getFullYear()) 
  }
   

  dayWork(new Date().getMonth()+1,new Date().getFullYear())

  function dayWork(Month,Year) {
    arrayDays.forEach(element => {
      if(element.isWorkingDay){
        /* console.log(element) */
      } 
      /* element.isWorkingDay?console.log(element):null */
    });
    /* console.log(arrayDays)  */
    /* console.log(Month)
    console.log(Year) */
  }
  
  return (
    <div className={styles.calendar_wrapper}>   
      <Calendar
        localizer={localizer}
        events={[]/* events */}
        startAccessor="start"
        endAccessor="end"
        titleAccessor="title"
        allDayAccessor="allDay"
        defaultView="month"
        selectable 
        min={0/* 0startOfMonth */}
        max={10/* endOfMonth */}
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
