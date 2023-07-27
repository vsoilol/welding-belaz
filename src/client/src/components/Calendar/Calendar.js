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

  async function changeDay(selectedEvent) {
     
   /*  console.log(selectedEvent)
    console.log(changedate) */
    
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
  const addedShiftsPerDay = {}; // Объект для отслеживания добавленных смен за каждый день

  for (let index = 0; index < valueWorkDays.length; index++) {
    const dayNumber = valueWorkDays[index].number; 
    for (let index2 = 0; index2 < valueWorkDays[index].workingShifts.length; index2++) {
      const workingShift = valueWorkDays[index].workingShifts[index2];
      const shiftNumber = workingShift.number;
      const eventTitle = `Смена ${shiftNumber}`; 
      // Проверяем, добавлена ли уже смена с данным номером за текущий день
      if (!addedShiftsPerDay[dayNumber] || !addedShiftsPerDay[dayNumber][shiftNumber]) {
        events.push({
          id: valueWorkDays[index].id,
          title: eventTitle,
          start: new Date(2023, valueWorkDays[index].monthNumber, dayNumber, `${workingShift.shiftStart[0]}${workingShift.shiftStart[1]} `, `${workingShift.shiftStart[3]}${workingShift.shiftStart[4]} `),
          end: new Date(2023, valueWorkDays[index].monthNumber, dayNumber, `${workingShift.shiftEnd[0]}${workingShift.shiftEnd[1]} `, `${workingShift.shiftEnd[3]}${workingShift.shiftEnd[4]} `),
        }); 
        // Помечаем смену с данным номером за текущий день как добавленную
        if (!addedShiftsPerDay[dayNumber]) {
          addedShiftsPerDay[dayNumber] = {};
        }
        addedShiftsPerDay[dayNumber][shiftNumber] = true;
      }
    }
  }


  //Удаление смены в рабочем дне 
  async function removeDay(changedateID) { 
    let data = valueWorkDays.find((day) => day.id === changedateID.id); 
    const smenaIndex = data?.workingShifts.findIndex((smena) => smena.number === Number(changedateID.title.replace(/[^\w\s!?]/g, '')));
    if (smenaIndex !== -1) {
      data.workingShifts.splice(smenaIndex, 1);
    } 
    data.weldingEquipmentId = equipmentObj?.id ?? null;
    data.welderId = executorObj?.id ?? null; 
    delete data.id; 
    await api.remove(`day/${changedateID.id}`);
    await api.post("day", data); 
    executorObj ? loadDayByWelder(executorObj.id) : loadDayByEquipment(equipmentObj.id);
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
                {/* <button onClick={() => setvaluechange(true)}>Редактировать</button> */}
                <button onClick={() => {removeDay(selectedEvent);setSelectedEvent(false);}}>Удалить</button>
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