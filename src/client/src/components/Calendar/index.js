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
import Calendars from "../Calendar/Calendar";
import "../Calendar/styleCalendar.css";
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

export const Calendar = ({
  calendar,
  days,

  executors,
  loadExecutors,
  userRole,

  equipment,
  loadEquipment,

  ///Calendar
  loadCalendaryear,
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
  const [isModalEditWorkDayOpen, setIsModalEditWorkDayOpen] = useState(false);
  const [isModalAddShift, setIsModalAddShift] = useState(false);

  const [isModalAddWekend, setValOpenModalAddWekend] = useState(false);


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

  const executorObj = JSON.parse(window.localStorage.getItem("executor"))
  const equipmentObj = JSON.parse(window.localStorage.getItem("equipment"))

  useEffect(() => {
    loadCalendaryear(date);
    /* loadExecutors();
    loadEquipment(); */
    executorObj ? loadDayByWelder(executorObj.id) : loadDayByEquipment(equipmentObj.id)
  }, [loadCalendaryear]);


  function loadDayByWelder(id) {
    api.get(`/day/byWelder/${id}`)
      .then((res) => { setvalueWorkDays(res.data) })
  }
  function loadDayByEquipment(id) {
    api.get(`/day/byEquipment/${id}`)
      .then((res) => { setvalueWorkDays(res.data) })
  }






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


  let WorkingShiftOptions = calendar?.mainWorkingShifts?.map((item) => {
    return {
      value: item.number,
      label: `Смена ${item.number}`,
    };
  })



  function SendData(params) {
    let smena = calendar?.mainWorkingShifts.find(elem => elem.number === valueWorkingShift)
    const data = {
      "monthNumber": new Date(params.workDay).getMonth(),
      "number": new Date(params.workDay).getDate(),
      "isWorkingDay": true,
      "year": new Date(params.workDay).getFullYear(),
      "weldingEquipmentId": equipmentObj?.id ?? null,
      "welderId": executorObj?.id ?? null,
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

    api.post("day", data).then(() => executorObj ? loadDayByWelder(executorObj.id) : loadDayByEquipment(equipmentObj.id))
  }



  function SetValOpenModalAddWorkDay() {
    setIsModalAddWorkDayOpen(true)
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
    api.post("day", data).then(() => executorObj ? loadDayByWelder(executorObj.id) : loadDayByEquipment(equipmentObj.id))
  }


  function CreateCalendar() {
    if (executorObj) {
      api.post(`/calendar/based-on-main/welder?Year=2023&WelderId=${executorObj.id}`)
        .then(() => {
          loadDayByWelder(executorObj.id)
        })
    }
    else {
      api.post(`/calendar/based-on-main/equipment?Year=2023&EquipmentId=${equipmentObj.id}`)
        .then(() => {
          loadDayByEquipment(equipmentObj.id)
        })
    }
  }

  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Календарь"
        toolTipText="Здесь Вы можете просмотреть производственный календарь "
        src={tasksImage}
      />

      <div className={styles.tableWrapper}>



        <div class="calendar-wrapper">
          {executorObj
            ? <h2>Сварщик: {executorObj.middleName} {executorObj.firstName} {executorObj.lastName}</h2>
            : <h2>Оборудование: {equipmentObj.name} №{equipmentObj.factoryNumber}</h2>
          }
          {userRole === "Admin" || userRole === "Master"
            ? (
              <div className={styles.RowToolsBtns}>
                <button onClick={SetValOpenModalAddWorkDay}>Добавить рабочий день</button>
                <button onClick={setValOpenModalAddWekend}>Добавить выходной день</button>
                {/* <div className={styles.Create}>
                  <label>Создание календаря на основе общезаводского</label>
                  <button onClick={() => { CreateCalendar() }}>Создать</button>
                </div> */}

              </div>
            )
            : null
          }

          {valueWorkDays
            ? (
              <Calendars
                valueWorkDays={valueWorkDays}
                WorkingShiftOptions={WorkingShiftOptions}
                executorObj={executorObj}
                equipmentObj={equipmentObj}
                loadDayByWelder={loadDayByWelder}
                loadDayByEquipment={loadDayByEquipment}
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

                {/*  <div className={styles.row}>
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
                */}

                {/* {valueObj === 1
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
                } */}



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

        {/*Отредактировать рабочий день*/}
        <ModalWindow
          isOpen={isModalEditWorkDayOpen}
          headerText="Отредактировать рабочий день"
          setIsOpen={(state) => {
            setIsModalEditWorkDayOpen(state);
            setModalData(null);
          }}
          wrapperStyles={{ width: 420 }}
        >
          <Formik
            initialValues={initialValues}
            enableReinitialize
            onSubmit={(variables) => {
              const { id, ...dataToSend } = variables;
              setIsModalEditWorkDayOpen(false);
              setModalData(null);
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


      </div>
    </div>
  );
};