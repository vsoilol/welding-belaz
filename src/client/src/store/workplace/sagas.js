import { takeLatest, call, put } from "redux-saga/effects";
import api from "services/api";
import workplaceActions from "./actions";
import errorActions from "../error/actions";

const {
  Types: {
    ///Цеха 
    LOAD_WORKSHOP_REQUEST,
    ADD_WORKSHOP_REQUEST,
    EDIT_WORKSHOP_REQUEST,
    ///Производственные участки 
    LOAD_AREA_REQUEST,
    ADD_AREA_REQUEST,
    EDIT_AREA_REQUEST,
    ///Посты
    LOAD_POSTS_REQUEST,
    ADD_POSTS_REQUEST,
    EDIT_POSTS_REQUEST,
    ///Рабочие места
    LOAD_WORKPLACE_REQUEST,
    ADD_WORKPLACE_REQUEST,
    EDIT_WORKPLACE_REQUEST,
    ///Изделия
    LOAD_PRODUCT_REQUEST,
    ADD_PRODUCT_REQUEST,
    EDIT_PRODUCT_REQUEST,
    ///Узлы
    LOAD_KNOT_REQUEST,
    ADD_KNOT_REQUEST,
    EDIT_KNOT_REQUEST,
    ///Детали
    LOAD_DETAIL_REQUEST,
    ADD_DETAIL_REQUEST,
    EDIT_DETAIL_REQUEST,
    ///Сварные швы
    LOAD_SEAM_REQUEST,
    ADD_SEAM_REQUEST,
    EDIT_SEAM_REQUEST,
     ///Технологические процессы 
     LOAD_TEXPROCWELDING_REQUEST,
  },
  Creators: {
    ///Цеха 
    loadWorkshopSuccess,
    loadWorkshopFailure,

    addWorkshopSuccess,
    addWorkshopFailure,

    editWorkshopSuccess,
    editWorkshopFailure,
    ///Производственные участки 
    loadAreaSuccess,
    loadAreaFailure,

    addAreaSuccess,
    addAreaFailure,

    editAreaSuccess,
    editAreaFailure,
    ///Посты
    loadPostsSuccess,
    loadPostsFailure,

    addPostsSuccess,
    addPostsFailure,

    editPostsSuccess,
    editPostsFailure,
    ///Рабочие места 
    loadWorkplaceSuccess,
    loadWorkplaceFailure,

    addWorkplaceSuccess,
    addWorkplaceFailure,

    editWorkplaceSuccess,
    editWorkplaceFailure,
    ///Изделия
    loadProductSuccess,
    loadProductFailure,

    addProductSuccess,
    addProductFailure,

    editProductSuccess,
    editProductFailure,
    ///Узлы
    loadKnotSuccess,
    loadKnotFailure,

    addKnotSuccess,
    addKnotFailure,

    editKnotSuccess,
    editKnotFailure,
    ///Детали
    loadDetailSuccess,
    loadDetailFailure,

    addDetailSuccess,
    addDetailFailure,

    editDetailSuccess,
    editDetailFailure,
    ///Сварные швы
    loadSeamSuccess,
    loadSeamFailure,

    addSeamSuccess,
    addSeamFailure,

    editSeamSuccess,
    editSeamFailure,
     ///Технологические процессы 
     loadTexprocweldingSuccess,
     loadTexprocweldingFailure,
  },
} = workplaceActions;

const {
  Creators: { setError },
} = errorActions;
///Цеха 
function* loadWorkshop() {
  try {
    const { data } = yield call(api.get, `/Workshop`); 
    yield put(loadWorkshopSuccess(data));
  } catch (error) {
    yield put(loadWorkshopFailure(error));
    yield put(setError(error.message));
  }
}
function* addWorkshop(variables) {
  try { 
    const { data } = yield call(api.post, `/Workshop`, {
      "name": variables.payload.name,
      "number": variables.payload.number
    });
    window.location.reload() 
    // yield put(addWorkshopSuccess(data));
  } catch (error) {
    yield put(addWorkshopFailure(error));
    yield put(setError(error.message));
  }
}
function* editWorkshop(variables) {
  try { 
    const { data } = yield call(api.put, `/Workshop`, {
      "id":variables.payload.id,
      "name": variables.payload.name,
      "number": variables.payload.number
    });
    window.location.reload() 
    // yield put(editWorkshopSuccess(variables.payload));
  } catch (error) {
    yield put(editWorkshopFailure(error));
    yield put(setError(error.message));
  }
}
///Производственные участки 
function* loadArea() {
  try {
    const { data } = yield call(api.get, `/ProductionArea`);
    yield put(loadAreaSuccess(data));
  } catch (error) {
    yield put(loadAreaFailure(error));
    yield put(setError(error.message));
  }
}
function* addArea(variables) {
  try { 
    const { data } = yield call(api.post, `/ProductionArea`, {
      "name": variables.payload.name,
      "number": variables.payload.number,
      "workshopId": variables.payload.workshopId
    });
    window.location.reload()
    //  yield put(addAreaSuccess(data));
  } catch (error) {
    yield put(addAreaFailure(error));
    yield put(setError(error.message));
  }
}
function* editArea(variables) {
  try { 
    const { data } = yield call(api.put, `/ProductionArea`, {
      "id":variables.payload.id,
      "name": variables.payload.name,
      "number": variables.payload.number,
      "workshopId": variables.payload.workshopId
    });
    window.location.reload()
    // yield put(editAreaSuccess(variables.payload));
  } catch (error) {
    yield put(editAreaFailure(error));
    yield put(setError(error.message));
  }
}
///Посты
function* loadPosts() {
  try {
    const { data } = yield call(api.get, `/post`);
    yield put(loadPostsSuccess(data));
  } catch (error) {
    yield put(loadPostsFailure(error));
    yield put(setError(error.message));
  }
}
function* addPosts(variables) {
  try { 
    const { data } = yield call(api.post, `/post`, 
    {
      "number": variables.payload.number,
      "productionAreaId": variables.payload.productionAreaId
    }
    );
    window.location.reload()
    // yield put(addPostsSuccess(data));
  } catch (error) {
    yield put(addPostsFailure(error));
    yield put(setError(error.message));
  }
}
function* editPosts(variables) {
  try { 
    const { data } = yield call(api.put, `/post`, {
      "id":variables.payload.id, 
      "number": variables.payload.number,
      "productionAreaId": variables.payload.productionAreaId
    });
    window.location.reload()
    // yield put(editPostsSuccess(variables.payload));
  } catch (error) {
    yield put(editPostsFailure(error));
    yield put(setError(error.message));
  }
}
///Рабочие места
function* loadWorkplace() {
  try {
    const { data } = yield call(api.get, `/Workplace`);
    yield put(loadWorkplaceSuccess(data));
  } catch (error) {
    yield put(loadWorkplaceFailure(error));
    yield put(setError(error.message));
  }
}
function* addWorkplace(variables) {
  try { 
    const { data } = yield call(api.post, `/Workplace`, 
    {
      "number": variables.payload.number,
      "postId": variables.payload.postId,
      "productionAreaId": variables.payload.productionAreaId
    }
    );
    window.location.reload()
    // yield put(addWorkplaceSuccess(data));
  } catch (error) {
    yield put(addWorkplaceFailure(error));
    yield put(setError(error.message));
  }
}
function* editWorkplace(variables) {
  try { 
    const { data } = yield call(api.put, `/Workplace`, {
      "id": variables.payload.id,
      "number": variables.payload.number,
      "postId": variables.payload.postId,
      "productionAreaId": variables.payload.productionAreaId
    });
    window.location.reload()
    // yield put(editWorkplaceSuccess(variables.payload));
  } catch (error) {
    yield put(editWorkplaceFailure(error));
    yield put(setError(error.message));
  }
}






///Изделия
function* loadProduct() {
  try {
    const { data } = yield call(api.get, `/product/byControlSubject/true`);
    yield put(loadProductSuccess(data));
  } catch (error) {
    yield put(loadProductFailure(error));
    yield put(setError(error.message));
  }
}
function* addProduct(variables) {
  try {
   
    const { data } = yield call(api.post, `/product`, {
      "name": variables.payload.name,
      "number": variables.payload.number,
      "isControlSubject": true,
      "productionAreaId": variables.payload.productionAreaId,
      "workplaceId": variables.payload.workplaceId,
      "technologicalProcessId": variables.payload.technologicalProcessId, 
    });
    window.location.reload() 
    // yield put(addProductSuccess(variables));
  } catch (error) {
    yield put(addProductFailure(error));
    yield put(setError(error.message));
  }
}
function* editProduct(variables) {
  try { 
    const { data } = yield call(api.put, `/product`, {
      "id": variables.payload.id,
      "name": variables.payload.name,
      "number": variables.payload.number,
      "isControlSubject": true,
      "productionAreaId": variables.payload.productionAreaId,
      "workplaceId": variables.payload.workplaceId,
      "technologicalProcessId": variables.payload.technologicalProcessId, 
    });
    window.location.reload()
    // yield put(editProductSuccess(variables.payload));
  } catch (error) {
    yield put(editProductFailure(error));
    yield put(setError(error.message));
  }
}
///Узлы
function* loadKnot() {
  try {
    const { data } = yield call(api.get, `/knot/byControlSubject/false`);
    yield put(loadKnotSuccess(data));
  } catch (error) {
    yield put(loadKnotFailure(error));
    yield put(setError(error.message));
  }
}
function* addKnot(variables) {
  
  try { 
    const { data } = yield call(api.post, `/knot`, {
      "name":variables.payload.name,
      "number":Number( variables.payload.number),
      "isControlSubject": false,
      "productionAreaId": variables.payload.productionAreaId,
      "workplaceId": variables.payload.workplaceId,
      "technologicalProcessId":  variables.payload.technologicalProcessId,
    });
    window.location.reload()
    // yield put(addKnotSuccess(variables.payload));
  } catch (error) {
    yield put(addKnotFailure(error));
    yield put(setError(error.message));
  }
}
function* editKnot(variables) {
  try {  
    const { data } = yield call(api.put, `/knot`, {
      "id": variables.payload.id,
      "name": variables.payload.name,
      "number":Number( variables.payload.number),
      "isControlSubject": false,
      "productionAreaId": variables.payload.productionAreaId,
      "technologicalProcessId": variables.payload.technologicalProcessId,
      "workplaceId": variables.payload.workplaceId,
    });
    window.location.reload()
    // yield put(editKnotSuccess(variables.payload));
  } catch (error) {
    yield put(editKnotFailure(error));
    yield put(setError(error.message));
  }
}
///Детали
function* loadDetail() {
  try {
    const { data } = yield call(api.get, `/detail/byControlSubject/true`);
    yield put(loadDetailSuccess(data));
  } catch (error) {
    yield put(loadDetailFailure(error));
    yield put(setError(error.message));
  }
}
function* addDetail(variables) {
  try {  
    const { data } = yield call(api.post, `/detail`, {
      "name": variables.payload.name,
      "number": variables.payload.number,
      "isControlSubject": true,  
      "productionAreaId": variables.payload.productionAreaId,
      "workplaceId": variables.payload.workplaceId,
      "technologicalProcessId": variables.payload.technologicalProcessId, 
    }); 
    window.location.reload()
    // yield put(addDetailSuccess(variables.payload));
  } catch (error) {
    yield put(addDetailFailure(error));
    yield put(setError(error.message));
  }
}
function* editDetail(variables) {
  try {  
    const { data } = yield call(api.put, `/detail`, {
      "id": variables.payload.id,
      "name": variables.payload.name,
      "number": variables.payload.number,
      "isControlSubject": true,  
      "productionAreaId": variables.payload.productionAreaId,
      "workplaceId": variables.payload.workplaceId,
      "technologicalProcessId": variables.payload.technologicalProcessId, 
    });
    window.location.reload()
    // yield put(editDetailSuccess(variables.payload));
  } catch (error) {
    yield put(editDetailFailure(error));
    yield put(setError(error.message));
  }
}

///Сварные швы
function* loadSeam() {
  try {
    const { data } = yield call(api.get, `/seam/byControlSubject/true`);
    yield put(loadSeamSuccess(data));
  } catch (error) {
    yield put(loadSeamFailure(error));
    yield put(setError(error.message));
  }
}
function* addSeam(variables) {
  try {
    console.log(variables.payload)
    // const { data } = yield call(api.post, `/knot`, variables);
    // yield put(addDetailSuccess(data));
  } catch (error) {
    // yield put(addDetailFailure(error));
    // yield put(setError(error.message));
  }
}
function* editSeam(variables) {
  try {
    console.log(variables.payload)
    // const { data } = yield call(api.post, `/knot`, variables);
    // yield put(editDetailSuccess(data));
  } catch (error) {
    // yield put(editDetailFailure(error));
    // yield put(setError(error.message));
  }
}
///Технологические процессы 
function* loadTexprocwelding() {
  try {
    const { data } = yield call(api.get, `/TechnologicalProcess`);
    yield put(loadTexprocweldingSuccess(data));
  } catch (error) {
    yield put(loadTexprocweldingFailure(error));
    yield put(setError(error.message));
  }
}


export function* workplaceSaga() {
  ///Цеха 
  yield takeLatest(LOAD_WORKSHOP_REQUEST, loadWorkshop);
  yield takeLatest(ADD_WORKSHOP_REQUEST, addWorkshop);
  yield takeLatest(EDIT_WORKSHOP_REQUEST, editWorkshop);
  ///Производственные участки 
  yield takeLatest(LOAD_AREA_REQUEST, loadArea);
  yield takeLatest(ADD_AREA_REQUEST, addArea);
  yield takeLatest(EDIT_AREA_REQUEST, editArea);
  ///Посты
  yield takeLatest(LOAD_POSTS_REQUEST, loadPosts);
  yield takeLatest(ADD_POSTS_REQUEST, addPosts);
  yield takeLatest(EDIT_POSTS_REQUEST, editPosts)
  ///Рабочие места
  yield takeLatest(LOAD_WORKPLACE_REQUEST, loadWorkplace);
  yield takeLatest(ADD_WORKPLACE_REQUEST, addWorkplace);
  yield takeLatest(EDIT_WORKPLACE_REQUEST, editWorkplace)
  ///Изделия
  yield takeLatest(LOAD_PRODUCT_REQUEST, loadProduct);
  yield takeLatest(ADD_PRODUCT_REQUEST, addProduct);
  yield takeLatest(EDIT_PRODUCT_REQUEST, editProduct)
  ///Узлы
  yield takeLatest(LOAD_KNOT_REQUEST, loadKnot);
  yield takeLatest(ADD_KNOT_REQUEST, addKnot);
  yield takeLatest(EDIT_KNOT_REQUEST, editKnot)
  ///Детали
  yield takeLatest(LOAD_DETAIL_REQUEST, loadDetail);
  yield takeLatest(ADD_DETAIL_REQUEST, addDetail);
  yield takeLatest(EDIT_DETAIL_REQUEST, editDetail)
  ///Сварные швы
  yield takeLatest(LOAD_SEAM_REQUEST, loadSeam);
  yield takeLatest(ADD_SEAM_REQUEST, addSeam);
  yield takeLatest(EDIT_SEAM_REQUEST, editSeam)
   ///Технологические процессы 
   yield takeLatest(LOAD_TEXPROCWELDING_REQUEST, loadTexprocwelding);
}

