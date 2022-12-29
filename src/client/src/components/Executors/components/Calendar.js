 

import React, { useState } from "react";
import Calendar from "react-calendar";
import "react-calendar/dist/Calendar.css";
import ReactDOM from "react-dom";

import "../components/styleCalendar.css";

const  Calendars = () => { 
  // Array to store month string values
  const allMonthValues = [
    "Январь",
    "Февраль",
    "Март",
    "Апрель",
    "Май",
    "Июнь",
    "Июль",
    "Август",
    "Сентябрь",
    "Октябрь",
    "Ноябрь",
    "Декабрь"
  ];

  // State for date selected by user
  const [selectedDate, setSelectedDate] = useState();

  // State for text above calander
  const [calendarText, setCalendarText] = useState(` `);

  // Function to update selected date and calander text
  const handleDateChange = (value) => {
    setSelectedDate(value);
   /*  setCalendarText(`Вы выбрали ${value.toDateString()}`); */
  };

  // Function to handle selected Year change
  const handleYearChange = (value) => {
    const yearValue = value.getFullYear();
    /* setCalendarText(`${yearValue} Year  is selected`); */
  };

  // Function to handle selected Month change
  const handleMonthChange = (value) => {
    const monthValue = allMonthValues[value.getMonth()];
    /* setCalendarText(`${monthValue} Month  is selected`); */
  };


   /* try {
    setTimeout(() => {
      CalendarEddings() 
  
      document.querySelector(".react-calendar__navigation").addEventListener("click",function () {
         try {
          setTimeout(() => {
            CalendarEddings() 
           }, 100);
         } catch (error) {
          
         }
      })
  
    }, 1000);
   } catch (error) {
    
   } */


  function CalendarEddings() {
    document.querySelectorAll(".react-calendar__tile.react-calendar__month-view__days__day em").forEach(elm=>{
 
      elm.remove()
    }) 
    document.querySelectorAll(".react-calendar__tile.react-calendar__month-view__days__day").forEach(elm=>{

      let EM = document.createElement("em")
      EM.innerHTML="Смена ( 8:00 - 18:00 )"
      elm.append(EM) 
    }) 
    document.querySelectorAll(".react-calendar__tile.react-calendar__month-view__days__day.react-calendar__month-view__days__day--weekend em").forEach(elm=>{
      elm.remove()
    })
  }


  return (
    <div className="app"> 
      <Calendar
        onClickMonth={handleMonthChange}
        onClickYear={handleYearChange}
        onChange={handleDateChange}
        value={selectedDate} 
      />
    </div>
  );
}

export default Calendars;
