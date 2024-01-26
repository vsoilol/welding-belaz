import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({
  ///calendar
  loadCalendaryearRequest: ["payload"],
  loadCalendaryearSuccess: ["calendaryear"],
  loadCalendaryearFailure: ["error"],

  addCalendarmainRequest: ["payload"],
  addCalendarmainSuccess: ["calendarMain"],
  addCalendarmainFailure: ["error"],

  editEditcalendarRequest: ["payload"],
  editEditcalendarSuccess: ["editcalendar"],
  editEditcalendarFailure: ["error"],

  addCalendarwelderRequest: ["payload"],
  addCalendarwelderSuccess: ["calendarWelder"],
  addCalendarwelderFailure: ["error"],

  loadCalendarwelderRequest: ["payload"],
  loadCalendarwelderSuccess: ["loadCalendarwelder"],
  loadCalendarwelderFailure: ["error"],

  addCalendarequipmentRequest: ["payload"],
  addCalendarequipmentSuccess: ["calendarEquipment"],
  addCalendarequipmentFailure: ["error"],

  loadCalendarequipmentRequest: ["payload"],
  loadCalendarequipmentSuccess: ["loadEquipment"],
  loadCalendarequipmentFailure: ["error"],

  ///Executor
  loadExecutorsRequest: ["payload"],
  loadExecutorsSuccess: ["executors"],
  loadExecutorsFailure: ["error"],

  ///Equipment
  loadEquipmentRequest: ["payload"],
  loadEquipmentSuccess: ["equipment"],
  loadEquipmentFailure: ["error"],

  //WorkingShift
  editShiftRequest: ["payload"],
  editShiftSuccess: ["workingShift"],
  editShiftFailure: ["error"],

  addShiftRequest: ["payload"],
  addShiftSuccess: ["workingShift"],
  addShiftFailure: ["error"],

  //Day
  editDayRequest: ["payload"],
  editDaySuccess: ["day"],
  editDayFailure: ["error"],

  addDayRequest: ["payload"],
  addDaySuccess: ["day"],
  addDayFailure: ["error"],

  loadDaybywelderRequest: ["payload"],
  loadDaybywelderSuccess: ["day"],
  loadDaybywelderFailure: ["error"],

  loadDayequiRequest: ["payload"],
  loadDayequiSuccess: ["day"],
  loadDayequiFailure: ["error"],

  loadMainCalendarByYearRequest: ["year"],
  loadMainCalendarByYearSuccess: ["calendar"],
  loadMainCalendarByYearFailure: ["error"],
});

const workplaceActions = {
  Types,
  Creators,
};

export default workplaceActions;
