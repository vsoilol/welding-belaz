import React, { useEffect, useState, useMemo } from "react";
import { tasksImage } from "assets/pics";

import { LoadingSpinner, ToolTip } from "components/shared";
import {
  AddWeekendModal,
  AddWorkingDayModal,
  EditWorkingShiftModal,
} from "./modals";

import styles from "./styles.module.scss";

import { CustomCalendar } from "./custom-calendar";
import "./styleCalendar.scss";

export const BaseCalendar = ({
  userRole,
  loadMainCalendarByYear,
  mainCalendar,
  calendarIsLoading,
  updateWorkingDayWithWorkingShift,
  createDay,
  updateDay,
  createWorkingShift,
  deleteWorkingShift,
  updateWorkingShift,
  loadCalendarByWelder,
  loadCalendarByEquipment,
  createCalendarForEquipmentBasedOnMain,
}) => {
  const [isModalAddWorkDayOpen, setIsModalAddWorkDayOpen] = useState(false);
  const [isModalAddWeekendOpen, setIsModalAddWeekendOpen] = useState(false);
  const [isModalAddShiftOpen, setIsModalAddShiftOpen] = useState(false);

  const [currentDate, setCurrentDate] = useState(new Date());

  const executor = useMemo(() => {
    return JSON.parse(localStorage.getItem("executor"));
  }, []);

  const equipment = useMemo(() => {
    return JSON.parse(localStorage.getItem("equipment"));
  }, []);

  useEffect(() => {
    const currentDate = new Date().getUTCFullYear();

    if (executor) {
      loadCalendarByWelder(executor.id, currentDate);
      return;
    }

    if (equipment) {
      loadCalendarByEquipment(equipment.id, currentDate);
      return;
    }
  }, [loadCalendarByWelder, executor, equipment, loadCalendarByEquipment]);

  const addOrUpdateWorkingDay = (data) => {
    const { workingShiftId, workingDay } = data;

    const workingShift = mainCalendar.mainWorkingShifts.find(
      (shift) => shift.id === workingShiftId
    );

    const parsedDate = new Date(workingDay);
    const dayNumber = parsedDate.getDate();
    const monthNumber = parsedDate.getMonth() + 1;
    const year = parsedDate.getFullYear();

    const existingDay = mainCalendar.days.find(
      (day) => day.number === dayNumber && day.monthNumber === monthNumber
    );

    if (existingDay) {
      const shiftExistsInDay = existingDay.workingShifts.some(
        (shift) => shift.number === workingShift.number
      );

      if (!shiftExistsInDay) {
        updateWorkingDayWithWorkingShift(existingDay, workingShift);
      }
    } else {
      const newDay = {
        monthNumber,
        number: dayNumber,
        isWorkingDay: true,
        year,
        weldingEquipmentId: equipment?.id,
        welderId: executor?.id,
        workingShifts: [workingShift],
      };

      createDay(newDay);
    }
  };

  const addWeekendDay = ({ dayDate }) => {
    const parsedDate = new Date(dayDate);
    const dayNumber = parsedDate.getDate();
    const monthNumber = parsedDate.getMonth() + 1;
    const year = parsedDate.getFullYear();

    const existingDay = mainCalendar.days.find(
      (day) => day.number === dayNumber && day.monthNumber === monthNumber
    );

    if (existingDay) {
      existingDay.isWorkingDay = false;
      updateDay(existingDay);
    } else {
      const newDay = {
        monthNumber,
        number: dayNumber,
        isWorkingDay: false,
        year,
        weldingEquipmentId: equipment?.id,
        welderId: executor?.id,
        workingShifts: [],
      };

      createDay(newDay);
    }
  };

  return (
    <>
      <div className={styles.innerWrapper}>
        <ToolTip
          title="Производственный календарь"
          toolTipText="Здесь Вы можете просмотреть производственный календарь "
          src={tasksImage}
        />

        <div className={styles.tableWrapper}>
          <div className="calendar-wrapper">
            {executor ? (
              <h2>
                Сварщик: {executor.middleName} {executor.firstName}{" "}
                {executor.lastName}
              </h2>
            ) : (
              <h2>
                Оборудование: {equipment.name} №{equipment.factoryNumber}
              </h2>
            )}
            {userRole === "Admin" || userRole === "Master" ? (
              <div className={styles.RowToolsBtns}>
                <button onClick={() => setIsModalAddWorkDayOpen(true)}>
                  Добавить рабочий день
                </button>
                <button onClick={() => setIsModalAddWeekendOpen(true)}>
                  Добавить выходной день
                </button>
                <button
                  onClick={() => {
                    setIsModalAddShiftOpen(true);
                  }}
                >
                  Рабочие смены
                </button>

                {equipment && (
                  <div className={styles.Create}>
                    <label>Создание календаря на основе общезаводского</label>
                    <button
                      onClick={() => {
                        createCalendarForEquipmentBasedOnMain(
                          equipment.id,
                          mainCalendar.year
                        );
                      }}
                    >
                      Создать
                    </button>
                  </div>
                )}
              </div>
            ) : null}

            {calendarIsLoading && (
              <LoadingSpinner isFullScreenMode={false} paddingTop={"2vw"} />
            )}

            {mainCalendar?.days &&
              mainCalendar?.mainWorkingShifts &&
              !calendarIsLoading && (
                <CustomCalendar
                  calendarDays={mainCalendar?.days}
                  mainWorkingShifts={mainCalendar?.mainWorkingShifts}
                  userRole={userRole}
                  mainCalendar={mainCalendar}
                  currentDate={currentDate}
                  setCurrentDate={setCurrentDate}
                  updateWorkingShift={updateWorkingShift}
                  createDay={createDay}
                  deleteWorkingShift={deleteWorkingShift}
                  loadCalendarByWelder={loadCalendarByWelder}
                  loadCalendarByEquipment={loadCalendarByEquipment}
                />
              )}
          </div>
        </div>
      </div>

      {mainCalendar?.year && (
        <AddWorkingDayModal
          isOpen={isModalAddWorkDayOpen}
          toggleModal={setIsModalAddWorkDayOpen}
          calendarId={mainCalendar?.id ?? ""}
          workingShifts={mainCalendar?.mainWorkingShifts}
          onWorkingDaySubmit={addOrUpdateWorkingDay}
          currentYear={mainCalendar?.year}
        />
      )}

      {mainCalendar?.year && (
        <AddWeekendModal
          isOpen={isModalAddWeekendOpen}
          toggleModal={setIsModalAddWeekendOpen}
          onWeekendDaySubmit={addWeekendDay}
          currentYear={mainCalendar?.year}
        />
      )}

      {mainCalendar?.year && (
        <EditWorkingShiftModal
          isOpen={isModalAddShiftOpen}
          toggleModal={setIsModalAddShiftOpen}
          mainCalendar={mainCalendar}
          workingShifts={mainCalendar.mainWorkingShifts}
          createWorkingShift={createWorkingShift}
          deleteWorkingShift={deleteWorkingShift}
          updateWorkingShift={updateWorkingShift}
        />
      )}
    </>
  );
};
