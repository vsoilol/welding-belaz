import React, { useState, useEffect } from "react";
import { Calendar, momentLocalizer } from "react-big-calendar";
import moment from "moment";
import "moment/locale/ru";
import styles from "./styles.module.scss";
import "react-big-calendar/lib/css/react-big-calendar.css";
import api from "services/api";

const localizer = momentLocalizer(moment);

const Calendars = ({
  userRole,
  valueWorkDays,
  WorkingShiftOptions,
  loadCalendarYear,
}) => {
  const [selectedEvent, setSelectedEvent] = useState(null);

  const [valuechange, setvaluechange] = useState(false);

  const handleSelectEvent = (event) => {
    setSelectedEvent(event);
  };

  const now = new Date();
  const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);
  const endOfMonth = new Date(now.getFullYear(), now.getMonth() + 1, 0);

  const messages = {
    today: "Сегодня",
    previous: "Назад",
    next: "Вперед",
  };

  const [events, setEvents] = useState([]);
  const [SelectDateChange, setSelectDateChange] = useState(new Date());

  useEffect(() => {
    getDays(SelectDateChange);
  }, [WorkingShiftOptions]);

  function getDays(now) {
    setEvents([]);
    let events = [];

    for (
      let i = new Date(now.getFullYear(), now.getMonth(), 1).getDate();
      i <= new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate();
      i++
    ) {
      const day = valueWorkDays.find(
        (day) => day.number === i && day.monthNumber === now.getMonth() + 1
      );

      if (!day) {
        // День не найден в календаре, добавляем стандартные смены
        const maxShiftsToShow = Math.min(3, WorkingShiftOptions.length);
        for (let j = 0; j < maxShiftsToShow; j++) {
          const shift = WorkingShiftOptions[j];
          events.push({
            title: `Смена ${shift.number}`,
            start: new Date(
              now.getFullYear(),
              now.getMonth(),
              i,
              parseInt(shift.shiftStart.split(":")[0]),
              parseInt(shift.shiftStart.split(":")[1])
            ),
            end: new Date(
              now.getFullYear(),
              now.getMonth(),
              i,
              parseInt(shift.shiftEnd.split(":")[0]),
              parseInt(shift.shiftEnd.split(":")[1])
            ),
            // Добавляем времена перерыва, если они есть
            breakStart: shift.breakStart
              ? new Date(
                  now.getFullYear(),
                  now.getMonth(),
                  i,
                  parseInt(shift.breakStart.split(":")[0]),
                  parseInt(shift.breakStart.split(":")[1])
                )
              : null,
            breakEnd: shift.breakEnd
              ? new Date(
                  now.getFullYear(),
                  now.getMonth(),
                  i,
                  parseInt(shift.breakEnd.split(":")[0]),
                  parseInt(shift.breakEnd.split(":")[1])
                )
              : null,
          });
        }
      } else {
        if (day.isWorkingDay) {
          // День является рабочим, перебираем рабочие смены
          const maxShiftsToShow = Math.min(3, day.workingShifts.length);
          for (let j = 0; j < maxShiftsToShow; j++) {
            const shift = day.workingShifts[j];
            events.push({
              id: shift.id,
              title: `Смена ${shift.number}`,
              start: new Date(
                now.getFullYear(),
                now.getMonth(),
                i,
                parseInt(shift.shiftStart.split(":")[0]),
                parseInt(shift.shiftStart.split(":")[1])
              ),
              end: new Date(
                now.getFullYear(),
                now.getMonth(),
                i,
                parseInt(shift.shiftEnd.split(":")[0]),
                parseInt(shift.shiftEnd.split(":")[1])
              ),
              // Добавляем времена перерыва, если они есть
              breakStart: shift.breakStart
                ? new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    parseInt(shift.breakStart.split(":")[0]),
                    parseInt(shift.breakStart.split(":")[1])
                  )
                : null,
              breakEnd: shift.breakEnd
                ? new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    parseInt(shift.breakEnd.split(":")[0]),
                    parseInt(shift.breakEnd.split(":")[1])
                  )
                : null,
            });
          }
        } else {
          // День является выходным
          events.push({
            id: day.id,
            title: "Выходной день",
            start: new Date(now.getFullYear(), now.getMonth(), i),
            end: new Date(now.getFullYear(), now.getMonth(), i + 1),
          });
        }
      }
    }

    setEvents(events);
  }

  function handleMonthChange(date) {
    getDays(date);
    setSelectDateChange(date);
  }

  // Удаление смены в рабочем дне
  async function removeDay(changedateID) {
    const Day = valueWorkDays?.days
      ? valueWorkDays.days.find(
          (day) =>
            day.number === new Date(changedateID.start).getDate() &&
            day.monthNumber === new Date(changedateID.start).getMonth() + 1
        )
      : valueWorkDays.find(
          (day) =>
            day.number === new Date(changedateID.start).getDate() &&
            day.monthNumber === new Date(changedateID.start).getMonth() + 1
        );

    if (
      !Day ||
      !Day.workingShifts.some(
        (shift) =>
          shift.number === Number(changedateID.title.replace(/[^\w\s!?]/g, ""))
      )
    ) {
      const numberToRemove = Number(
        changedateID.title.replace(/[^\w\s!?]/g, "")
      );
      const filteredWorkingShiftOptions = WorkingShiftOptions.filter(
        (shift) => shift.number !== numberToRemove
      );
      const data = {
        monthNumber: new Date(changedateID.start).getMonth() + 1,
        number: new Date(changedateID.start).getDate(),
        isWorkingDay: true,
        year: new Date(changedateID.start).getFullYear(),
        weldingEquipmentId: null,
        welderId: null,
        workingShifts: filteredWorkingShiftOptions,
      };
      await api.post("day", data);
    } else {
      const idSmenRemove = Day.workingShifts.find(
        (elem) =>
          elem.number === Number(changedateID.title.replace(/[^\w\s!?]/g, ""))
      )?.id;

      if (idSmenRemove) {
        await api.remove(`/workingShift/${idSmenRemove}`);
      }

      if (Day.workingShifts.length === 1) {
        const dayId = Day.id;
        await api.remove(`day/${dayId}`);
        const data = {
          monthNumber: new Date(changedateID.start).getMonth() + 1,
          number: new Date(changedateID.start).getDate(),
          isWorkingDay: false,
          year: new Date(changedateID.start).getFullYear(),
          weldingEquipmentId: null,
          welderId: null,
          workingShifts: null,
        };

        await api.post("day", data);
      }
    }
    loadCalendarYear();
  }
  const [startTime, setStartTime] = useState("");
  const [endTime, setEndTime] = useState("");
  const [breakStart, setBreakStart] = useState("");
  const [breakEnd, setBreakEnd] = useState("");

  const handleStartTimeChange = (e) => {
    setStartTime(e.target.value);
  };

  const handleEndTimeChange = (e) => {
    setEndTime(e.target.value);
  };

  const handleBreakStartChange = (e) => {
    setBreakStart(e.target.value);
  };

  const handleBreakEndChange = (e) => {
    setBreakEnd(e.target.value);
  };

  function saveChangeShift(selectedEvent) {
    const data = {
      id: selectedEvent.id,
      number: Number(selectedEvent.title.replace(/[^\w\s!?]/g, "")),
      shiftStart: startTime,
      shiftEnd: endTime,
      breakStart: breakStart,
      breakEnd: breakEnd,
    };
    api.put("/workingShift", data).then(() => {
      loadCalendarYear();
      setSelectedEvent(false);
    });
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
        views={["month"]}
        messages={messages}
      />

      {selectedEvent && (
        <div>
          <div className={styles.hints}>
            <h2>{selectedEvent.title}</h2>
            <p>Начало: {selectedEvent.start.toLocaleString()}</p>
            <p>Конец: {selectedEvent.end.toLocaleString()}</p>
            {/* Добавляем отображение времени перерыва, если оно есть */}
            {selectedEvent.breakStart && selectedEvent.breakEnd && (
              <p>
                Перерыв: <br></br> {selectedEvent.breakStart.toLocaleString()} -{" "}
                {selectedEvent.breakEnd.toLocaleString()}
              </p>
            )}
            {!selectedEvent.title.includes("Выходной день") &&
              !valuechange &&
              (userRole === "Admin" || userRole === "Master") && (
                <div>
                  <p className={styles.par}>Редактировать смену:</p>
                  <div className={styles.rowInputs}>
                    <input
                      type="text"
                      placeholder="Начало"
                      value={startTime}
                      onChange={handleStartTimeChange}
                    />
                    <input
                      type="text"
                      placeholder="Конец"
                      value={endTime}
                      onChange={handleEndTimeChange}
                    />
                  </div>
                  <p className={styles.par}>Перерыв:</p>
                  <div className={styles.rowInputs}>
                    <input
                      type="text"
                      placeholder="Начало"
                      value={breakStart}
                      onChange={handleBreakStartChange}
                    />
                    <input
                      type="text"
                      placeholder="Конец"
                      value={breakEnd}
                      onChange={handleBreakEndChange}
                    />
                  </div>
                  <button
                    onClick={() => {
                      saveChangeShift(selectedEvent);
                    }}
                  >
                    Изменить
                  </button>
                </div>
              )}

            {!selectedEvent.title.includes("Выходной день") &&
              !valuechange &&
              (userRole === "Admin" || userRole === "Master") && (
                <div>
                  <button
                    onClick={() => {
                      removeDay(selectedEvent);
                      setSelectedEvent(false);
                    }}
                  >
                    Удалить
                  </button>
                </div>
              )}
          </div>
          <div
            className={styles.hintsBg}
            onClick={() => {
              setSelectedEvent(false);
              setvaluechange(false);
            }}
          ></div>
        </div>
      )}
    </div>
  );
};

export default Calendars;
