import * as sagas from './sagas';

const watchers = [
  ...sagas.loadMainCalendarByYearWatchers,
  ...sagas.createCalendarFromStoredWatchers,
  ...sagas.updateWorkingDayWithWorkingShiftWatchers,
  ...sagas.createDayWatchers,
  ...sagas.updateDayWatchers,
  ...sagas.createWorkingShiftWatchers,
  ...sagas.deleteWorkingShiftWatchers,
  ...sagas.updateWorkingShiftWatchers,
  ...sagas.loadCalendarByWelderWatchers,
  ...sagas.loadCalendarByEquipmentWatchers,
  ...sagas.createCalendarForEquipmentBasedOnMainWatchers,
  ...sagas.createCalendarForWelderBasedOnMainWatchers,
];

export default watchers;
