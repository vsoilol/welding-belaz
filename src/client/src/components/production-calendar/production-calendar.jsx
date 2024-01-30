import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { tasksImage } from "assets/pics";

import { LoadingSpinner, ToolTip } from "components/shared";
import {
  AddWeekendModal,
  AddWorkingDayModal,
  EditWorkingShiftModal,
} from "./modals";

import styles from "./styles.module.scss";

import { CustomCalendar } from "./custom-calendar";
import { useCalendarStore } from "store/calendar";
import { useAuthStore } from "store/auth";
import "./styleCalendar.scss";

const AdminTools = ({ onAddWorkDay, onAddWeekend, onEditShift }) => (
  <div className={styles.RowToolsBtns}>
    <button onClick={onAddWorkDay}>Добавить рабочий день</button>
    <button onClick={onAddWeekend}>Добавить выходной день</button>
    <button onClick={onEditShift}>Рабочие смены</button>
  </div>
);

export const ProductionCalendar = () => {
  const {
    calendar,
    isLoading,
    loadMainCalendarByYear,
    updateWorkingDayWithWorkingShift,
    createDay,
    updateDay,
  } = useCalendarStore();

  const { userRole } = useAuthStore();

  const [isAddWorkDayModalOpen, setIsAddWorkDayModalOpen] = useState(false);
  const [isAddWeekendModalOpen, setIsAddWeekendModalOpen] = useState(false);
  const [isEditShiftModalOpen, setIsEditShiftModalOpen] = useState(false);

  const [currentDate, setCurrentDate] = useState(new Date());

  const { id } = useParams();

  useEffect(() => {
    console.log("Param id", id);
  }, [id]);

  useEffect(() => {
    const currentDate = new Date().getUTCFullYear();
    loadMainCalendarByYear(currentDate);
  }, [loadMainCalendarByYear]);

  const handleAddOrUpdateWorkingDay = (data) => {
    const { workingShiftId, workingDay } = data;

    const workingShift = calendar.mainWorkingShifts.find(
      (shift) => shift.id === workingShiftId
    );

    const parsedDate = new Date(workingDay);
    const dayNumber = parsedDate.getDate();
    const monthNumber = parsedDate.getMonth() + 1;
    const year = parsedDate.getFullYear();

    const existingDay = calendar.days.find(
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

  const handleAddWeekendDay = ({ dayDate }) => {
    const parsedDate = new Date(dayDate);
    const dayNumber = parsedDate.getDate();
    const monthNumber = parsedDate.getMonth() + 1;
    const year = parsedDate.getFullYear();

    const existingDay = calendar.days.find(
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
            {(userRole === "Admin" || userRole === "Master") && (
              <AdminTools
                onAddWorkDay={() => setIsAddWorkDayModalOpen(true)}
                onAddWeekend={() => setIsAddWeekendModalOpen(true)}
                onEditShift={() => setIsEditShiftModalOpen(true)}
              />
            )}

            {isLoading && (
              <LoadingSpinner isFullScreenMode={false} paddingTop={"2vw"} />
            )}

            {calendar?.days && calendar?.mainWorkingShifts && !isLoading && (
              <CustomCalendar
                currentDate={currentDate}
                setCurrentDate={setCurrentDate}
              />
            )}
          </div>
        </div>
      </div>

      {calendar?.year && (
        <AddWorkingDayModal
          isOpen={isAddWorkDayModalOpen}
          toggleModal={setIsAddWorkDayModalOpen}
          onWorkingDaySubmit={handleAddOrUpdateWorkingDay}
        />
      )}

      {calendar?.year && (
        <AddWeekendModal
          isOpen={isAddWeekendModalOpen}
          toggleModal={setIsAddWeekendModalOpen}
          onWeekendDaySubmit={handleAddWeekendDay}
        />
      )}

      {calendar?.year && (
        <EditWorkingShiftModal
          isOpen={isEditShiftModalOpen}
          toggleModal={setIsEditShiftModalOpen}
        />
      )}
    </>
  );
};
