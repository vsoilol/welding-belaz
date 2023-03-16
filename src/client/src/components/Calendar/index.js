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

  function EdditWorkingShift() {

    document.querySelectorAll(".imgEdit").forEach((elem, index) => {
      elem.addEventListener("click", function () {
        let numbDay = Number(document.querySelectorAll(".imgEdit")[index].parentElement.querySelector("span").innerHTML)

        if (window.localStorage.getItem("executorId")) {
          for (let index = 0; index < calendar?.days[1]?.length; index++) {
            let day = calendar?.days[1][index]
            if (numbDay === day.number) {
              setIdEdditWorkingShift(calendar?.days[1][index].id)
            }
          }
        }
        else {
          for (let index = 0; index < days?.length; index++) {
            if (days[index] != undefined) {
              console.log(days[index].number)
              if (numbDay === days[index].number) {
                console.log(days[index].id)
                setIdEdditWorkingShift(days[index].id)
              }
            }

          }
        }
        setIsModalEditWorkDayOpen(true)
      })
    })
  }


  ////*****************//////////////////  Calendar
  let currMonth = 0;
  let currYear = 0;
  var Cal = function (divId) {
    //Сохраняем идентификатор div
    this.divId = divId;
    // Дни недели с понедельника
    this.DaysOfWeek = [
      'Пн',
      'Вт',
      'Ср',
      'Чт',
      'Пт',
      'Сб',
      'Вс'
    ];
    // Месяцы начиная с января
    this.Months = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
    //Устанавливаем текущий месяц, год
    var d = new Date();
    this.currMonth = d.getMonth();
    this.currYear = d.getFullYear();
    this.currDay = d.getDate();
  };
  // Переход к следующему месяцу
  Cal.prototype.nextMonth = function () {
    if (this.currMonth == 11) {
      this.currMonth = 0;
      this.currYear = this.currYear + 1;
    }
    else {
      this.currMonth = this.currMonth + 1;
    }
    this.showcurr();
  };
  // Переход к предыдущему месяцу
  Cal.prototype.previousMonth = function () {
    if (this.currMonth == 0) {
      this.currMonth = 11;
      this.currYear = this.currYear - 1;
    }
    else {
      this.currMonth = this.currMonth - 1;
    }
    this.showcurr();
  };
  // Показать текущий месяц
  Cal.prototype.showcurr = function () {
    this.showMonth(this.currYear, this.currMonth);
  };
  // Показать месяц (год, месяц)
  Cal.prototype.showMonth = function (y, m) {
    var d = new Date()
      // Первый день недели в выбранном месяце 
      , firstDayOfMonth = new Date(y, m, 7).getDay()
      // Последний день выбранного месяца
      , lastDateOfMonth = new Date(y, m + 1, 0).getDate()
      // Последний день предыдущего месяца
      , lastDayOfLastMonth = m == 0 ? new Date(y - 1, 11, 0).getDate() : new Date(y, m, 0).getDate();
    var html = '<table>';
    // Запись выбранного месяца и года
    html += '<thead><tr>';
    html += '<td colspan="7">' + this.Months[m] + ' ' + y + '</td>';
    html += '</tr></thead>';
    // заголовок дней недели
    html += '<tr class="days">';
    for (var i = 0; i < this.DaysOfWeek.length; i++) {
      html += '<td>' + this.DaysOfWeek[i] + '</td>';
    }
    html += '</tr>';
    // Записываем дни
    var i = 1;
    do {
      var dow = new Date(y, m, i).getDay();
      // Начать новую строку в понедельник
      if (dow == 1) {
        html += '<tr>';
      }
      // Если первый день недели не понедельник показать последние дни предыдущего месяца
      else if (i == 1) {
        html += '<tr>';
        var k = lastDayOfLastMonth - firstDayOfMonth + 1;
        for (var j = 0; j < firstDayOfMonth; j++) {
          html += '<td class="dayCalend not-current">' + '<span>' + k + '</span>' + '</td>';
          k++;
        }
      }
      // Записываем текущий день в цикл
      var chk = new Date();
      var chkY = chk.getFullYear();
      var chkM = chk.getMonth();

      if (chkY == this.currYear && chkM == this.currMonth && i == this.currDay) {
        html +=
          `
           <td class="dayCalend today smena">
             <img class="imgSmena" src="${imgSmena}">
             <img class="imgEdit" src="${imgEdit}">
             
             <span>${i}</span> 
             <div class="vkladka">
               <div class="events"> 
                
               </div>
             </div>
           </td>
        `
      } else {
        html +=
          `
           <td class="dayCalend normal smena">
             <img class="imgSmena" src="${imgSmena}">
             <img   class="imgEdit" src="${imgEdit}">
             <span>${i}</span> 
             <div class="vkladka">
              <div class="events">
                
              </div>
             </div>
           </td>
        `
      }
      // закрыть строку в воскресенье
      if (dow == 0) {
        html += '</tr>';
      }
      // Если последний день месяца не воскресенье, показать первые дни следующего месяца
      else if (i == lastDateOfMonth) {
        var k = 1;
        for (dow; dow < 7; dow++) {
          html += '<td class="dayCalend not-current">' + '<span>' + k + '</span>' + '</td>';
          k++;
        }
      }
      i++;
    } while (i <= lastDateOfMonth);
    // Конец таблицы
    html += '</table>';
    // Записываем HTML в div
    document.getElementById(this.divId).innerHTML = html;

    /////////////////
    currMonth = this.currMonth + 1
    currYear = this.currYear

    DisplayWorkingShift()
    DisplayWorkingShiftTable()
  };
  // Начать календарь
  if (calendar != undefined) {
    var c = new Cal("divCal");
    c.showcurr();
    // Привязываем кнопки «Следующий» и «Предыдущий»
    getId('btnNext').onclick = function () {
      c.nextMonth();
    };
    getId('btnPrev').onclick = function () {
      c.previousMonth();
    };
  }
  // Получить элемент по id
  function getId(id) {
    return document.getElementById(id);
  }

  //Отображение иконок рабочих дней при наличии
  function DisplayWorkingShift() {

    if (currYear === calendar?.year) { 
      if (window.localStorage.getItem("executorId")) {
        if (calendar?.days[1] != undefined || calendar?.days[1] != null) {  
          for (let index = 0; index < document.querySelectorAll(".calendar-wrapper table tr:not(.days) td.dayCalend ").length; index++) {
            let dayCell = document.querySelectorAll(".calendar-wrapper table tr:not(.days) td.dayCalend ")[index]
            dayCell.classList.add("Smena") 
          } 
          for (let index = 1; index < document.querySelectorAll(".calendar-wrapper table tr:not(.days) ").length; index++) {
            let rowWeeks = document.querySelectorAll(".calendar-wrapper table tr:not(.days) ")[index]
            rowWeeks.querySelectorAll("td")[6].classList.remove("Smena") 
            rowWeeks.querySelectorAll("td")[5].classList.remove("Smena")
          }
          // for (let index = 0; index < calendar?.days[1]?.length; index++) {
          //   let day = calendar?.days[1][index]
          //   if (day != undefined) {
          //     if (day.monthNumber === currMonth && day.isWorkingDay) {
          //       document.querySelectorAll(".calendar-wrapper table tr span").forEach((span, index2) => {
          //         if (Number(span.innerHTML) === day.number) {
          //           document.querySelectorAll(".calendar-wrapper table .dayCalend")[index2].classList.add("Smena")
          //         } 
          //       })
          //     }
          //   } 
          // }
        } 
      }
      else {
        if (days != undefined || days != null) {
          for (let index = 0; index < document.querySelectorAll(".calendar-wrapper table tr:not(.days) td.dayCalend ").length; index++) {
            let dayCell = document.querySelectorAll(".calendar-wrapper table tr:not(.days) td.dayCalend ")[index]
            dayCell.classList.add("Smena")
          }
          for (let index = 1; index < document.querySelectorAll(".calendar-wrapper table tr:not(.days) ").length; index++) {
            let rowWeeks = document.querySelectorAll(".calendar-wrapper table tr:not(.days) ")[index]
            rowWeeks.querySelectorAll("td")[6].classList.remove("Smena") 
            rowWeeks.querySelectorAll("td")[5].classList.remove("Smena")
          }
          // for (let index = 0; index < days?.length; index++) {
          //   if (days[index] != undefined) {
          //     if (days[index].monthNumber === currMonth && days[index].isWorkingDay) {
          //       document.querySelectorAll(".calendar-wrapper table tr span").forEach((span, index2) => {
          //         if (Number(span.innerHTML) === days[index].number) {
          //           document.querySelectorAll(".calendar-wrapper table .dayCalend")[index2].classList.add("Smena")
          //         } 
          //       })
          //     }
          //   } 
          // }
        } 
      }
      EdditWorkingShift() 
    } 
  }
  ///Отображать список смен в всплывашке 
  function DisplayWorkingShiftTable() {
    if (currYear === calendar?.year) { 
      if (window.localStorage.getItem("executorId")) {
        if (calendar?.days[1] != undefined || calendar?.days[1] != null) {
          for (let index = 0; index < calendar?.days[1]?.length; index++) {
            let day = calendar?.days[1][index]
            if (day.monthNumber === currMonth && day.isWorkingDay) {
              document.querySelectorAll(".calendar-wrapper table tr span").forEach((span, index2) => {
                let dayCalend = document.querySelectorAll(".calendar-wrapper table .dayCalend")[index2].querySelector(".events"); 
                if (Number(span.innerHTML) === day.number) {
                  let dayCalend = document.querySelectorAll(".calendar-wrapper table .dayCalend")[index2].querySelector(".events"); 
                  if (dayCalend != null) {
                    dayCalend.innerHTML +=
                      `
                     <div class="row"> 
                       <p>Смена <abbr>${day.workingShifts[0].number}</abbr> <em>( ${day.workingShifts[0].shiftStart} - ${day.workingShifts[0].shiftEnd} )</em></p> 
                       <p>Перерыв  <em>( ${day.workingShifts[0].breakStart} - ${day.workingShifts[0].breakEnd} )</em></p>
                     </div> 
                     `
                  } 
                } else if (dayCalend != null) {
                  dayCalend.innerHTML =
                  `
                  <div class="row"> 
                    <p>Смена <abbr>${day.workingShifts[0].number}</abbr> <em>( ${day.workingShifts[0].shiftStart} - ${day.workingShifts[0].shiftEnd} )</em></p> 
                    <p>Перерыв  <em>( ${day.workingShifts[0].breakStart} - ${day.workingShifts[0].breakEnd} )</em></p>
                  </div> 
                  `
                }
                
               
              })
            }
          }
        } 
      }
      else {
        if (days != undefined || days != null) {
          for (let index = 0; index < days?.length; index++) {

            if (days[index].monthNumber === currMonth && days[index].isWorkingDay) {
              document.querySelectorAll(".calendar-wrapper table tr span").forEach((span, index2) => {
                if (Number(span.innerHTML) === days[index].number) {
                  let dayCalend = document.querySelectorAll(".calendar-wrapper table .dayCalend")[index2].querySelector(".events");
                
                  if (dayCalend != null) {
                    dayCalend.innerHTML +=
                      `
                      <div class="row"> 
                        <p>Смена <abbr>${days[index].workingShifts[0].number}</abbr> <em>( ${days[index].workingShifts[0].shiftStart} - ${days[index].workingShifts[0].shiftEnd} )</em></p> 
                        <p>Перерыв  <em>( ${days[index].workingShifts[0].breakStart} - ${days[index].workingShifts[0].breakEnd} )</em></p>
                      </div> 
                      `
                  } 
                }else if ( document.querySelectorAll(".calendar-wrapper table .dayCalend")[index2].querySelector(".events") != null) {
                  document.querySelectorAll(".calendar-wrapper table .dayCalend")[index2].querySelector(".events").innerHTML =
                  `
                  <div class="row"> 
                    <p>Смена <abbr>${days[index].workingShifts[0].number}</abbr> <em>( ${days[index].workingShifts[0].shiftStart} - ${days[index].workingShifts[0].shiftEnd} )</em></p> 
                    <p>Перерыв  <em>( ${days[index].workingShifts[0].breakStart} - ${days[index].workingShifts[0].breakEnd} )</em></p>
                  </div> 
                  `
                }
              })
            }
          }
        }
      }

    }
    
  }
  ////*****************//////////////////!!!!!  Calendar



  function EditWorkDaySend(variables) {

    variables["daiID"] = valueIdEdditWorkingShift
    variables["monthNumber"] = new Date(variables.workDay).getUTCMonth() + 1;
    variables["number"] = new Date(variables.workDay).getUTCDate();
    editDay(variables)
  }


  function CreatShift(params) {
    addShift(params)
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
          {(window.localStorage.getItem("executorId")) != null
            ? <h2>Производственный календарь <span className={styles.obj}>{window.localStorage.getItem("executor")}</span></h2>
            : <h2>Производственный календарь <span className={styles.obj}>{window.localStorage.getItem("equipment")}</span></h2>
          }
          <button id="btnPrev" type="button">Предыдущий</button>
          <button id="btnNext" type="button">Следующий</button>
          <div id="divCal"></div>
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
              EditWorkDaySend(variables)
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
              CreatShift(variables)
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
