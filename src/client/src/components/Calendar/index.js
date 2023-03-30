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
  const [isModalOpen, setIsModalOpen] = useState(false);

  const [isModalCreateCalendarOpen, setIsModalCreateCalendarOpen] = useState(false);
  const [isModalAddWorkDayOpen, setIsModalAddWorkDayOpen] = useState(false);
  const [isModalEditWorkDayOpen, setIsModalEditWorkDayOpen] = useState(false);
  const [isModalAddShift, setIsModalAddShift] = useState(false);



  const [isModalOpenIndex, setIsModalOpenIndex] = useState(false);
  const [modalData, setModalData] = useState(null);
  const dispatch = useDispatch();
  const [valueObj, setValueObj] = useState(1);

  const [valueExecutors, setValueExecutors] = useState(null);
  const [valueNameExecutors, setValueNameExecutors] = useState(null);
  const [valueEquipment, setValueEquipment] = useState(null);
  const [valueNameEquipment, setValueNameEquipment] = useState(null);
  const [valueIsWorkingDay, setValueIsWorkingDay] = useState(null);

  const [valueWorkData, setValueWorkData] = useState([]);
  const [valueWorkingShift, setValueWorkingShift] = useState([]);


  const [valueIdEdditWorkingShift, setIdEdditWorkingShift] = useState(0);


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
      if (valueObj === 1) {
        params["valueExecutors"] = null
      }
      else {
        params["valueEquipment"] = null
      }
      addDay(params)
    }
    if (fun === "EditWorkDay") {
      editDay(params)
    }
    // console.log(params)
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

  function SetValIsModalEditWorkDayOpen() {
    setIsModalEditWorkDayOpen(true)
  }


  ////*****************//////////////////!!!!!  Calendar

  const ArrayDays = calendar?.days[1];

  const resultArrayDays = ArrayDays?.map((Day) => { 
    const [breakStartHour, breakStartMinute] = Day.workingShifts[0].breakStart.split(':');
    const [breakEndHour, breakEndMinute] = Day.workingShifts[0].breakEnd.split(':');

    const [shiftStartHour, shiftStartMinute] = Day.workingShifts[0].shiftStart.split(':');
    const [shiftEndHour, shiftEndMinute] = Day.workingShifts[0].shiftEnd.split(':');

    let shiftStart = new Date(Day.year, Day.monthNumber-1, Day.number, shiftStartHour, shiftStartMinute) ;
    let shiftEnd = new Date(Day.year, Day.monthNumber-1, Day.number, shiftEndHour,shiftEndMinute) ;
    
    let breakStart = new Date(Day.year, Day.monthNumber-1, Day.number, breakStartHour, breakStartMinute) ;
    let breakEnd = new Date(Day.year, Day.monthNumber-1, Day.number, breakEndHour, breakEndMinute) ;
     return{
        title: `Смена ${Day.workingShifts[0].number}`,
        start: shiftStart,
        end: breakStart,

        shiftEnd:shiftEnd,
        breakEnd:breakEnd,
        breakStart:breakStart,

        year:Day.year,
        shiftStart:Day.workingShifts[0].breakStart,
        shiftEnd:Day.workingShifts[0].breakStart,

    }
  }); 


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
            resultArrayDays={resultArrayDays}
          >
          </Calendars>
        </div>

        <div className={styles.RowToolsBtns}>
          <button onClick={SetValOpenModalAddWorkDay}>Добавить рабочий день</button>
          <button onClick={setIsModalAddShift}>Создать рабочую смену</button>
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
