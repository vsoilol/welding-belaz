import { connect } from "react-redux";
import { EquipmentPage } from "pages/Equipment";
import Actions from "store/equipment/actions";
import MasterActions from "store/executors/actions";

const mapStateToProps = (state) => {
  return {
    equipment: state.equipment.equipment,
    masters: state.executors.masters,
    isRequesting:
      state?.equipment?.isRequesting || state?.masters?.isRequesting,
    userRole: state.auth.user.role,
  };
};
const mapDispatchToProps = {
  loadEquipment: Actions.Creators.loadEquipmentRequest,
  addEquipment: Actions.Creators.addEquipmentRequest,
  deleteEquipment: Actions.Creators.deleteEquipmentRequest,
  editEquipment: Actions.Creators.editEquipmentRequest,
  loadMasters: MasterActions.Creators.loadMastersRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(EquipmentPage);
