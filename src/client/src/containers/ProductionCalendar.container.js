import { connect } from "react-redux";
import { ProductionCalendarPage } from "pages/ProductionCalendarPage";
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
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ProductionCalendarPage);
