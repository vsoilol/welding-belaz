import React, { useState, useEffect } from "react";
import { Calendar, momentLocalizer } from "react-big-calendar";
import moment from "moment";
import "moment/locale/ru";
import Input from "components/shared/Input";
import styles from "./styles.module.scss";
import "react-big-calendar/lib/css/react-big-calendar.css";
import Select from "components/shared/Select";
import api from "services/api";

const localizer = momentLocalizer(moment);

const Calendars = ({
  userRole,
  calendar,
  valueWorkDays,
  WorkingShiftOptions,
  loadDayByWelder,
  loadDayByEquipment,
  executorObj,
  equipmentObj,
}) => {
  const [selectedEvent, setSelectedEvent] = useState(null);
  const [changedate, setchangedate] = useState("");
  const [valueWorkingShift, setvalueWorkingShift] = useState(null);
  const [valuechange, setvaluechange] = useState(false);
  const [events, setevents] = useState([]);
  const [SelectDateChange, setSelectDateChange] = useState(new Date());

  const handleSelectEvent = (event) => {
    setSelectedEvent(event);
  };

  useEffect(() => {
    if (WorkingShiftOptions) {
      getDays(SelectDateChange);
    }
  }, [WorkingShiftOptions, SelectDateChange, valueWorkDays]);

  function getDays(now) {
    setevents([]);
    let events = [];
    const numDaysInMonth = new Date(
      now.getFullYear(),
      now.getMonth() + 1,
      0
    ).getDate();

    const dayWelder = Array.isArray(valueWorkDays)
      ? valueWorkDays.filter((day) => day.isWorkingDay === true)
      : valueWorkDays?.days?.filter((day) => day.isWorkingDay === true);

    if (equipmentObj) {
      if (
        valueWorkDays?.days
          ? valueWorkDays.days.length
          : valueWorkDays?.length >= 100
      ) {
        for (let i = 1; i <= numDaysInMonth; i++) {
          const day = valueWorkDays?.days
            ? valueWorkDays.days.find(
                (day) =>
                  day.number === i && day.monthNumber === now.getMonth() + 1
              )
            : valueWorkDays.find(
                (day) =>
                  day.number === i && day.monthNumber === now.getMonth() + 1
              );

          if (!day) {
            if (
              calendar &&
              Array.isArray(calendar.mainWorkingShifts) &&
              calendar.mainWorkingShifts.length >= 3
            ) {
              events.push(
                {
                  title: `Смена 1`,
                  start: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  end: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  breakStart: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                  breakEnd: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                },
                {
                  title: `Смена 2`,
                  start: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  end: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  breakStart: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                  breakEnd: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                },
                {
                  title: `Смена 3`,
                  start: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  end: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  breakStart: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                  breakEnd: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                }
              );
            }

            if (
              calendar &&
              Array.isArray(calendar.mainWorkingShifts) &&
              calendar.mainWorkingShifts.length === 2
            ) {
              events.push(
                {
                  title: `Смена 1`,
                  start: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  end: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  breakStart: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                  breakEnd: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                },
                {
                  title: `Смена 2`,
                  start: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  end: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                  breakStart: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                  breakEnd: new Date(
                    now.getFullYear(),
                    now.getMonth(),
                    i,
                    breakStart,
                    breakStart
                  ),
                }
              );
            }

            if (
              calendar &&
              Array.isArray(calendar.mainWorkingShifts) &&
              calendar.mainWorkingShifts.length === 1
            ) {
              events.push({
                title: `Смена 1`,
                start: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                end: new Date(now.getFullYear(), now.getMonth(), i, 0, 0),
                breakStart: new Date(
                  now.getFullYear(),
                  now.getMonth(),
                  i,
                  breakStart,
                  breakStart
                ),
                breakEnd: new Date(
                  now.getFullYear(),
                  now.getMonth(),
                  i,
                  breakStart,
                  breakStart
                ),
              });
            }
          } else {
            if (day.isWorkingDay) {
              const maxShiftsToShow = Math.min(3, day.workingShifts.length);
              for (let j = 0; j < maxShiftsToShow; j++) {
                const shift = day.workingShifts[j];
                if (shift && shift.shiftStart && shift.shiftEnd) {
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
              }
            } else {
              events.push({
                id: day.id,
                title: "Выходной день",
                start: new Date(now.getFullYear(), now.getMonth(), i),
                end: new Date(now.getFullYear(), now.getMonth(), i + 1),
              });
            }
          }
        }
      }
    }

    if (executorObj) {
      for (let index = 0; index < dayWelder.length; index++) {
        if (dayWelder[index].isWorkingDay) {
          const maxShiftsToShow = Math.min(
            3,
            dayWelder[index].workingShifts.length
          );
          for (let j = 0; j < maxShiftsToShow; j++) {
            const shift = dayWelder[index].workingShifts[j];
            if (shift && shift.shiftStart && shift.shiftEnd) {
              events.push({
                id: shift.id,
                title: `Смена ${shift.number}`,
                start: new Date(
                  dayWelder[index].year,
                  dayWelder[index].monthNumber - 1, // Months in JavaScript are zero-based (0-11)
                  dayWelder[index].number,
                  parseInt(shift.shiftStart.split(":")[0]),
                  parseInt(shift.shiftStart.split(":")[1])
                ),
                end: new Date(
                  dayWelder[index].year,
                  dayWelder[index].monthNumber - 1,
                  dayWelder[index].number,
                  parseInt(shift.shiftEnd.split(":")[0]),
                  parseInt(shift.shiftEnd.split(":")[1])
                ),
                breakStart: shift.breakStart
                  ? new Date(
                      dayWelder[index].year,
                      dayWelder[index].monthNumber - 1,
                      dayWelder[index].number,
                      parseInt(shift.breakStart.split(":")[0]),
                      parseInt(shift.breakStart.split(":")[1])
                    )
                  : null,
                breakEnd: shift.breakEnd
                  ? new Date(
                      dayWelder[index].year,
                      dayWelder[index].monthNumber - 1,
                      dayWelder[index].number,
                      parseInt(shift.breakEnd.split(":")[0]),
                      parseInt(shift.breakEnd.split(":")[1])
                    )
                  : null,
              });
            }
          }
        } else {
          events.dayWelder[index]({
            id: dayWelder.id,
            title: "Выходной день",
            start: new Date(
              dayWelder[index].year,
              dayWelder[index].monthNumber - 1,
              dayWelder[index].number
            ),
            end: new Date(
              dayWelder[index].year,
              dayWelder[index].monthNumber - 1,
              dayWelder[index].number + 1
            ),
          });
        }
      }
    }

    setevents(events);
  }

  const now = new Date();
  const startOfMonth = new Date(now.getFullYear(), now.getMonth(), 1);
  const endOfMonth = new Date(now.getFullYear(), now.getMonth() + 1, 0);

  const messages = {
    today: "Сегодня",
    previous: "Назад",
    next: "Вперед",
  };

  //Удаление смены в рабочем дне
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
      const filteredWorkingShiftOptions = calendar.mainWorkingShifts.filter(
        (shift) => shift.number !== numberToRemove
      );
      const data = {
        monthNumber: new Date(changedateID.start).getMonth() + 1,
        number: new Date(changedateID.start).getDate(),
        isWorkingDay: true,
        year: new Date(changedateID.start).getFullYear(),
        weldingEquipmentId: equipmentObj?.id ?? null,
        welderId: executorObj?.id ?? null,
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
          weldingEquipmentId: equipmentObj?.id ?? null,
          welderId: executorObj?.id ?? null,
          workingShifts: null,
        };
        await api.post("day", data);
      }
    }
    executorObj
      ? loadDayByWelder(executorObj.id)
      : loadDayByEquipment(equipmentObj.id);
  }

  function handleMonthChange(date) {
    getDays(date);
    setSelectDateChange(date);
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

  ///Изменение времени рабочей смены в модальном окне
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
      executorObj
        ? loadDayByWelder(executorObj.id)
        : loadDayByEquipment(equipmentObj.id);
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
