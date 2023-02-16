import { connect } from "react-redux";
import { WorkPlacePage } from "pages/WorkPlace";
import Actions from "store/workplace/actions";
import ActionsExecuters from "store/executors/actions";
import MasterActions from "store/workplace/actions";

const mapStateToProps = (state) => {
  return {
    masters: state.executors.masters,
    techs: state.executors.techs,
    executors: state.executors.executors,
    isRequesting:
      state?.equipment?.isRequesting || state?.masters?.isRequesting,
    userRole: state.auth.user.role,

    ///Цеха 
    workshop: state.workplace.workshop,
    ///Производственные участки 
    area: state.workplace.productionArea,
    ///Посты
    posts: state.workplace.posts,
    ///Рабочие места
    workplace: state.workplace.workplace,
    ///Изделия
    product: state.workplace.product,
    ///Узлы
    knot: state.workplace.knot,
    ///Детали
    detail: state.workplace.detail,
    ///Сварные швы
    seam: state.workplace.seam,
    
    texprocwelding:state.texprocwelding.texprocwelding,

    detailbyinspector:state,


    weldingtask:state.workplace.weldingtask,

  };
};
const mapDispatchToProps = {

  getDetailByInspector: Actions.Creators.loadDetailbyinspectorRequest,


  addFixedProduct: Actions.Creators.loadfixedRequest,


  loadMasters: ActionsExecuters.Creators.loadMastersRequest,
  loadTechs: ActionsExecuters.Creators.loadTechsRequest,
  loadExecutors: ActionsExecuters.Creators.loadExecutorsRequest,

  ///Цеха 
  loadWorkshop: Actions.Creators.loadWorkshopRequest,
  addWorkshop: Actions.Creators.addWorkshopRequest,
  editWorkshop: Actions.Creators.editWorkshopRequest,
  ///Производственные участки 
  loadArea: Actions.Creators.loadAreaRequest,
  addArea: Actions.Creators.addAreaRequest,
  editArea: Actions.Creators.editAreaRequest,
  ///Посты
  loadPosts: Actions.Creators.loadPostsRequest,
  addPosts: Actions.Creators.addPostsRequest,
  editPosts: Actions.Creators.editPostsRequest,
  ///Рабочие места
  loadWorkplace: Actions.Creators.loadWorkplaceRequest,
  addWorkplace: Actions.Creators.addWorkplaceRequest,
  editWorkplace: Actions.Creators.editWorkplaceRequest,
  ///Изделия
  loadProduct: Actions.Creators.loadProductRequest,
  addProduct:Actions.Creators.addProductRequest,
  editProduct:Actions.Creators.editProductRequest, 
  ///Узлы
  loadKnot: Actions.Creators.loadKnotRequest,
  addKnot:Actions.Creators.addKnotRequest,
  editKnot:Actions.Creators.editKnotRequest,
  ///Детали
  loadDetail: Actions.Creators.loadDetailRequest,
  addDetail:Actions.Creators.addDetailRequest,
  editDetail:Actions.Creators.editDetailRequest,
  ///Сварные швы
  loadSeam: Actions.Creators.loadSeamRequest,
  addSeam:Actions.Creators.addSeamRequest,
  editSeam:Actions.Creators.editSeamRequest,
  ///Технологические процессы 
  loadTexprocwelding: Actions.Creators.loadTexprocweldingRequest,


  ////
  loadWeldingTask: Actions.Creators.loadWeldingtaskRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(WorkPlacePage);
