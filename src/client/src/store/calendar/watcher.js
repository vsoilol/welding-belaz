import {
  loadMainCalendarByYearWatchers,
  createCalendarFromStoredWatchers,
  updateWorkingDayWithWorkingShiftWatchers,
  createDayWatchers,
  updateDayWatchers,
  createWorkingShiftWatchers,
  deleteWorkingShiftWatchers,
  updateWorkingShiftWatchers,
  loadCalendarByWelderWatchers,
  loadCalendarByEquipmentWatchers,
  createCalendarForEquipmentBasedOnMainWatchers,
} from "./sagas";

export default [
  ...loadMainCalendarByYearWatchers,
  ...createCalendarFromStoredWatchers,
  ...updateWorkingDayWithWorkingShiftWatchers,
  ...createDayWatchers,
  ...updateDayWatchers,
  ...createWorkingShiftWatchers,
  ...deleteWorkingShiftWatchers,
  ...updateWorkingShiftWatchers,
  ...loadCalendarByWelderWatchers,
  ...loadCalendarByEquipmentWatchers,
  ...createCalendarForEquipmentBasedOnMainWatchers,
];
