import { useDispatch, useSelector } from 'react-redux';
import { useCallback } from 'react';
import { calendarActionCreators } from 'store/calendar';
import {
  selectCalendar,
  selectCalendarId,
  selectCalendarIsLoading,
  selectCalendarMainWorkingShifts,
  selectCalendarYear,
} from './calendar.selectors';

export const useCalendarStore = () => {
  const dispatch = useDispatch();

  // Selectors
  const calendar = useSelector(selectCalendar);
  const isLoading = useSelector(selectCalendarIsLoading);
  const calendarYear = useSelector(selectCalendarYear);
  const calendarId = useSelector(selectCalendarId);
  const mainWorkingShifts = useSelector(selectCalendarMainWorkingShifts);

  // Actions
  const loadMainCalendarByYear = useCallback(
    year =>
      dispatch(calendarActionCreators.loadMainCalendarByYearRequest(year)),
    [dispatch]
  );

  const cancelLoadMainCalendarByYear = useCallback(
    () => dispatch(calendarActionCreators.loadMainCalendarByYearCancel()),
    [dispatch]
  );

  const updateWorkingDayWithWorkingShift = useCallback(
    (day, workingShift) =>
      dispatch(
        calendarActionCreators.updateWorkingDayWithWorkingShiftRequest(
          day,
          workingShift
        )
      ),
    [dispatch]
  );

  const createDay = useCallback(
    day => dispatch(calendarActionCreators.createDayRequest(day)),
    [dispatch]
  );

  const updateDay = useCallback(
    day => dispatch(calendarActionCreators.updateDayRequest(day)),
    [dispatch]
  );

  const createWorkingShift = useCallback(
    workingShift =>
      dispatch(calendarActionCreators.createWorkingShiftRequest(workingShift)),
    [dispatch]
  );

  const deleteWorkingShift = useCallback(
    workingShiftId =>
      dispatch(
        calendarActionCreators.deleteWorkingShiftRequest(workingShiftId)
      ),
    [dispatch]
  );

  const updateWorkingShift = useCallback(
    workingShift =>
      dispatch(calendarActionCreators.updateWorkingShiftRequest(workingShift)),
    [dispatch]
  );

  const loadCalendarByWelder = useCallback(
    (welderId, year) =>
      dispatch(
        calendarActionCreators.loadCalendarByWelderRequest(welderId, year)
      ),
    [dispatch]
  );

  const loadCalendarByEquipment = useCallback(
    (equipmentId, year) =>
      dispatch(
        calendarActionCreators.loadCalendarByEquipmentRequest(equipmentId, year)
      ),
    [dispatch]
  );

  const createCalendarForEquipmentBasedOnMain = useCallback(
    (equipmentId, year) =>
      dispatch(
        calendarActionCreators.createCalendarForEquipmentBasedOnMainRequest(
          equipmentId,
          year
        )
      ),
    [dispatch]
  );

  return {
    calendar,
    isLoading,
    calendarYear,
    calendarId,
    mainWorkingShifts,
    loadMainCalendarByYear,
    updateWorkingDayWithWorkingShift,
    createDay,
    updateDay,
    createWorkingShift,
    deleteWorkingShift,
    updateWorkingShift,
    loadCalendarByEquipment,
    loadCalendarByWelder,
    createCalendarForEquipmentBasedOnMain,
    cancelLoadMainCalendarByYear,
  };
};
