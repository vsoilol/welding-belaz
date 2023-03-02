import { connect } from "react-redux";
import { EquipmentPage } from "pages/Equipment";
import Actions from "store/equipment/actions";
import Actionsworkplace from "store/workplace/actions";
import ActionsWelder from "store/executors/actions";
import MasterActions from "store/executors/actions";

const mapStateToProps = (state) => {
  return {
    equipment: state.equipment.equipment,
    masters: state.executors.masters,
    welder: state.executors.executors,
    isRequesting:
      state?.equipment?.isRequesting || state?.masters?.isRequesting,
    userRole: state.auth.user.role,
    posts:state.workplace.posts, 
    reason:state.equipment.reason
    
  };
};
const mapDispatchToProps = {
  ///Цеха 
  loadWorkshop: Actionsworkplace.Creators.loadWorkshopRequest,
  loadEquipment: Actions.Creators.loadEquipmentRequest, 
  addEquipment: Actions.Creators.addEquipmentRequest,
  deleteEquipment: Actions.Creators.deleteEquipmentRequest,
  editEquipment: Actions.Creators.editEquipmentRequest,
  loadMasters: MasterActions.Creators.loadMastersRequest,
  loadPosts: Actions.Creators.loadPostsRequest,

  loadDowntime: Actions.Creators.loadReasonRequest,
  addDowntime: Actions.Creators.addDowntimeRequest,
  editDowntime: Actions.Creators.editDowntimeRequest,


  loadWelder: ActionsWelder.Creators.loadExecutorsRequest,


};

export default connect(mapStateToProps, mapDispatchToProps)(EquipmentPage);
