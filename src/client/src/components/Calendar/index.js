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
import { Calendars } from "../Calendar/Calendar";
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
  loadDayByWelder,
  loadDayByEquipment,
  addDay,
  editDay,

}) => { 
  const [isModalAddWorkDayOpen, setIsModalAddWorkDayOpen] = useState(false);
  const [isModalEditWorkDayOpen, setIsModalEditWorkDayOpen] = useState(false);
  const [isModalAddShift, setIsModalAddShift] = useState(false);
 
  const [modalData, setModalData] = useState(null);
  const dispatch = useDispatch();
  const [valueObj, setValueObj] = useState(0);

  const [valueExecutors, setValueExecutors] = useState(null); 
  const [valueEquipment, setValueEquipment] = useState(null); 
 
  const [valueWorkingShift, setValueWorkingShift] = useState([]);

 


  let date = new Date().getUTCFullYear()

  const initialValues = {
    shiftDay: modalData?.shiftDay ?? "",

    year: modalData?.year ?? "",
    calendarId: calendar?.id ?? "",
    workDay: modalData?.workDay ?? "",

    shiftStart: modalData?.shiftStart ?? "",
    shiftEnd: modalData?.shiftEnd ?? "",
    breakStart: modalData?.breakStart ?? "",
    breakEnd: modalData?.breakEnd ?? "",
    shiftNumb: modalData?.shiftNumb ?? "",
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

  useEffect(() => {
    loadCalendaryear(date);
    loadExecutors();
    loadEquipment();
    (window.localStorage.getItem("executorId")) ? loadDayByWelder(window.localStorage.getItem("executorId")) : loadDayByEquipment(window.localStorage.getItem("equipmentId"))
  }, [loadCalendaryear, loadExecutors, loadEquipment]);


  const getDocument = (activeId) => {
    api
      .get(`/reports/passportReport/${activeId}`, {
        responseType: "arraybuffer",
        dataType: "blob",
      })
      .then((response) => {
        const file = new Blob([response["data"]], {
          type: "application/pdf",
        });

        const fileURL = URL.createObjectURL(file);
        window.open(fileURL);
      })
      .catch((error) => dispatch(setError(error?.response?.data?.title ?? "")));
  };



  ////////////////////////////////////////////////////////////////////


  const [value_panel, setValue] = useState(0);
  const ChangePanels = (event, newValue) => {
    setValue(newValue);
  };
  const TabPanel = (props_panel) => {
    const { children, value, indPanel } = props_panel;

    return (
      <div hidden={value !== indPanel}  >
        {children}
      </div>
    );
  };

  ////////////////////////////////////////////////////////////////////
  const welder = [
    {
      title: "День",
      field: "day",
    },
    {
      title: "Смена",
      field: "alter",
    },
  ]

 


  let WorkingShiftOptions = calendar?.mainWorkingShifts?.map((item) => {
    return {
      value: item.number,
      label: `Смена ${item.number}`,
    };
  })



  function SendData(params, fun) {
    params["valueObj"] = valueObj
    params["valueExecutors"] = valueExecutors
    params["valueEquipment"] = valueEquipment
    params["shiftDay"] = new Date(params.shiftDay).toLocaleDateString()


    params["monthNumber"] = new Date(params.workDay).getUTCMonth() + 1;
    params["number"] = new Date(params.workDay).getUTCDate();
    params["year"] = new Date(params.workDay).getFullYear();

    params["WorkingShiftnumber"] = valueWorkingShift
    params["workingShifts"] = SetworkingShifts(valueWorkingShift)



    if (fun === "AddWorkDay") {
      const executorId = window.localStorage.getItem("executorId");
      const equipmentId = window.localStorage.getItem("equipmentId");
      if (executorId) {
        params.valueExecutors = executorId;
      } else if (equipmentId) {
        params.valueEquipment = equipmentId;
      }
      if (params.workingShifts?.number === 3) {
        params.number++;
      }
      /* addDay(params); */
    } else if (fun === "EditWorkDay") {
      /* editDay(params); */
    }

  }

  function SetworkingShifts(valueWorkingShift) {
    for (let index = 0; index < calendar.mainWorkingShifts.length; index++) {
      if (calendar.mainWorkingShifts[index].number === valueWorkingShift) {
        return calendar.mainWorkingShifts[index]
      }
    }
  }


  function SetValOpenModalAddWorkDay() {
    setIsModalAddWorkDayOpen(true)
  }
 


  ////*****************//////////////////!!!!!  Calendar

  const ArrayDays = calendar?.days ?? []; 


  return (
    <div className={styles.innerWrapper}>
      <ToolTip
        title="Календарь"
        toolTipText="Здесь Вы можете просмотреть производственный календарь "
        src={tasksImage}
      />

      <div className={styles.tableWrapper}>



        <div class="calendar-wrapper">
          <h2>Производственный календарь </h2>
          <Calendars
            executors={executors}
            equipment={equipment}
            arrayDays={ArrayDays}
          >
          </Calendars>
        </div>

        <div className={styles.RowToolsBtns}>
          <button onClick={SetValOpenModalAddWorkDay}>Добавить рабочий день</button>
          {/* <button onClick={setIsModalAddShift}>Создать рабочую смену</button> */}
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
              SendData(variables, "AddWorkDay")
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




      </div>
    </div>
  );
};
