import React from "react";
import { Formik, Form } from "formik";

import {
  Button,
  CustomFormikTextInput,
  CustomFormikField,
} from "components/shared";
import { useCalendarStore } from "store/calendar";
import { useAuthStore } from "store/auth";
import { validationSchema } from "./validation-schema";
import styles from "./edit-day-working-shift-modal.module.scss";

export const EditDayWorkingShiftModal = ({ dayEvent, setDayEvent }) => {
  const { userRole } = useAuthStore();
  const { calendar, updateWorkingShift, deleteWorkingShift, createDay } =
    useCalendarStore();

  function formatTime(date) {
    const hours = date.getHours().toString().padStart(2, "0");
    const minutes = date.getMinutes().toString().padStart(2, "0");
    return `${hours}:${minutes}`;
  }

  const initialFormValues = {
    shiftStart: dayEvent.start ? formatTime(dayEvent.start) : "",
    shiftEnd: dayEvent.end ? formatTime(dayEvent.end) : "",
    breakStart: dayEvent.breakStart ? formatTime(dayEvent.breakStart) : "",
    breakEnd: dayEvent.breakEnd ? formatTime(dayEvent.breakEnd) : "",
  };

  const dateToLocalTimeString = (date) => {
    return date.toLocaleTimeString([], {
      year: "numeric",
      month: "numeric",
      day: "numeric",
      hour: "2-digit",
      minute: "2-digit",
    });
  };

  const breakTimeRange = () => {
    return (
      <div className={styles.breakTimeInfo}>
        <span>Перерыв:</span>
        <span>
          {dateToLocalTimeString(dayEvent.breakStart)}
          {" - "}
          {dateToLocalTimeString(dayEvent.breakEnd)}
        </span>
      </div>
    );
  };

  const removeDay = () => {
    const { workingShiftNumber, start } = dayEvent;

    const parsedDate = new Date(start);
    const dayNumber = parsedDate.getDate();
    const monthNumber = parsedDate.getMonth() + 1;
    const year = parsedDate.getFullYear();

    const existingDay = calendar?.days.find(
      (day) => day.number === dayNumber && day.monthNumber === monthNumber
    );

    if (!existingDay) {
      const filteredWorkingShifts = calendar?.mainWorkingShifts.filter(
        (shift) => shift.number !== workingShiftNumber
      );

      const day = {
        monthNumber: monthNumber,
        number: dayNumber,
        isWorkingDay: true,
        year: year,
        weldingEquipmentId: null,
        welderId: null,
        workingShifts: filteredWorkingShifts,
      };

      createDay(day);
      return;
    }

    const workingShiftToDelete = existingDay.workingShifts.find(
      (elem) => elem.number === workingShiftNumber
    );

    if (workingShiftToDelete) {
      deleteWorkingShift(workingShiftToDelete.id);
    }
  };

  const handleFormSubmit = async (values, { setSubmitting }) => {
    try {
      const workingShift = {
        ...values,
        id: dayEvent.id,
        number: dayEvent.workingShiftNumber,
      };

      updateWorkingShift(workingShift);
      setDayEvent(null);
    } catch (error) {
      console.error("Error submitting form:", error);
    }

    setSubmitting(false);
  };

  return (
    <div>
      <div className={styles.hints}>
        <h2>{dayEvent.title}</h2>
        <p>Начало: {dateToLocalTimeString(dayEvent.start)}</p>
        <p>Конец: {dateToLocalTimeString(dayEvent.end)}</p>

        {dayEvent.breakStart && dayEvent.breakEnd && breakTimeRange()}

        {dayEvent.isWorkingDay &&
          (userRole === "Admin" || userRole === "Master") && (
            <div>
              <p className={styles.par}>Редактировать смену:</p>
              <Formik
                initialValues={initialFormValues}
                enableReinitialize
                onSubmit={handleFormSubmit}
                validationSchema={validationSchema}
              >
                {({ isSubmitting, isValid }) => (
                  <Form>
                    <div className={styles.rowWithoutMargin}>
                      <CustomFormikField name="shiftStart">
                        <CustomFormikTextInput
                          width="200"
                          style={{ height: 40, padding: "0 20px 0 30px" }}
                          placeholder="Начало работы"
                        />
                      </CustomFormikField>

                      <CustomFormikField name="shiftEnd">
                        <CustomFormikTextInput
                          width="200"
                          style={{ height: 40, padding: "0 20px 0 30px" }}
                          placeholder="Конец работы"
                        />
                      </CustomFormikField>
                    </div>

                    <p className={styles.par}>Перерыв:</p>
                    <div className={styles.rowWithoutMargin}>
                      <CustomFormikField name="breakStart">
                        <CustomFormikTextInput
                          width="200"
                          style={{ height: 40, padding: "0 20px 0 30px" }}
                          placeholder="Начало перерыва"
                        />
                      </CustomFormikField>

                      <CustomFormikField name="breakEnd">
                        <CustomFormikTextInput
                          width="200"
                          style={{ height: 40, padding: "0 20px 0 30px" }}
                          placeholder="Конец перерыва"
                        />
                      </CustomFormikField>
                    </div>

                    <div className={styles.buttons}>
                      <Button
                        className={styles.button}
                        disabled={!isValid || isSubmitting}
                        type="submit"
                      >
                        Изменить
                      </Button>

                      <Button
                        onClick={() => {
                          removeDay();
                        }}
                      >
                        Удалить
                      </Button>
                    </div>
                  </Form>
                )}
              </Formik>
            </div>
          )}
      </div>
      <div
        className={styles.hintsBg}
        onClick={() => {
          setDayEvent(null);
        }}
      ></div>
    </div>
  );
};
