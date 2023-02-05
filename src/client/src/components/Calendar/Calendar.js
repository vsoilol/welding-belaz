

import React, { useState } from "react";
import Calendar from "react-calendar";
import "react-calendar/dist/Calendar.css";
import ReactDOM from "react-dom";

import "../Calendar/styleCalendar.css";
import imgSmena from "assets/icons/Smena.png";


const Calendars = (calendar) => {


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
      'Суб',
      'Вск'
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
          html += '<td class="not-current">' + '<span>' + k + '</span>' + '</td>';
          k++;
        }
      }
      // Записываем текущий день в цикл
      var chk = new Date();
      var chkY = chk.getFullYear();
      var chkM = chk.getMonth();
      if (chkY == this.currYear && chkM == this.currMonth && i == this.currDay) {
        html += '<td class="today">' + `<img class="imgSmena" src="${imgSmena}">` + '<span>' + i + '</span>' + '</td>';
      } else {
        html += '<td class="normal">' + `<img class="imgSmena" src="${imgSmena}">` + '<span>' + i + '</span>' + '</td>';
      }
      // закрыть строку в воскресенье
      if (dow == 0) {
        html += '</tr>';
      }
      // Если последний день месяца не воскресенье, показать первые дни следующего месяца
      else if (i == lastDateOfMonth) {
        var k = 1;
        for (dow; dow < 7; dow++) {
          html += '<td class="not-current">' + '<span>' + k + '</span>' + '</td>';
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
  };
  // При загрузке окна
  window.onload = function () {
    // Начать календарь
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

    if (currYear === calendar.calendar.year) { 
      calendar.calendar.days.forEach(day => {
        if (day.monthNumber === currMonth && day.isWorkingDay) { 
          document.querySelectorAll(".calendar-wrapper #divCal .normal span").forEach((span, index) => {
            if (Number(span.innerHTML) === day.number) {
              document.querySelectorAll(".calendar-wrapper #divCal .normal ")[index].classList.add("Smena")
            }
          })
        }
      });

    }
  }





  return (
    <div class="calendar-wrapper">
      <button id="btnPrev" type="button">Предыдущий</button>
      <button id="btnNext" type="button">Следующий</button>
      <div id="divCal"></div>
    </div>
  );
}

export default Calendars;