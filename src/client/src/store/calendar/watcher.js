import {
  loadMainCalendarByYearWatchers,
  createCalendarFromStoredWatchers,
  updateWorkingDayWithWorkingShiftWatchers,
  createDayWatchers,
  updateDayWatchers,
  createWorkingShiftWatchers,
  deleteWorkingShiftWatchers,
  updateWorkingShiftWatchers,
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
];
