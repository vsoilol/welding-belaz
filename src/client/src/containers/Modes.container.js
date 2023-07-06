import { connect } from "react-redux";
import { ModesPage } from "pages/ModesPage";
import ActionsEquipment from "store/equipment/actions";
import ActionsExecutors from "store/executors/actions";

const mapStateToProps = (state) => {
  return {
    records: state.records.records,
    isRequesting: state.records.isRequesting,
    userRole: state.auth.user.role,

    executors: state.executors.executors, 
    equipment: state.equipment.equipment, 
  };
};

const mapDispatchToProps = {
  loadEquipmentRequest: ActionsEquipment.Creators.loadEquipmentRequest, 
  loadExecutorsRequest: ActionsExecutors.Creators.loadExecutorsRequest, 
};

export default connect(mapStateToProps, mapDispatchToProps)(ModesPage);
