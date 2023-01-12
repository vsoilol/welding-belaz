import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({

  ///Цеха 
  loadWorkshopRequest: ["payload"],
  loadWorkshopSuccess: ["workshop"],
  loadWorkshopFailure: ["error"],

  addWorkshopRequest: ["payload"],
  addWorkshopSuccess: ["workshop"],
  addWorkshopFailure: ["error"],

  editWorkshopRequest: ["payload"],
  editWorkshopSuccess: ["workshop"],
  editWorkshopFailure: ["error"],

  ///Производственные участки 
  loadAreaRequest: ["payload"],
  loadAreaSuccess: ["productionArea"],
  loadAreaFailure: ["error"],

  addAreaRequest: ["payload"],
  addAreaSuccess: ["productionArea"],
  addAreaFailure: ["error"],

  editAreaRequest: ["payload"],
  editAreaSuccess: ["productionArea"],
  editAreaFailure: ["error"],
  ///Посты
  loadPostsRequest: ["payload"],
  loadPostsSuccess: ["posts"],
  loadPostsFailure: ["error"],

  addPostsRequest: ["payload"],
  addPostsSuccess: ["posts"],
  addPostsFailure: ["error"],

  editPostsRequest: ["payload"],
  editPostsSuccess: ["posts"],
  editPostsFailure: ["error"],

  ///Рабочие места
  loadWorkplaceRequest: ["payload"],
  loadWorkplaceSuccess: ["workplace"],
  loadWorkplaceFailure: ["error"],

  addWorkplaceRequest: ["payload"],
  addWorkplaceSuccess: ["workplace"],
  addWorkplaceFailure: ["error"],

  editWorkplaceRequest: ["payload"],
  editWorkplaceSuccess: ["workplace"],
  editWorkplaceFailure: ["error"],

  ///Изделия
  loadProductRequest: ["payload"],
  loadProductSuccess: ["product"],
  loadProductFailure: ["error"],

  addProductRequest: ["payload"],
  addProductSuccess: ["product"],
  addProductFailure: ["error"],

  editProductRequest: ["payload"],
  editProductSuccess: ["product"],
  editProductFailure: ["error"],

  ///Узлы
  loadKnotRequest: ["payload"],
  loadKnotSuccess: ["knot"],
  loadKnotFailure: ["error"],

  addKnotRequest: ["payload"],
  addKnotSuccess: ["knot"],
  addKnotFailure: ["error"],

  editKnotRequest: ["payload"],
  editKnotSuccess: ["knot"],
  editKnotFailure: ["error"],

  ///Детали
  loadDetailRequest: ["payload"],
  loadDetailSuccess: ["detail"],
  loadDetailFailure: ["error"],

  addDetailRequest: ["payload"],
  addDetailSuccess: ["detail"],
  addDetailFailure: ["error"],

  editDetailRequest: ["payload"],
  editDetailSuccess: ["detail"],
  editDetailFailure: ["error"],

  ///Сварные швы
  loadSeamRequest: ["payload"],
  loadSeamSuccess: ["seam"],
  loadSeamFailure: ["error"],

  addSeamRequest: ["payload"],
  addSeamSuccess: ["seam"],
  addSeamFailure: ["error"],

  editSeamRequest: ["payload"],
  editSeamSuccess: ["seam"],
  editSeamFailure: ["error"],



  ///Технологические процессы 
  loadTexprocweldingRequest: ["payload"],
  loadTexprocweldingSuccess: ["texprocwelding"],
  loadTexprocweldingFailure: ["error"],

});

const workplaceActions = {
  Types,
  Creators
};

export default workplaceActions;
