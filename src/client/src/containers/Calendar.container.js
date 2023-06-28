import { connect } from "react-redux";
import { CalendarPage } from "pages/Calendar";
import Actions from "store/calendar/actions";  

const mapStateToProps = (state) => {
  return { 
    executors: state.executors.executors, 
    equipment: state.equipment.equipment, 
    calendar:state.calendar.calendaryear,
    days:state.calendar.day,
    userRole: state.auth.user.role, 
  };
};
const mapDispatchToProps = {
 
  loadExecutors:Actions.Creators.loadExecutorsRequest, 
  loadEquipment:Actions.Creators.loadEquipmentRequest,  
  ///Calendar
  loadCalendaryear: Actions.Creators.loadCalendaryearRequest, 
  addCalendarmain: Actions.Creators.addCalendarmainRequest, 
  editEditcalendar: Actions.Creators.editEditcalendarRequest, 
  addCalendarwelder: Actions.Creators.addCalendarwelderRequest,  
  loadCalendarwelder: Actions.Creators.loadCalendarwelderRequest, 
  addCalendarequipment:Actions.Creators.addCalendarequipmentRequest, 
  loadCalendarequipment: Actions.Creators.loadCalendarequipmentRequest, 

  ///WorkingShift
  addShift:Actions.Creators.addShiftRequest, 
  editShift:Actions.Creators.editShiftRequest, 
  ///Day
  loadDayByWelder:Actions.Creators.loadDaybywelderRequest, 
  loadDayByEquipment:Actions.Creators.loadDayequiRequest, 
  addDay:Actions.Creators.addDayRequest, 
  editDay:Actions.Creators.editDayRequest, 
};

export default connect(mapStateToProps, mapDispatchToProps)(CalendarPage);
