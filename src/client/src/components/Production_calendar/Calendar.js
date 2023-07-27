import React, { useState, useEffect } from 'react';
import { Calendar, momentLocalizer } from 'react-big-calendar';
import moment from 'moment';
import 'moment/locale/ru';
import Input from "components/shared/Input";
import styles from "./styles.module.css";
import 'react-big-calendar/lib/css/react-big-calendar.css';
import Select from "components/shared/Select";
import api from "services/api";


const localizer = momentLocalizer(moment);

const Calendars = ({ valueWorkDays, WorkingShiftOptions , loadCalendarYear}) => {
  const [selectedEvent, setSelectedEvent] = useState(null);



  const [changedate, setchangedate] = useState("");
  const [valueWorkingShift, setvalueWorkingShift] = useState(null);
  const [valuechange, setvaluechange] = useState(false);


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
  };

  const [events, setevents] = useState([]);

  useEffect(() => {
    getDays(new Date())
  }, [WorkingShiftOptions]);



  function getDays(now) {
    setevents([]);
    let events = [];
    for (let i = new Date(now.getFullYear(), now.getMonth(), 1).getDate(); i <= new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate(); i++) {
      const existingDay = valueWorkDays?.find(day => day.number === i && day.monthNumber === now.getMonth() + 1); 
      const isWorkDay = valueWorkDays?.find(day => day.number === i && day.monthNumber === now.getMonth() + 1)?.isWorkingDay; 
 
      if (!existingDay && !isWorkDay) {
        const shift1 = WorkingShiftOptions.find(elem => elem.number === 1);
        const shift2 = WorkingShiftOptions.find(elem => elem.number === 2);
        const shift3 = WorkingShiftOptions.find(elem => elem.number === 3); 
        events.push(
          {
            id: existingDay?.id,
            title: `Смена 1`,
            start: new Date(now.getFullYear(), now.getMonth(), i, parseInt(shift1?.shiftStart?.substring(0, 2)), parseInt(shift1?.shiftStart?.substring(3, 5))),
            end: new Date(now.getFullYear(), now.getMonth(), i, parseInt(shift1?.shiftEnd?.substring(0, 2)), parseInt(shift1?.shiftEnd?.substring(3, 5))),
          },
          {
            id: existingDay?.id,
            title: `Смена 2`,
            start: new Date(now.getFullYear(), now.getMonth(), i, parseInt(shift2?.shiftStart?.substring(0, 2)), parseInt(shift2?.shiftStart?.substring(3, 5))),
            end: new Date(now.getFullYear(), now.getMonth(), i, parseInt(shift2?.shiftEnd?.substring(0, 2)), parseInt(shift2?.shiftEnd?.substring(3, 5))),
          },
          {
            id: existingDay?.id,
            title: `Смена 3`,
            start: new Date(now.getFullYear(), now.getMonth(), i, parseInt(shift3?.shiftStart?.substring(0, 2)), parseInt(shift3?.shiftStart?.substring(3, 5))),
            end: new Date(now.getFullYear(), now.getMonth(), i, parseInt(shift3?.shiftEnd?.substring(0, 2)), parseInt(shift3?.shiftEnd?.substring(3, 5))),
          }
        );
      } else {
        events.push(
          {
            id: existingDay?.id,  
            title: `Выходной день`,
            start: new Date(now.getFullYear(), now.getMonth(), i),
            end: new Date(now.getFullYear(), now.getMonth(), i),
          }
        );
      }
    }
    setevents(events);
  }

  function setWorkDay(date) {  
    const data = {
      "id": date.id,
      "monthNumber": new Date(date?.start).getMonth()+1,
      "number": new Date(date.start).getDate(),
      "isWorkingDay": true
    }
    api.remove(`day/${date.id}`).then(()=>{ 
      setSelectedEvent(false)
      loadCalendarYear()
    }) 
  }

  function handleMonthChange(date) {
    getDays(date)
  }


  
  //Удаление смены в рабочем дне 
  async function removeDay(changedateID) { 
    let data = valueWorkDays.find((day) => day.id === changedateID.id);
    console.log(changedateID) 
    const smenaIndex = data?.workingShifts.findIndex((smena) => smena.number === Number(changedateID.title.replace(/[^\w\s!?]/g, '')));
    if (smenaIndex !== -1) {
      data.workingShifts.splice(smenaIndex, 1);
    } 
    data.weldingEquipmentId = null;
    data.welderId = null; 
    delete data.id; 
    await api.remove(`day/${changedateID.id}`);
    await api.post("day", data); 
    loadCalendarYear()
  }

  return (
    <div className={styles.calendar_wrapper}>
      <Calendar
        localizer={localizer}
        events={events}
        startAccessor="start"
        endAccessor="end"
        selectable
        onSelectEvent={handleSelectEvent}
        onNavigate={handleMonthChange}
        min={startOfMonth}
        max={endOfMonth}
        views={['month']}
        messages={messages}
      />

      {selectedEvent && (
        <div>
          <div className={styles.hints}>
            <h2>{selectedEvent.title}</h2>
            <p>Начало: {selectedEvent.start.toLocaleString()}</p>
            <p>Конец: {selectedEvent.end.toLocaleString()}</p>
            {selectedEvent.title === "Выходной день" && (
              <button onClick={() => setWorkDay(selectedEvent)}>Сделать рабочим</button>
            )}
            {/* {selectedEvent.title.includes("Смена") && (
              <button onClick={() => {removeDay(selectedEvent);setSelectedEvent(false);}}>Удалить</button>
            )} */}
            
          </div>
          <div className={styles.hintsBg} onClick={() => { setSelectedEvent(false); setvaluechange(false) }}></div>
        </div>
      )}
    </div >
  );
};

export default Calendars;