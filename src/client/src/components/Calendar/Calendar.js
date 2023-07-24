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

const Calendars = ({ valueWorkDays, WorkingShiftOptions, executorObj, equipmentObj, loadDayByWelder, loadDayByEquipment }) => {
  const [selectedEvent, setSelectedEvent] = useState(null);

  const [changedate, setchangedate] = useState("");
  const [valueWorkingShift, setvalueWorkingShift] = useState(null);
  const [valuechange, setvaluechange] = useState(false);


  const handleSelectEvent = (event) => {
    setSelectedEvent(event);
  };

  function changeDay(selectedEvent) {
    const data = {
      "id": selectedEvent.id,
      "monthNumber": new Date(changedate).getMonth(),
      "number": new Date(changedate).getDate(),
      "isWorkingDay": true
    }
    api.put("day", data).then(() => {
      executorObj ? loadDayByWelder(executorObj.id) : loadDayByEquipment(equipmentObj.id)
      setSelectedEvent(false)
      setvaluechange(false)
    })
  }

  const now = new Date();
  const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);
  const endOfMonth = new Date(now.getFullYear(), now.getMonth() + 1, 0);

  const messages = {
    today: 'Сегодня',
    previous: 'Назад',
    next: 'Вперед',
  };

  const events = []; 
  for (let index = 0; index < valueWorkDays.length; index++) {
    const eventTitle = `Смена ${valueWorkDays[index].workingShifts[0].number}`;  
      events.push({
        id: valueWorkDays[index].id,
        title: eventTitle,
        start: new Date(2023, valueWorkDays[index].monthNumber, valueWorkDays[index].number, `${valueWorkDays[index].workingShifts[0].shiftStart[0]}${valueWorkDays[index].workingShifts[0].shiftStart[1]} `, `${valueWorkDays[index].workingShifts[0].shiftStart[3]}${valueWorkDays[index].workingShifts[0].shiftStart[4]} `),
        end: new Date(2023, valueWorkDays[index].monthNumber, valueWorkDays[index].number, `${valueWorkDays[index].workingShifts[0].shiftEnd[0]}${valueWorkDays[index].workingShifts[0].shiftEnd[1]} `, `${valueWorkDays[index].workingShifts[0].shiftEnd[3]}${valueWorkDays[index].workingShifts[0].shiftEnd[4]} `),
      }); 
  }


  function removeDay(changedateID) { 
     api.remove(`day/${changedateID}`).then(()=>{
      executorObj ? loadDayByWelder(executorObj.id) : loadDayByEquipment(equipmentObj.id)
  
     })
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
        min={startOfMonth}
        max={endOfMonth}
        views={['month']}
        messages={messages}
      />
      {selectedEvent && (
        <div>
          <div className={styles.hints} >
            <h2>{selectedEvent.title}</h2>
            <p>Начало: {selectedEvent.start.toLocaleString()}</p>
            <p>Конец: {selectedEvent.end.toLocaleString()}</p>


            {valuechange
              ? (
                <div>
                  <label>Редактирование</label>
                  <div className={styles.row}>
                    <Input
                      onChange={(e) => {
                        setchangedate(e.target.value);
                      }}
                      width="380"
                      style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                      value={changedate}
                      name="changedate"
                      placeholder="Дата рабочего дня"
                      type="text"
                      onFocus={(e) => {
                        e.currentTarget.type = "date";
                      }}
                      autocomplete="off"
                    />
                  </div>
                  {/* <div className={styles.row}>
                    <Select
                      name="valueWorkingShift"
                      value={valueWorkingShift}
                      width="380px"
                      placeholder="Смена"
                      onChange={(event) => {
                        setvalueWorkingShift(event.value)
                      }}
                      options={WorkingShiftOptions}
                    />
                  </div> */}
                  <button className={styles.save} onClick={() => changeDay(selectedEvent)}>Сохранить</button>

                </div>
              )
              : null
            }



            {!valuechange
              ?
              <div>
                <button onClick={() => setvaluechange(true)}>Редактировать</button>
                <button onClick={() => {removeDay(selectedEvent.id);setSelectedEvent(false);}}>Удалить</button>
              </div>
              : null
            }


          </div>
          <div className={styles.hintsBg} onClick={() => { setSelectedEvent(false); setvaluechange(false) }}></div>
        </div>

      )
      }
    </div >
  );
};

export default Calendars;