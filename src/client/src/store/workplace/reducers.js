import { createReducer } from "reduxsauce";
import actions from "./actions";
import { flattenObject } from "services/makeFlat";

const { Types } = actions;
const INITIAL_STATE = {
  isRequesting: false,
  workplace: [],
  error: null,
};

const request = (state = INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    error: null,
  };
};
///Цеха 
const loadWorkshopSuccess = (state = INITIAL_STATE, { workshop }) => {
  return {
    ...state,
    isRequesting: false,
    workshop,
  };
};
const addWorkshopSuccess = (state = INITIAL_STATE, { workshop }) => { 
  return {
    ...state,
    isRequesting: false,
    workshop: [...state.workshop, workshop],
  };
};
const editWorkshopSuccess = (state = INITIAL_STATE, { workshop }) => { 
  
   
  return {
    ...state,
    isRequesting: false,
    workshop: state.workshop?.map((shop) => {  
      if (shop.id===workshop.id) {
         shop.name=workshop.name
         shop.id=workshop.id
         shop.number=workshop.number 
      }
      return  shop;
    }),
  };
};
///Производственные участки 
const loadAreaSuccess = (state = INITIAL_STATE, { productionArea }) => {
  return {
    ...state,
    isRequesting: false,
    productionArea,
  };
};
const addAreaSuccess = (state = INITIAL_STATE, { productionArea }) => { 
  return {
    ...state,
    isRequesting: false,
    productionArea: [...state.productionArea, productionArea],
  };
};
const editAreaSuccess = (state = INITIAL_STATE, { productionArea }) => {

  return {
    ...state,
    isRequesting: false,
    productionArea: state.productionArea?.map((Area) => {   
      if (Area.id===productionArea.id) {
        Area.name=productionArea.name
        Area.id=productionArea.id
        Area.number=productionArea.number  
      }
      return  Area;
    }),
  };
};
///Посты
const loadPostsSuccess = (state = INITIAL_STATE, { posts }) => {
  return {
    ...state,
    isRequesting: false,
    posts,
  };
};
const addPostsSuccess = (state = INITIAL_STATE, { posts }) => { 
  return {
    ...state,
    isRequesting: false,
    posts: [...state.posts, posts],
  };
};
const editPostsSuccess = (state = INITIAL_STATE, { posts }) => {
  return {
    ...state,
    isRequesting: false,
    posts: state.posts?.map((Posts) => {   
      if (Posts.id===posts.id) {
        Posts.name=posts.name
        Posts.id=posts.id
        Posts.number=posts.number  
      }
      return  Posts;
    }),
  };
};
///Рабочие места
const loadWorkplaceSuccess = (state = INITIAL_STATE, { workplace }) => {
  return {
    ...state,
    isRequesting: false,
    workplace,
  };
};
const addWorkplaceSuccess = (state = INITIAL_STATE, { workplace }) => { 
  return {
    ...state,
    isRequesting: false,
    workplace: [...state.workplace, workplace],
  };
};
const editWorkplaceSuccess = (state = INITIAL_STATE, { workplace }) => {
  return {
    ...state,
    isRequesting: false,
    workplace: state.workplace?.map((Place) => {   
      if (Place.id===workplace.id) {
        Place.name=workplace.name
        Place.id=workplace.id
        Place.number=workplace.number  
      }
      return  Place;
    }),
  };
};
///Изделия
const loadProductSuccess = (state = INITIAL_STATE, { product }) => { 
  return {
    ...state,
    isRequesting: false,
    product,
  };
};
const addProductSuccess = (state = INITIAL_STATE, { product }) => {  
  console.log(product)
  console.log(state.product)
  window.location.reload()
  return {
    ...state,
    isRequesting: false,
    product: state.product?.map((Product) => {   
      if (Product.id===product.id) {
        Product.name=product.name
        Product.id=product.id
        Product.number=product.number   
        Product.workshop.number=product.workshopNumber   
        Product.productionArea.number=product.productionAreaNumber   
        Product.technologicalProcess={
          id:product.technologicalProcessId,
          name:product.technologicalProcessName,
          number:product.technologicalProcessNumber
        }
      }
      return  Product;
    }),
  };
};
const editProductSuccess = (state = INITIAL_STATE, { product }) => {  
  console.log(product)
  console.log(state.product)
 
  return {
    ...state,
    isRequesting: false,
    product: state.product?.map((Product) => {   
      if (Product.id===product.id) {
        Product.name=product.name
        Product.id=product.id
        Product.number=product.number   
        Product.workshop.number=product.workshopNumber   
        Product.productionArea.number=product.productionAreaNumber   
        Product.technologicalProcess={
          id:product.technologicalProcessId,
          name:product.technologicalProcessName,
          number:product.technologicalProcessNumber
        }
      }
      return  Product;
    }),
  };
  // return {
  //   ...state,
  //   isRequesting: false,
  //   product: [...state.product, product],
  // };
};
///Узлы
const loadKnotSuccess = (state = INITIAL_STATE, { knot }) => {
  return {
    ...state,
    isRequesting: false,
    knot,
  };
};
const addKnotSuccess = (state = INITIAL_STATE, { knot }) => { 
  console.log(knot)
  console.log(state.knot)
  window.location.reload()
  return {
    ...state,
    isRequesting: false,
    knot: state.knot?.map((Knot) => {   
      if (Knot.id===knot.id) {
        Knot.name=knot.name
        Knot.id=knot.id
        Knot.number=knot.number   
        Knot.workshop.number=knot.workshopNumber   
        Knot.productionArea.number=knot.productionAreaNumber   
        Knot.technologicalProcess={
          id:knot.technologicalProcessId,
          name:knot.technologicalProcessName,
          number:knot.technologicalProcessNumber
        }
      }
      return  Knot;
    }),
  };
};
const editKnotSuccess = (state = INITIAL_STATE, { knot }) => {
  console.log(knot)
  console.log(state.knot) 
  return {
    ...state,
    isRequesting: false,
    knot: state.knot?.map((Knot) => {   
      if (Knot.id===knot.id) {
        Knot.name=knot.name
        Knot.id=knot.id
        Knot.number=knot.number   
        Knot.workshop.number=knot.workshopNumber   
        Knot.productionArea.number=knot.productionAreaNumber   
        Knot.technologicalProcess={
          id:knot.technologicalProcessId,
          name:knot.technologicalProcessName,
          number:knot.technologicalProcessNumber
        }
      }
      return  Knot;
    }),
  };
};
///Детали
const loadDetailSuccess = (state = INITIAL_STATE, { detail }) => {
  return {
    ...state,
    isRequesting: false,
    detail,
  };
};
const addDetailSuccess = (state = INITIAL_STATE, { detail }) => { 
  console.log(detail)
  console.log(state.detail)
  window.location.reload()
  return {
    ...state,
    isRequesting: false,
    detail: state.detail?.map((Detail) => {   
      if (Detail.id===detail.id) {
        Detail.name=detail.name
        Detail.id=detail.id
        Detail.number=detail.number   
        Detail.workshop.number=detail.workshopNumber   
        Detail.productionArea.number=detail.productionAreaNumber   
        Detail.technologicalProcess={
          id:detail.technologicalProcessId,
          name:detail.technologicalProcessName,
          number:detail.technologicalProcessNumber
        }
      }
      return  Detail;
    }),
  };
};
const editDetailSuccess = (state = INITIAL_STATE, { detail }) => {
  console.log(detail)
  console.log(state.detail) 
  return {
    ...state,
    isRequesting: false,
    detail: state.detail?.map((Detail) => {   
      if (Detail.id===detail.id) {
        Detail.name=detail.name
        Detail.id=detail.id
        Detail.number=detail.number   
        Detail.workshop.number=detail.workshopNumber   
        Detail.productionArea.number=detail.productionAreaNumber   
        Detail.technologicalProcess={
          id:detail.technologicalProcessId,
          name:detail.technologicalProcessName,
          number:detail.technologicalProcessNumber
        }
      }
      return  Detail;
    }),
  };
};
///Сварные швы
const loadSeamSuccess = (state = INITIAL_STATE, { seam }) => {
  return {
    ...state,
    isRequesting: false,
    seam,
  };
};
const addSeamSuccess = (state = INITIAL_STATE, { seam }) => { 
  return {
    ...state,
    isRequesting: false,
    seam: [...state.seam, seam],
  };
};
const editSeamSuccess = (state = INITIAL_STATE, { seam }) => {
  return {
    ...state,
    isRequesting: false,
    seam: [...state.seam, seam],
  };
};
///Технологические процессы 
const loadTexprocweldingSuccess = (state = INITIAL_STATE, { texprocwelding }) => {
  return {
    ...state,
    isRequesting: false,
    texprocwelding,
  };
};



const failure = (state = INITIAL_STATE, { error }) => {
  console.log(error)
  return {
    ...state,
    isRequesting: false,
    error,
  };
};


export const HANDLERS = {
  ///Цеха 
  [Types.LOAD_WORKSHOP_REQUEST]: request,
  [Types.LOAD_WORKSHOP_SUCCESS]: loadWorkshopSuccess,
  [Types.LOAD_WORKSHOP_FAILURE]: failure,

  [Types.ADD_WORKSHOP_REQUEST]: request,
  [Types.ADD_WORKSHOP_SUCCESS]: addWorkshopSuccess,
  [Types.ADD_WORKSHOP_FAILURE]: failure,

  [Types.EDIT_WORKSHOP_REQUEST]: request,
  [Types.EDIT_WORKSHOP_SUCCESS]: editWorkshopSuccess,
  [Types.EDIT_WORKSHOP_FAILURE]: failure,
  ///Производственные участки 
  [Types.LOAD_AREA_REQUEST]: request,
  [Types.LOAD_AREA_SUCCESS]: loadAreaSuccess,
  [Types.LOAD_AREA_FAILURE]: failure,

  [Types.ADD_AREA_REQUEST]: request,
  [Types.ADD_AREA_SUCCESS]: addAreaSuccess,
  [Types.ADD_AREA_FAILURE]: failure,

  [Types.EDIT_AREA_REQUEST]: request,
  [Types.EDIT_AREA_SUCCESS]: editAreaSuccess,
  [Types.EDIT_AREA_FAILURE]: failure,
  ///Посты
  [Types.LOAD_POSTS_REQUEST]: request,
  [Types.LOAD_POSTS_SUCCESS]: loadPostsSuccess,
  [Types.LOAD_POSTS_FAILURE]: failure,

  [Types.ADD_POSTS_REQUEST]: request,
  [Types.ADD_POSTS_SUCCESS]: addPostsSuccess,
  [Types.ADD_POSTS_FAILURE]: failure,

  [Types.EDIT_POSTS_REQUEST]: request,
  [Types.EDIT_POSTS_SUCCESS]: editPostsSuccess,
  [Types.EDIT_POSTS_FAILURE]: failure,
  ///Рабочие места
  [Types.LOAD_WORKPLACE_REQUEST]: request,
  [Types.LOAD_WORKPLACE_SUCCESS]: loadWorkplaceSuccess,
  [Types.LOAD_WORKPLACE_FAILURE]: failure,

  [Types.ADD_WORKPLACE_REQUEST]: request,
  [Types.ADD_WORKPLACE_SUCCESS]: addWorkplaceSuccess,
  [Types.ADD_WORKPLACE_FAILURE]: failure,

  [Types.EDIT_WORKPLACE_REQUEST]: request,
  [Types.EDIT_WORKPLACE_SUCCESS]: editWorkplaceSuccess,
  [Types.EDIT_WORKPLACE_FAILURE]: failure,
  ///Изделия
  [Types.LOAD_PRODUCT_REQUEST]: request,
  [Types.LOAD_PRODUCT_SUCCESS]: loadProductSuccess,
  [Types.LOAD_PRODUCT_FAILURE]: failure,

  [Types.ADD_PRODUCT_REQUEST]: request,
  [Types.ADD_PRODUCT_SUCCESS]: addProductSuccess,
  [Types.ADD_PRODUCT_FAILURE]: failure,

  [Types.EDIT_PRODUCT_REQUEST]: request,
  [Types.EDIT_PRODUCT_SUCCESS]: editProductSuccess,
  [Types.EDIT_PRODUCT_FAILURE]: failure,
  ///Узлы
  [Types.LOAD_KNOT_REQUEST]: request,
  [Types.LOAD_KNOT_SUCCESS]: loadKnotSuccess,
  [Types.LOAD_KNOT_FAILURE]: failure,

  [Types.ADD_KNOT_REQUEST]: request,
  [Types.ADD_KNOT_SUCCESS]: addKnotSuccess,
  [Types.ADD_KNOT_FAILURE]: failure,

  [Types.EDIT_KNOT_REQUEST]: request,
  [Types.EDIT_KNOT_SUCCESS]: editKnotSuccess,
  [Types.EDIT_KNOT_FAILURE]: failure,
  ///Детали
  [Types.LOAD_DETAIL_REQUEST]: request,
  [Types.LOAD_DETAIL_SUCCESS]: loadDetailSuccess,
  [Types.LOAD_DETAIL_FAILURE]: failure,
  
  [Types.ADD_DETAIL_REQUEST]: request,
  [Types.ADD_DETAIL_SUCCESS]: addDetailSuccess,
  [Types.ADD_DETAIL_FAILURE]: failure,

  [Types.EDIT_DETAIL_REQUEST]: request,
  [Types.EDIT_DETAIL_SUCCESS]: editDetailSuccess,
  [Types.EDIT_DETAIL_FAILURE]: failure,
  ///Сварные швы
  [Types.LOAD_SEAM_REQUEST]: request,
  [Types.LOAD_SEAM_SUCCESS]: loadSeamSuccess,
  [Types.LOAD_SEAM_FAILURE]: failure,

  [Types.ADD_SEAM_REQUEST]: request,
  [Types.ADD_SEAM_SUCCESS]: addSeamSuccess,
  [Types.ADD_SEAM_FAILURE]: failure,

  [Types.EDIT_SEAM_REQUEST]: request,
  [Types.EDIT_SEAM_SUCCESS]: editSeamSuccess,
  [Types.EDIT_SEAM_FAILURE]: failure,
  ///Технологические процессы 
  [Types.LOAD_TEXPROCWELDING_REQUEST]: request,
  [Types.LOAD_TEXPROCWELDING_SUCCESS]: loadTexprocweldingSuccess,
  [Types.LOAD_TEXPROCWELDING_FAILURE]: failure,
};

export default createReducer(INITIAL_STATE, HANDLERS);
