import { connect } from "react-redux";
import { TasksPage } from "pages/Tasks";
import Actions from "store/tasks/actions";
import ExecutorsActions from "store/executors/actions";
import InstructionsActions from "store/instructions/actions";
import EquipmentActions from "store/equipment/actions";
import WorkplaceActions from "store/workplace/actions";

const mapStateToProps = (state) => {
  return {
    tasks: state.tasks.tasks,
    masters: state.executors.masters,
    executors: state.executors.executors,
    techs: state.executors.techs,
    instructions: state.instructions.instructions,
    equipment: state.equipment.equipment,
    isRequesting:
      state?.tasks?.isRequesting ||
      state?.instructions?.isRequesting ||
      state?.techs?.isRequesting,
    userRole: state.auth.user.role,
    info: state.tasks.info,
    ///Сварные швы
    seam: state.workplace.seam,
    ///Изделия
    product: state.workplace.product,
    ///Узлы
    knot: state.workplace.knot,
    ///Детали
    detail: state.workplace.detail,
  };
};
const mapDispatchToProps = {

  loadProduct: WorkplaceActions.Creators.loadProductRequest,
  loadKnot: WorkplaceActions.Creators.loadKnotRequest,
  loadDetail: WorkplaceActions.Creators.loadDetailRequest,



  loadTasks: Actions.Creators.loadTasksRequest,
  loadInfo: Actions.Creators.loadInfoRequest,
  addTask: Actions.Creators.addTaskRequest,
  deleteTask: Actions.Creators.deleteTaskRequest,
  editTask: Actions.Creators.editTaskRequest,
  loadExecutors: ExecutorsActions.Creators.loadExecutorsRequest,
  loadMasters: ExecutorsActions.Creators.loadMastersRequest,
  loadTechs: ExecutorsActions.Creators.loadTechsRequest,
  loadInstructions: InstructionsActions.Creators.loadInstructionsRequest,
  loadEquipment: EquipmentActions.Creators.loadEquipmentRequest,
  ///Сварные швы
  loadSeam: Actions.Creators.loadSeamRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(TasksPage);
