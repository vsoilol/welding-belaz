import React, { useEffect, useState, useMemo } from "react";
import { tasksImage } from "assets/pics";
import { useQuery } from "hooks";

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
import { useWelderStore } from "store/welder";
import { useWeldingEquipmentStore } from "store/welding-equipment";
import "./styleCalendar.scss";

const AdminTools = ({
  onAddWorkDay,
  onAddWeekend,
  onEditShift,
  isEquipmentExists,
  onCalendarForEquipmentBasedOnMain,
}) => (
  <div className={styles.RowToolsBtns}>
    <button onClick={onAddWorkDay}>Добавить рабочий день</button>
    <button onClick={onAddWeekend}>Добавить выходной день</button>
    <button onClick={onEditShift}>Рабочие смены</button>

    {isEquipmentExists && (
      <div className={styles.Create}>
        <label>Создание календаря на основе общезаводского</label>
        <button onClick={onCalendarForEquipmentBasedOnMain}>Создать</button>
      </div>
    )}
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
    loadCalendarByEquipment,
    loadCalendarByWelder,
    createCalendarForEquipmentBasedOnMain,
  } = useCalendarStore();

  const { userRole } = useAuthStore();
  const {
    welder,
    getWelderById,
    isLoading: IsWelderLoading,
  } = useWelderStore();

  const {
    weldingEquipment,
    getWeldingEquipmentById,
    isLoading: IsWeldingEquipmentLoading,
  } = useWeldingEquipmentStore();

  const [isAddWorkDayModalOpen, setIsAddWorkDayModalOpen] = useState(false);
  const [isAddWeekendModalOpen, setIsAddWeekendModalOpen] = useState(false);
  const [isEditShiftModalOpen, setIsEditShiftModalOpen] = useState(false);

  const [currentDate, setCurrentDate] = useState(new Date());

  const searchParams = useQuery();
  const welderId = searchParams.get("welderId");
  const equipmentId = searchParams.get("equipmentId");

  const isAdditionalLoading = useMemo(
    () =>
      (welderId && IsWelderLoading) ||
      (equipmentId && IsWeldingEquipmentLoading),
    [IsWeldingEquipmentLoading, IsWelderLoading, welderId, equipmentId]
  );

  useEffect(() => {
    const currentDate = new Date().getUTCFullYear();

    if (welderId) {
      getWelderById(welderId);
      loadCalendarByWelder(welderId, currentDate);
      return;
    }

    if (equipmentId) {
      getWeldingEquipmentById(equipmentId);
      loadCalendarByEquipment(equipmentId, currentDate);
      return;
    }

    loadMainCalendarByYear(currentDate);
  }, [
    welderId,
    equipmentId,
    loadMainCalendarByYear,
    loadCalendarByEquipment,
    loadCalendarByWelder,
    getWelderById,
    getWeldingEquipmentById,
  ]);

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
        weldingEquipmentId: calendar?.weldingEquipmentId,
        welderId: calendar?.welderId,
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
        weldingEquipmentId: calendar?.weldingEquipmentId,
        welderId: calendar?.welderId,
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
          {isAdditionalLoading && (
            <LoadingSpinner isFullScreenMode={true} paddingTop={"2vw"} />
          )}

          {!isAdditionalLoading && (
            <div className="calendar-wrapper">
              {welderId && welder && (
                <h2>
                  Сварщик: {welder?.middleName} {welder?.firstName}{" "}
                  {welder?.lastName}
                </h2>
              )}

              {equipmentId && weldingEquipment && (
                <h2>
                  Оборудование: {weldingEquipment.name} №
                  {weldingEquipment.factoryNumber}
                </h2>
              )}

              {(userRole === "Admin" || userRole === "Master") && (
                <AdminTools
                  onAddWorkDay={() => setIsAddWorkDayModalOpen(true)}
                  onAddWeekend={() => setIsAddWeekendModalOpen(true)}
                  onEditShift={() => setIsEditShiftModalOpen(true)}
                  isEquipmentExists={equipmentId && weldingEquipment}
                  onCalendarForEquipmentBasedOnMain={() => {
                    createCalendarForEquipmentBasedOnMain(
                      equipmentId,
                      calendar?.year
                    );
                  }}
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

              {calendar && (
                <>
                  <AddWorkingDayModal
                    isOpen={isAddWorkDayModalOpen}
                    toggleModal={setIsAddWorkDayModalOpen}
                    onWorkingDaySubmit={handleAddOrUpdateWorkingDay}
                  />

                  <AddWeekendModal
                    isOpen={isAddWeekendModalOpen}
                    toggleModal={setIsAddWeekendModalOpen}
                    onWeekendDaySubmit={handleAddWeekendDay}
                  />

                  <EditWorkingShiftModal
                    isOpen={isEditShiftModalOpen}
                    toggleModal={setIsEditShiftModalOpen}
                  />
                </>
              )}
            </div>
          )}
        </div>
      </div>
    </>
  );
};
