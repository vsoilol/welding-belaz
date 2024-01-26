import React, { useEffect, useState } from "react";
import { Formik } from "formik";

import { tasksImage } from "assets/pics";

import {
  Button,
  Input,
  LoadingSpinner,
  ModalWindow,
  Select,
  Spinner,
  ToolTip,
} from "components/shared";
import { AddWorkingDayModal } from "./modals";

import api from "services/api";
import styles from "./styles.module.scss";

import { Audio } from "react-loader-spinner";

import Calendars from "./Calendar";
import "./styleCalendar.scss";

export const ProductionCalendar = ({
  calendar,
  userRole,
  loadMainCalendarByYear,
  mainCalendar,
  calendarIsLoading,
}) => {
  const [isModalAddWorkDayOpen, setIsModalAddWorkDayOpen] = useState(false);
  const [isModalAddWeekendOpen, setIsModalAddWeekendOpen] = useState(false);
  const [isModalAddShiftOpen, setIsModalAddShiftOpen] = useState(false);

  const [modalData, setModalData] = useState(null);

  const [valueWorkingShift, setValueWorkingShift] = useState([]);

  const [workingDays, setWorkingDays] = useState([]);
  const [workingShifts, setWorkingShifts] = useState([]);

  useEffect(() => {
    console.log(calendarIsLoading);
  }, [calendarIsLoading]);

  const initialValues = {
    shiftDay: modalData?.shiftDay ?? "",
    calendarId: calendar?.id ?? "",
    workDay: modalData?.workDay ?? "",
  };

  useEffect(() => {
    const currentDate = new Date().getUTCFullYear();
    loadMainCalendarByYear(2023);
  }, [loadMainCalendarByYear]);

  useEffect(() => {
    if (mainCalendar !== null) {
      setWorkingDays(mainCalendar);
      setWorkingShifts(mainCalendar.mainWorkingShifts);
    }
  }, [mainCalendar]);

  function loadCalendarYear() {
    const currentDate = new Date().getUTCFullYear();
    api
      .get(`/calendar/main/${currentDate}`)
      .then((res) => {
        setWorkingDays(res.data);
        setWorkingShifts(res.data.mainWorkingShifts);
      })
      .catch((error) => {
        // Обработка ошибки при загрузке календаря
      });
  }

  let WorkingShiftOptions =
    workingShifts.length > 0
      ? workingShifts.map((item) => {
          return {
            value: item.number,
            label: `Смена ${item.number}`,
          };
        })
      : [];

  // Добавляем рабочий день, рабочие смены
  async function SendData(params) {
    let smena = workingDays.mainWorkingShifts.find(
      (elem) => elem.number === valueWorkingShift
    );

    const data = {
      monthNumber: new Date(params.workDay).getMonth() + 1,
      number: new Date(params.workDay).getDate(),
      isWorkingDay: true,
      year: new Date(params.workDay).getFullYear(),
    };

    const existingDay = workingDays.days.find(
      (day) =>
        day.number === new Date(params.workDay).getDate() &&
        day.monthNumber === new Date(params.workDay).getMonth() + 1
    );

    if (existingDay) {
      const shiftExists = existingDay.workingShifts.some(
        (shift) => shift.number === smena.number
      );

      if (!shiftExists) {
        const dayId = existingDay.id;
        const existingShifts = existingDay.workingShifts;
        await api.remove(`day/${dayId}`);
        data.workingShifts = [
          ...existingShifts,
          {
            id: smena.id,
            number: smena.number,
            shiftStart: smena.shiftStart,
            shiftEnd: smena.shiftEnd,
            breakStart: smena.breakStart,
            breakEnd: smena.breakEnd,
          },
        ];
      } else {
        data.workingShifts = existingDay.workingShifts;
      }
    } else {
      data.workingShifts = [
        {
          id: smena.id,
          number: smena.number,
          shiftStart: smena.shiftStart,
          shiftEnd: smena.shiftEnd,
          breakStart: smena.breakStart,
          breakEnd: smena.breakEnd,
        },
      ];
    }

    loadCalendarYear();
  }

  async function sendWekend(params) {
    const dayId = workingDays?.days
      ? workingDays?.days.find(
          (day) =>
            day?.number == new Date(params?.workDay).getDate() &&
            day?.monthNumber == new Date(params?.workDay).getMonth() + 1
        )?.id
      : workingDays?.find(
          (day) =>
            day?.number == new Date(params?.workDay).getDate() &&
            day?.monthNumber == new Date(params?.workDay).getMonth() + 1
        )?.id;

    if (dayId) {
      await api.remove(`day/${dayId}`);
    }

    const data = {
      monthNumber: new Date(params.workDay).getMonth() + 1,
      number: new Date(params.workDay).getDate(),
      isWorkingDay: false,
      year: new Date(params.workDay).getFullYear(),
      weldingEquipmentId: null,
      welderId: null,
      workingShifts: null,
    };

    await api.post("day", data);
    loadCalendarYear();
  }

  function SetValOpenModalAddWorkDay() {
    setIsModalAddWorkDayOpen(true);
  }

  const [valuetypeToolsShift, settypeToolsShift] = useState(-1);

  const typeToolsOptions = [
    { id: 1, name: "Добавить смену" },
    { id: 2, name: "Удалить смену" },
    { id: 3, name: "Редактировать смену" },
  ].map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });

  function ajaxAddShift(variables) {
    if (valuetypeToolsShift === 1) {
      const data = {
        number: Number(variables.shiftNumb),
        shiftStart: variables.shiftStart,
        shiftEnd: variables.shiftEnd,
        breakStart: variables.breakStart,
        breakEnd: variables.breakEnd,
        year: 2023,
        dayId: null,
      };

      api.post("/workingShift", data).then(() => {
        loadCalendarYear();
      });
    }

    if (valuetypeToolsShift === 2) {
      let smenaId = workingDays.mainWorkingShifts.find(
        (elem) => elem.number === valueWorkingShift
      ).id;
      api.remove(`/workingShift/${smenaId}`).then(() => {
        loadCalendarYear();
      });
    }

    if (valuetypeToolsShift === 3) {
      const data = {
        id: workingDays.mainWorkingShifts.find(
          (elem) => elem.number === valueWorkingShift
        ).id,
        number: Number(variables.shiftNumb),
        shiftStart: variables.shiftStart,
        shiftEnd: variables.shiftEnd,
        breakStart: variables.breakStart,
        breakEnd: variables.breakEnd,
      };
      api.put("/workingShift", data).then(() => {
        loadCalendarYear();
      });
    }
  }

  function addWorkingDay(data) {
    console.log(data);
  }

  return (
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
              <button onClick={SetValOpenModalAddWorkDay}>
                Добавить рабочий день
              </button>
              <button onClick={setIsModalAddWeekendOpen}>
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

          {workingDays.days && !calendarIsLoading && (
            <Calendars
              loadCalendarYear={loadCalendarYear}
              valueWorkDays={workingDays.days}
              WorkingShiftOptions={workingShifts}
              userRole={userRole}
            />
          )}
        </div>

        <AddWorkingDayModal
          isOpen={isModalAddWorkDayOpen}
          toggleModal={setIsModalAddWorkDayOpen}
          calendarId={mainCalendar?.id ?? ""}
          workingShifts={workingShifts}
          onWorkingDaySubmit={addWorkingDay}
        />

        {/*Добавить рабочий день*/}
        {/* <ModalWindow
          isOpen={isModalAddWorkDayOpen}
          headerText="Добавить рабочий день"
          setIsOpen={(state) => {
            setIsModalAddWorkDayOpen(state);
            setModalData(null);
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setIsModalAddWorkDayOpen(false);
              setModalData(null);
              SendData(variables);
            }}
          >
            {({
              handleSubmit,
              handleChange,
              values,
              setFieldValue,
              handleBlur,
            }) => (
              <form onSubmit={handleSubmit}>
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    width="200"
                    style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                    value={values.workDay}
                    name="workDay"
                    placeholder="Дата рабочего дня"
                    type="text"
                    onFocus={(e) => {
                      e.currentTarget.type = "date";
                    }}
                    autoComplete="off"
                    onBlur={handleBlur}
                  />
                </div>

                <div className={styles.row}>
                  <Select
                    name="valueWorkingShift"
                    value={valueWorkingShift}
                    width="380px"
                    placeholder="Смена"
                    onChange={(event) => {
                      setValueWorkingShift(event.value);
                    }}
                    options={WorkingShiftOptions}
                  />
                </div>
                <div className={styles.row}>
                  <Button
                    disabled={values.workDay == "" || valueWorkingShift == ""}
                    type="submit"
                  >
                    {modalData ? "Сохранить" : "Создать"}
                  </Button>
                </div>
              </form>
            )}
          </Formik>
        </ModalWindow> */}

        {/*Добавить выходной день*/}
        <ModalWindow
          isOpen={isModalAddWeekendOpen}
          headerText="Добавить выходной день"
          setIsOpen={(state) => {
            setIsModalAddWeekendOpen(state);
            setModalData(null);
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setIsModalAddWeekendOpen(false);
              setModalData(null);
              sendWekend(variables);
            }}
          >
            {({
              handleSubmit,
              handleChange,
              values,
              setFieldValue,
              handleBlur,
            }) => (
              <form onSubmit={handleSubmit}>
                <div className={styles.row}>
                  <Input
                    onChange={(e) => {
                      handleChange(e);
                    }}
                    width="200"
                    style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                    value={values.workDay}
                    name="workDay"
                    placeholder="Дата  дня"
                    type="text"
                    onFocus={(e) => {
                      e.currentTarget.type = "date";
                    }}
                    autoComplete="off"
                    onBlur={handleBlur}
                  />
                </div>

                <div className={styles.row}>
                  <Button disabled={values.workDay == ""} type="submit">
                    {modalData ? "Сохранить" : "Создать"}
                  </Button>
                </div>
              </form>
            )}
          </Formik>
        </ModalWindow>

        {/*Добавить рабочую смену*/}
        <ModalWindow
          isOpen={isModalAddShiftOpen}
          headerText="Добавить рабочую смену"
          setIsOpen={(state) => {
            setIsModalAddShiftOpen(state);
            setModalData(null);
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setIsModalAddShiftOpen(false);
              setModalData(null);
              ajaxAddShift(variables);
            }}
          >
            {({
              handleSubmit,
              handleChange,
              values,
              setFieldValue,
              handleBlur,
            }) => (
              <form onSubmit={handleSubmit}>
                <div className={styles.rowTool}>
                  <label>Выберите действие</label>
                  <br></br>
                  <Select
                    name="selectRole"
                    width="380px"
                    value={valuetypeToolsShift}
                    placeholder="Действие"
                    onChange={(event) => {
                      settypeToolsShift(event.value);
                    }}
                    options={typeToolsOptions}
                  />
                </div>
                {valuetypeToolsShift === 1 ? (
                  <div>
                    <div className={styles.row}>
                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        style={{
                          width: 380,
                          height: 40,
                          padding: "0 20px 0 30px",
                        }}
                        value={values.shiftNumb}
                        name="shiftNumb"
                        placeholder="Номер смены"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />
                    </div>
                    <div className={styles.row}>
                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        width="200"
                        style={{ height: 40, padding: "0 20px 0 30px" }}
                        value={values.shiftStart}
                        name="shiftStart"
                        placeholder="Начало работы"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />

                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        width="200"
                        style={{ height: 40, padding: "0 20px 0 30px" }}
                        value={values.shiftEnd}
                        name="shiftEnd"
                        placeholder="Конец работы"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />
                    </div>
                    <div className={styles.row}>
                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        width="200"
                        style={{ height: 40, padding: "0 20px 0 30px" }}
                        value={values.breakStart}
                        name="breakStart"
                        placeholder="Начало перерыва"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />

                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        width="200"
                        style={{ height: 40, padding: "0 20px 0 30px" }}
                        value={values.breakEnd}
                        name="breakEnd"
                        placeholder="Конец перерыва"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />
                    </div>
                    <div className={styles.row}>
                      <Button
                        disabled={
                          values.shiftNumb == "" ||
                          values.shiftStart == "" ||
                          values.shiftEnd == "" ||
                          values.breakStart == "" ||
                          values.breakEnd == ""
                        }
                        type="submit"
                      >
                        {modalData ? "Сохранить" : "Создать"}
                      </Button>
                    </div>
                  </div>
                ) : null}

                {valuetypeToolsShift === 2 ? (
                  <div>
                    <div className={styles.row}>
                      <Select
                        name="valueWorkingShift"
                        value={valueWorkingShift}
                        width="380px"
                        placeholder="Смена"
                        onChange={(event) => {
                          setValueWorkingShift(event.value);
                        }}
                        options={WorkingShiftOptions}
                      />
                    </div>
                    <div className={styles.row}>
                      <Button type="submit">Удалить</Button>
                    </div>
                  </div>
                ) : null}

                {valuetypeToolsShift === 3 ? (
                  <div>
                    <div className={styles.row}>
                      <Select
                        name="valueWorkingShift"
                        value={valueWorkingShift}
                        width="380px"
                        placeholder="Смена"
                        onChange={(event) => {
                          setValueWorkingShift(event.value);
                        }}
                        options={WorkingShiftOptions}
                      />
                    </div>
                    <div className={styles.row}>
                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        style={{
                          width: 380,
                          height: 40,
                          padding: "0 20px 0 30px",
                        }}
                        value={values.shiftNumb}
                        name="shiftNumb"
                        placeholder="Номер смены"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />
                    </div>
                    <div className={styles.row}>
                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        width="200"
                        style={{ height: 40, padding: "0 20px 0 30px" }}
                        value={values.shiftStart}
                        name="shiftStart"
                        placeholder="Начало работы"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />

                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        width="200"
                        style={{ height: 40, padding: "0 20px 0 30px" }}
                        value={values.shiftEnd}
                        name="shiftEnd"
                        placeholder="Конец работы"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />
                    </div>
                    <div className={styles.row}>
                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        width="200"
                        style={{ height: 40, padding: "0 20px 0 30px" }}
                        value={values.breakStart}
                        name="breakStart"
                        placeholder="Начало перерыва"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />

                      <Input
                        onChange={(e) => {
                          handleChange(e);
                        }}
                        width="200"
                        style={{ height: 40, padding: "0 20px 0 30px" }}
                        value={values.breakEnd}
                        name="breakEnd"
                        placeholder="Конец перерыва"
                        onBlur={handleBlur}
                        autoComplete="off"
                      />
                    </div>
                    <div className={styles.row}>
                      <Button
                        disabled={
                          values.shiftNumb == "" ||
                          values.shiftStart == "" ||
                          values.shiftEnd == "" ||
                          values.breakStart == "" ||
                          values.breakEnd == ""
                        }
                        type="submit"
                      >
                        Сохранить
                      </Button>
                    </div>
                  </div>
                ) : null}
              </form>
            )}
          </Formik>
        </ModalWindow>
      </div>
    </div>
  );
};
