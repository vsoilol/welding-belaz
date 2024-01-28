import { connect } from "react-redux";
import { CalendarPage } from "pages/Calendar";
import { calendarActionCreators } from "store/calendar";

const mapStateToProps = (state) => {
  return {
    mainCalendar: state.calendar.calendar,
    userRole: state.auth.user.role,
    calendarIsLoading: state.calendar.isLoading,
  };
};

const mapDispatchToProps = {
  loadMainCalendarByYear: calendarActionCreators.loadMainCalendarByYearRequest,
  updateWorkingDayWithWorkingShift:
    calendarActionCreators.updateWorkingDayWithWorkingShiftRequest,
  createDay: calendarActionCreators.createDayRequest,
  updateDay: calendarActionCreators.updateDayRequest,
  createWorkingShift: calendarActionCreators.createWorkingShiftRequest,
  deleteWorkingShift: calendarActionCreators.deleteWorkingShiftRequest,
  updateWorkingShift: calendarActionCreators.updateWorkingShiftRequest,
  loadCalendarByWelder: calendarActionCreators.loadCalendarByWelderRequest,
  loadCalendarByEquipment:
    calendarActionCreators.loadCalendarByEquipmentRequest,
  createCalendarForEquipmentBasedOnMain:
    calendarActionCreators.createCalendarForEquipmentBasedOnMainRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(CalendarPage);
