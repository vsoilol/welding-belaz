import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions(
  {
    createCalendarFromStoredRequest: ['year'],
    createCalendarFromStoredSuccess: ['calendar'],
    createCalendarFromStoredFailure: ['error'],

    loadMainCalendarByYearRequest: ['year'],
    loadMainCalendarByYearSuccess: ['calendar'],
    loadMainCalendarByYearFailure: ['error'],

    updateWorkingDayWithWorkingShiftRequest: ['day', 'workingShift'],
    updateWorkingDayWithWorkingShiftSuccess: null,
    updateWorkingDayWithWorkingShiftFailure: ['error'],

    createDayRequest: ['day'],
    createDaySuccess: null,
    createDayFailure: ['error'],

    updateDayRequest: ['day'],
    updateDaySuccess: null,
    updateDayFailure: ['error'],

    createWorkingShiftRequest: ['workingShift'],
    createWorkingShiftSuccess: null,
    createWorkingShiftFailure: ['error'],

    deleteWorkingShiftRequest: ['workingShiftId'],
    deleteWorkingShiftSuccess: null,
    deleteWorkingShiftFailure: ['error'],

    updateWorkingShiftRequest: ['workingShift'],
    updateWorkingShiftSuccess: null,
    updateWorkingShiftFailure: ['error'],

    loadCalendarByWelderRequest: ['welderId', 'year'],
    loadCalendarByWelderSuccess: ['calendar'],
    loadCalendarByWelderFailure: ['error'],

    loadCalendarByEquipmentRequest: ['equipmentId', 'year'],
    loadCalendarByEquipmentSuccess: ['calendar'],
    loadCalendarByEquipmentFailure: ['error'],

    createCalendarForEquipmentBasedOnMainRequest: ['equipmentId', 'year'],
    createCalendarForEquipmentBasedOnMainSuccess: ['calendar'],
    createCalendarForEquipmentBasedOnMainFailure: ['error'],

    createCalendarForWelderBasedOnMainRequest: ['welderId', 'year'],
    createCalendarForWelderBasedOnMainSuccess: ['calendar'],
    createCalendarForWelderBasedOnMainFailure: ['error'],
  },
  {}
);

export const calendarActionTypes = Types;
export const calendarActionCreators = Creators;
