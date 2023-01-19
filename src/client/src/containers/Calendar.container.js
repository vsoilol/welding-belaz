import { connect } from "react-redux";
import { CalendarPage } from "pages/Calendar";
import Actions from "store/calendar/actions";
import ExecutorsActions from "store/executors/actions";
import InstructionsActions from "store/instructions/actions";
import EquipmentActions from "store/equipment/actions";

const mapStateToProps = (state) => {
  return { 
    executors: state.executors.executors, 
    equipment: state.equipment.equipment, 
    calendar:state
  };
};
const mapDispatchToProps = {
  loadCalendar: Actions.Creators.loadCalendarRequest, 
  loadExecutors:Actions.Creators.loadExecutorsRequest, 
  loadEquipment:Actions.Creators.loadEquipmentRequest, 
};

export default connect(mapStateToProps, mapDispatchToProps)(CalendarPage);
