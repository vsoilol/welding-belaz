import SaveIcon from "@material-ui/icons/Save";
import { tasksImage } from "assets/pics";
import Button from "components/shared/Button";
import Input from "components/shared/Input";
import ModalWindow from "components/shared/ModalWindow";
import Select from "components/shared/Select";
import { Table } from "components/shared/Table";
import ToolTip from "components/shared/ToolTip";
import { Formik } from "formik";
import React, { useEffect, useState } from "react";
import api from "services/api";
import styles from "./styles.module.css";
import errorActions from "store/error/actions";
import { useDispatch } from "react-redux";


import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import Calendars from "./Calendar";
import "./styleCalendar.css";
import imgSmena from "assets/icons/Smena.png";
import imgEdit from "assets/icons/pen.png";
const {
  Creators: { setError },
} = errorActions;

const dateOptions = {
  day: "numeric",
  month: "short",
  year: "numeric",
};

export const Production_calendar = ({
  calendar,
  days,

  executors,
  loadExecutors,

  equipment,
  loadEquipment,
  userRole,

  ///Calendar
  /* loadCalendaryear, */
  addCalendarmain,
  editEditcalendar,
  addCalendarwelder,
  loadCalendarwelder,
  addCalendarequipment,
  loadCalendarequipment,
  ///WorkingShift
  addShift,
  editShift,
  ///Day
  /*  loadDayByWelder,
   loadDayByEquipment, */
  addDay,
  editDay,

}) => {
  const [isModalAddWorkDayOpen, setIsModalAddWorkDayOpen] = useState(false);
  const [isModalAddWekend, setValOpenModalAddWekend] = useState(false);


  const [isModalAddWorkingShift, setModalAddWorkingShift] = useState(false);
  const [isModalSellWorkingShift, setModalDellWorkingShift] = useState(false);



  const [isModalEditWorkDayOpen, setIsModalEditWorkDayOpen] = useState(false);
  const [isModalAddShift, setIsModalAddShift] = useState(false);



  const [modalData, setModalData] = useState(null);

  const [valueWorkingShift, setValueWorkingShift] = useState([]);




  let date = new Date().getUTCFullYear()

  const initialValues = {
    shiftDay: modalData?.shiftDay ?? "",
    calendarId: calendar?.id ?? "",
    workDay: modalData?.workDay ?? "",
  };



  const requiredKeys = [
    "object",
    "sector",
    "weldingConnectionName",
    "technicalControllerId",
    "weldingElectrodes",
    "generalMaterial",
    "weldingWire",
    "instructionId",
  ];


  const [valueWorkDays, setvalueWorkDays] = useState([]);
  const [valueWorkShift, setvalueWorkShift] = useState([]);


  useEffect(() => {
    loadExecutors();
    loadEquipment();
    loadCalendarYear();
  }, [loadExecutors, loadEquipment]);

  function loadCalendarYear() {
    const currentDate = new Date().getUTCFullYear();
    api
      .get(`/calendar/main/${currentDate}`)
      .then((res) => {
        setvalueWorkDays(res.data);
        setvalueWorkShift(res.data.mainWorkingShifts);
      })
      .catch((error) => {
        // Обработка ошибки при загрузке календаря
      });
  }

  const [valueObj, setValueObj] = useState(0);
  const [valueEquipment, setValueEquipment] = useState(0);
  const [valueExecutors, setValueExecutors] = useState(0);

  const [ShiftToolNumb, setShiftToolNumb] = useState(0);




  const ObjSlects = [
    {
      id: 1,
      name: "Оборудование "
    },
    {
      id: 2,
      name: "Сотрудник"
    }
  ]

  const ObjSlectsisWorkingDay = [
    {
      bool: true,
      name: "Рабочий день"
    },
    {
      bool: false,
      name: "Выходной"
    }
  ]
  const optObs = ObjSlects?.map((item) => {
    return {
      value: item.id,
      label: item.name,
    };
  });
  const executorsOptions = executors?.map((item) => {
    return {
      value: item.id,
      label: `${item.middleName} ${item.firstName} ${item.lastName}`,
    };
  });
  const equipmentOptions = equipment[0]?.map((item) => {
    return {
      value: item.id,
      label: `${item.name} ${item.factoryNumber}  `,
    };
  });


  const WorkingDayOptions = ObjSlectsisWorkingDay?.map((item) => {
    return {
      value: item.bool,
      label: item.name,
    };
  });


  let WorkingShiftOptions = valueWorkShift.length > 0 ? valueWorkShift.map((item) => {
    return {
      value: item.number,
      label: `Смена ${item.number}`,
    };
  })
    : [];



  function SendData(params) {
    let smena = valueWorkDays.mainWorkingShifts.find(elem => elem.number === valueWorkingShift)
    const data = {
      "monthNumber": new Date(params.workDay).getMonth(),
      "number": new Date(params.workDay).getDate(),
      "isWorkingDay": true,
      "year": new Date(params.workDay).getFullYear(),
      "weldingEquipmentId": valueObj === 1 ? valueEquipment : null,
      "welderId": valueObj === 2 ? valueExecutors : null,
      "workingShifts": [
        {
          "number": smena.number,
          "shiftStart": smena.shiftStart,
          "shiftEnd": smena.shiftEnd,
          "breakStart": smena.breakStart,
          "breakEnd": smena.breakEnd,
        }
      ]
    }
    api.post("day", data).then(() => {
      loadCalendarYear()
    })
  }


  function sendWekend(params) {
    const data = {
      "monthNumber": new Date(params.workDay).getMonth() + 1,
      "number": new Date(params.workDay).getDate(),
      "isWorkingDay": false,
      "year": new Date(params.workDay).getFullYear(),
      "weldingEquipmentId": null,
      "welderId": null,
      "workingShifts": null
    }
    api.post("day", data).then(() => { loadCalendarYear() })
  }



  function SetValOpenModalAddWorkDay() {
    setIsModalAddWorkDayOpen(true)
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
        "number": Number(variables.shiftNumb),
        "shiftStart": variables.shiftStart,
        "shiftEnd": variables.shiftEnd,
        "breakStart": variables.breakStart,
        "breakEnd": variables.breakEnd,
        "year": 2023,
        "dayId": null
      }
      api.post("/workingShift", data).then(() => {
        loadCalendarYear()
      })
    }

    if (valuetypeToolsShift === 2) {
      let smenaId = valueWorkDays.mainWorkingShifts.find(elem => elem.number === valueWorkingShift).id
      api.remove(`/workingShift/${smenaId}`).then(() => {
        loadCalendarYear()
      })
    }

    if (valuetypeToolsShift === 3) {
      const data = {
        "id": valueWorkDays.mainWorkingShifts.find(elem => elem.number === valueWorkingShift).id,
        "number": Number(variables.shiftNumb),
        "shiftStart": variables.shiftStart,
        "shiftEnd": variables.shiftEnd,
        "breakStart": variables.breakStart,
        "breakEnd": variables.breakEnd,
      }
      api.put("/workingShift", data).then(() => {
        loadCalendarYear()
      })
    }
  }




  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Производственный календарь"
        toolTipText="Здесь Вы можете просмотреть производственный календарь "
        src={tasksImage}
      />

      <div className={styles.tableWrapper}>



        <div class="calendar-wrapper">

          {userRole === "Admin" || userRole === "Master"
            ? (
              <div className={styles.RowToolsBtns}>
                <button onClick={SetValOpenModalAddWorkDay}>Добавить рабочий день</button>
                <button onClick={setValOpenModalAddWekend}>Добавить выходной день</button>
                <button onClick={() => { setIsModalAddShift(true); }}>Рабочие смены</button>
              </div>
            )
            : null
          }

          {valueWorkDays.days
            ? (
              <Calendars
                valueWorkDays={valueWorkDays.days}
                WorkingShiftOptions={valueWorkShift}
              />
            )
            : null
          }

        </div>




        {/*Добавить рабочий день*/}
        <ModalWindow
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
              SendData(variables)
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
                    autocomplete="off"
                    onBlur={handleBlur}
                  />
                </div>

                <div className={styles.row}>
                  <Select
                    name="valueObj"
                    value={valueObj}
                    width="380px"
                    placeholder="Сварщик или обородование"
                    onChange={(event) => {
                      setValueObj(event.value)
                    }}
                    options={optObs}
                  />
                </div>


                {valueObj === 1
                  ? (
                    <div className={styles.row}>
                      <Select
                        name="valueEquipment"
                        value={valueEquipment}
                        width="380px"
                        placeholder="Обородование"
                        onChange={(event) => {
                          setValueEquipment(event.value)
                        }}
                        options={equipmentOptions}
                      />
                    </div>

                  )
                  : (
                    <div className={styles.row}>
                      <Select
                        name="valueExecutors"
                        value={valueExecutors}
                        width="380px"
                        placeholder="Сотрудники"
                        onChange={(event) => {
                          setValueExecutors(event.value)
                        }}
                        options={executorsOptions}
                      />
                    </div>
                  )
                }



                <div className={styles.row}>
                  <Select
                    name="valueWorkingShift"
                    value={valueWorkingShift}
                    width="380px"
                    placeholder="Смена"
                    onChange={(event) => {
                      setValueWorkingShift(event.value)
                    }}
                    options={WorkingShiftOptions}
                  />
                </div>
                <div className={styles.row}>
                  <Button
                    disabled={
                      values.workDay == "" || valueWorkingShift == ""
                    }
                    type="submit"
                  >
                    {modalData ? "Сохранить" : "Создать"}
                  </Button>
                </div>
              </form>
            )}
          </Formik>
        </ModalWindow>

        {/*Добавить выходной день*/}
        <ModalWindow
          isOpen={isModalAddWekend}
          headerText="Добавить выходной день"
          setIsOpen={(state) => {
            setValOpenModalAddWekend(state);
            setModalData(null);
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setValOpenModalAddWekend(false);
              setModalData(null);
              sendWekend(variables)
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
                    autocomplete="off"
                    onBlur={handleBlur}
                  />
                </div>


                <div className={styles.row}>
                  <Button
                    disabled={
                      values.workDay == ""
                    }
                    type="submit"
                  >
                    {modalData ? "Сохранить" : "Создать"}
                  </Button>
                </div>
              </form>
            )}
          </Formik>
        </ModalWindow>


        {/*Добавить рабочую смену*/}
        <ModalWindow
          isOpen={isModalAddShift}
          headerText="Добавить рабочую смену"
          setIsOpen={(state) => {
            setIsModalAddShift(state);
            setModalData(null);
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setIsModalAddShift(false);
              setModalData(null);
              ajaxAddShift(variables)
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
                    onChange={(event) => { settypeToolsShift(event.value); }}
                    options={typeToolsOptions}
                  />
                </div>
                {valuetypeToolsShift === 1
                  ? (
                    <div>
                      <div className={styles.row}>
                        <Input
                          onChange={(e) => {
                            handleChange(e);
                          }}
                          style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                          value={values.shiftNumb}
                          name="shiftNumb"
                          placeholder="Номер смены"
                          onBlur={handleBlur}
                          autocomplete="off"
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
                          autocomplete="off"
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
                          autocomplete="off"
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
                          autocomplete="off"
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
                          autocomplete="off"
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
                  )
                  : null
                }

                {valuetypeToolsShift === 2
                  ? (
                    <div>
                      <div className={styles.row}>
                        <Select
                          name="valueWorkingShift"
                          value={valueWorkingShift}
                          width="380px"
                          placeholder="Смена"
                          onChange={(event) => {
                            setValueWorkingShift(event.value)
                          }}
                          options={WorkingShiftOptions}
                        />
                      </div>
                      <div className={styles.row}>
                        <Button
                          type="submit"
                        >
                          Удалить
                        </Button>
                      </div>
                    </div>
                  )
                  : null
                }

                {valuetypeToolsShift === 3
                  ? (
                    <div>
                      <div className={styles.row}>
                        <Select
                          name="valueWorkingShift"
                          value={valueWorkingShift}
                          width="380px"
                          placeholder="Смена"
                          onChange={(event) => {
                            setValueWorkingShift(event.value)
                          }}
                          options={WorkingShiftOptions}
                        />
                      </div>
                      <div className={styles.row}>
                        <Input
                          onChange={(e) => {
                            handleChange(e);
                          }}
                          style={{ width: 380, height: 40, padding: "0 20px 0 30px" }}
                          value={values.shiftNumb}
                          name="shiftNumb"
                          placeholder="Номер смены"
                          onBlur={handleBlur}
                          autocomplete="off"
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
                          autocomplete="off"
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
                          autocomplete="off"
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
                          autocomplete="off"
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
                          autocomplete="off"
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
                  )
                  :null
                }
              

              </form>
            )}
          </Formik>
        </ModalWindow>


      </div>
    </div>
  );
};