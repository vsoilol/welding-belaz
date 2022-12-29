import { connect } from "react-redux";
import { ExecutorsPage } from "pages/ExecutorsPage";
import Actions from "store/executors/actions";

const mapStateToProps = (state) => {
  return {
    masters: state.executors.masters,
    techs: state.executors.techs,
    executors: state.executors.executors,
    isRequesting: state.executors.isRequesting,
    userRole: state.auth.user.role,
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
};

export default connect(mapStateToProps, mapDispatchToProps)(ExecutorsPage);
