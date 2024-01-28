import React, { useEffect, useState } from "react";
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

export const ProductionCalendar = ({
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
}) => {
  const [isModalAddWorkDayOpen, setIsModalAddWorkDayOpen] = useState(false);
  const [isModalAddWeekendOpen, setIsModalAddWeekendOpen] = useState(false);
  const [isModalAddShiftOpen, setIsModalAddShiftOpen] = useState(false);

  const [currentDate, setCurrentDate] = useState(new Date());

  useEffect(() => {
    const currentDate = new Date().getUTCFullYear();
    loadMainCalendarByYear(currentDate);
  }, [loadMainCalendarByYear]);

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
        weldingEquipmentId: null,
        welderId: null,
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
        weldingEquipmentId: null,
        welderId: null,
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
              </div>
            ) : null}

            {calendarIsLoading && (
              <LoadingSpinner isFullScreenMode={false} paddingTop={"2vw"} />
            )}

            {mainCalendar?.days &&
              mainCalendar?.mainWorkingShifts &&
              !calendarIsLoading && (
                <CustomCalendar
                  loadMainCalendarByYear={loadMainCalendarByYear}
                  calendarDays={mainCalendar?.days}
                  mainWorkingShifts={mainCalendar?.mainWorkingShifts}
                  userRole={userRole}
                  calendarYear={mainCalendar.year}
                  currentDate={currentDate}
                  setCurrentDate={setCurrentDate}
                  updateWorkingShift={updateWorkingShift}
                  createDay={createDay}
                  deleteWorkingShift={deleteWorkingShift}
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
          currentYear={mainCalendar?.year}
          workingShifts={mainCalendar.mainWorkingShifts}
          createWorkingShift={createWorkingShift}
          deleteWorkingShift={deleteWorkingShift}
          updateWorkingShift={updateWorkingShift}
        />
      )}
    </>
  );
};
