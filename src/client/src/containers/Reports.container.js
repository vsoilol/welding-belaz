import { connect } from "react-redux";
import { ReportsPage } from "pages/ReportsPage";
import Actions from "store/records/actions";
import workplaceActions from "store/workplace/actions";
import executersActions from "store/executors/actions";
import equipmentActions from "store/equipment/actions"; 
const mapStateToProps = (state) => {
  return {
    workshop: state.workplace.workshop,
    area: state.workplace.productionArea,
    seam: state.workplace.seam,
    product: state.workplace.product,

    workplace: state.workplace.workplace,
    executors: state.executors.executors,
    equipment: state.equipment.equipment,
  };
};

const mapDispatchToProps = { 
  loadEquipment: equipmentActions.Creators.loadEquipmentRequest, 
  loadExecutors: executersActions.Creators.loadExecutorsRequest,
  loadWorkshop:workplaceActions.Creators.loadWorkshopRequest,
  loadProduct: workplaceActions.Creators.loadProductRequest,
  loadArea: workplaceActions.Creators.loadAreaRequest,
  loadSeam: workplaceActions.Creators.loadSeamRequest,
  loadWorkplace: workplaceActions.Creators.loadWorkplaceRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(ReportsPage);
