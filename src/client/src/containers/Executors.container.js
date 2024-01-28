import { connect } from "react-redux";
import { ExecutorsPage } from "pages/ExecutorsPage";
import Actions from "store/executors/actions";
import Actions2 from "store/workplace/actions";

const mapStateToProps = (state) => {
  return {
    masters: state.executors.masters,
    techs: state.executors.techs,
    executors: state.executors.executors,
    isRequesting: state.executors.isRequesting,
    userRole: state.auth.user.role,
    user: state.auth.user,

    equipment: state.equipment.equipment[0],
    ///Цеха
    workshop: state.workplace.workshop,
    ///Производственные участки
    area: state.workplace.productionArea,

    workplace: state.workplace.workplace,

    state: state,
  };
};

const mapDispatchToProps = {
  loadExecutors: Actions.Creators.loadExecutorsRequest,
  addExecutor: Actions.Creators.addExecutorRequest,
  deleteExecutor: Actions.Creators.deleteExecutorRequest,
  editExecutor: Actions.Creators.editExecutorRequest,
  loadMasters: Actions.Creators.loadMastersRequest,
  addMaster: Actions.Creators.addMasterRequest,
  deleteMaster: Actions.Creators.deleteMasterRequest,
  editMaster: Actions.Creators.editMasterRequest,
  loadTechs: Actions.Creators.loadTechsRequest,
  addTech: Actions.Creators.addTechRequest,
  deleteTech: Actions.Creators.deleteTechRequest,
  editTech: Actions.Creators.editTechRequest,

  loadEquipment: Actions.Creators.loadEquipmentRequest,
  ///Цеха
  loadWorkshop: Actions.Creators.loadWorkshopRequest,
  ///Производственные участки
  loadArea: Actions.Creators.loadAreaRequest,
  loadPlace: Actions2.Creators.loadWorkplaceRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(ExecutorsPage);
