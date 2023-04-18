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
  ///Закрепленные детали  за инспектором
    LOAD_DETAILBYINSPECTOR_REQUEST,

    LOAD_WELDINGTASK_REQUEST,  


    DELETE_PRODUCT_REQUEST,
 
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

    ///Закрепленные детали  за инспектором
    loadDetailbyinspectorSuccess,
    loadDetailbyinspectorFailure,


    loadWeldingtaskSuccess,
    loadWeldingtaskFailure,
 

    deleteProductSuccess,
    deleteProductFailure,

 
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
    yield call(loadWorkshop);
    yield put(addWorkshopSuccess(data));
  } catch (error) {
    yield put(addWorkshopFailure(error));
    yield put(setError(error.message));
  }
}
function* editWorkshop(variables) {
  try {
    const { data } = yield call(api.put, `/Workshop`, {
      "id": variables.payload.id,
      "name": variables.payload.name,
      "number": variables.payload.number
    });
    yield call(loadWorkshop);
    yield put(editWorkshopSuccess(variables.payload));
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
    yield call(loadArea);
    yield put(addAreaSuccess(data));
  } catch (error) {
    yield put(addAreaFailure(error));
    yield put(setError(error.message));
  }
}
function* editArea(variables) {
  try {
    const { data } = yield call(api.put, `/ProductionArea`, {
      "id": variables.payload.id,
      "name": variables.payload.name,
      "number": variables.payload.number,
      "workshopId": variables.payload.workshopId
    });
    yield call(loadArea);
    yield put(editAreaSuccess(variables.payload));
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
        "name": variables.payload.name,
        "productionAreaId": variables.payload.productionAreaId
      }
    );
    yield call(loadPosts);
    yield put(addPostsSuccess(data));
  } catch (error) {
    yield put(addPostsFailure(error));
    yield put(setError(error.message));
  }
}
function* editPosts(variables) {
  try {
    const { data } = yield call(api.put, `/post`, {
      "id": variables.payload.id,
      "number": variables.payload.number,
      "name": variables.payload.name,
      "productionAreaId": variables.payload.productionAreaId
    });
    yield call(loadPosts);
    yield put(editPostsSuccess(data));
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
    yield call(loadWorkplace);
    yield put(addWorkplaceSuccess(data));
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
    yield call(loadWorkplace);
    yield put(editWorkplaceSuccess(variables.payload));
  } catch (error) {
    yield put(editWorkplaceFailure(error));
    yield put(setError(error.message));
  }
}




///Изделия
function* loadProduct() {
  try {
    // const { data } = yield call(api.get, `/product/byStatus/1`);
    const { data } = yield call(api.get, `/product`);
    yield put(loadProductSuccess(data));
  } catch (error) {
    yield put(loadProductFailure(error));
    yield put(setError(error.message));
  }
}
function* loadWeldingTask() {
  try {
    const { data } = yield call(api.get, `/WeldingTask`);
    yield put(loadWeldingtaskSuccess(data));
  } catch (error) {
    yield put(loadWeldingtaskFailure(error));
    yield put(setError(error.message));
  }
}
function* addProduct(variables) {
  try {
    
    if (variables.payload.status==="add") {
      if (variables.payload.valEx === 1) {
        const { data } = yield call(api.put, `/product/assignMaster`, {
          "productId": variables.payload.productId,
          "masterId": variables.payload.masterId
        });
      }
      if (variables.payload.valEx === 2) {
        const { data } = yield call(api.put, `/product/assignInspector`, {
          "productId": variables.payload.productId,
          "inspectorId": variables.payload.inspectorId
        });
      }
  
      if (variables.payload.valEx === undefined) {
        const { data } = yield call(api.post, `/product`, {
          "name": variables.payload.name,
          "number": `${variables.payload.number}`,
          "isControlSubject": true,
          "productionAreaId": variables.payload.productionAreaId,
          "workplaceId": variables.payload.workplaceId,
          "technologicalProcessId": variables.payload.technologicalProcessId,
          "seams":variables.payload.seams,
        });
        yield put(addProductSuccess(data));
        yield call(loadProduct);
      }
    }

    if (variables.payload.status==="assign") {
      const { data } = yield call(api.put, `/product/assignWelders`, {
        "productId": variables.payload.productId,
        "welderIds":variables.payload.welderIds
      });  
    }
    
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
      "number": `${variables.payload.number}`,
      "isControlSubject": true,
      "productionAreaId": variables.payload.productionAreaId,
      "workplaceId": variables.payload.workplaceId,
      "technologicalProcessId": variables.payload.technologicalProcessId,
      "seams":variables.payload.seams,
    });
    yield call(loadProduct);
    yield put(editProductSuccess(data));
  } catch (error) {
    yield put(editProductFailure(error));
    yield put(setError(error.message));
  }
}
function* getDetailByInspector(variables) {
  try { 
    const { data } = yield call(api.get, `/detail/byInspector/${variables.payload}` ); 
    yield put(loadDetailbyinspectorSuccess(data));
  } catch (error) {
    yield put(loadDetailbyinspectorFailure(error));
    yield put(setError(error.message));
  }
}
 
///Узлы
function* loadKnot() {
  try {
    // const { data } = yield call(api.get, `/knot/byStatus/1`);
    const { data } = yield call(api.get, `/knot`);
    yield put(loadKnotSuccess(data));
  } catch (error) {
    yield put(loadKnotFailure(error));
    yield put(setError(error.message));
  }
}
function* addKnot(variables) {

  try {
    if (variables.payload.status==="add") {
      if (variables.payload.valEx === 1) {
        const { data } = yield call(api.put, `/knot/assignMaster`, {
          "productId": variables.payload.productId,
          "masterId": variables.payload.masterId
        });
      }
      if (variables.payload.valEx === 2) {
        const { data } = yield call(api.put, `/knot/assignInspector`, {
          "productId": variables.payload.productId,
          "inspectorId": variables.payload.inspectorId
        });
      }
  
      if (variables.payload.valEx === undefined) {
        const { data } = yield call(api.post, `/knot`, { 

          "name": variables.payload.name,
          "number": `${variables.payload.number}`,
          "isControlSubject": false,
          "productionAreaId": variables.payload.productionAreaId,  
          "technologicalProcessId": variables.payload.technologicalProcessId,
          "mainProductId": variables.payload.mainProductId
        });
        yield call(loadKnot);
        yield put(addKnotSuccess(data));
      }
    } 


    if (variables.payload.status==="assign") {
      const { data } = yield call(api.put, `/knot/assignWelders`, {
        "productId": variables.payload.productId,
        "welderIds": variables.payload.welderIds
      });  
    }

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
      "number": `${variables.payload.number}`,
      "isControlSubject": false,
      "productionAreaId": variables.payload.productionAreaId,  
      "technologicalProcessId": variables.payload.technologicalProcessId,
      "mainProductId": variables.payload.mainProductId
    });
    yield call(loadKnot);
    yield put(editKnotSuccess(data));
  } catch (error) {
    yield put(editKnotFailure(error));
    yield put(setError(error.message));
  }
}
///Детали
function* loadDetail() {
  try {
    // const { data } = yield call(api.get, `/detail/byStatus/1`);
    const { data } = yield call(api.get, `/detail`);
    yield put(loadDetailSuccess(data));
  } catch (error) {
    yield put(loadDetailFailure(error));
    yield put(setError(error.message));
  }
}
function* addDetail(variables) {
  

  try {
    if (variables.payload.status==="add") {
      if (variables.payload.valEx === 1) {
        const { data } = yield call(api.put, `/detail/assignMaster`, {
          "productId": variables.payload.productId,
          "masterId": variables.payload.masterId
        });
      }
      if (variables.payload.valEx === 2) {
        const { data } = yield call(api.put, `/detail/assignInspector`, {
          "productId": variables.payload.productId,
          "inspectorId": variables.payload.inspectorId
        });
      }
  
      if (variables.payload.valEx === undefined) {
       
        const { data } = yield call(api.post, `/detail`, {
          "name": variables.payload.name,
          "number": `${variables.payload.number}`,
          "isControlSubject": true,
          "productionAreaId": variables.payload.productionAreaId, 
          "technologicalProcessId": variables.payload.technologicalProcessId,  
          "mainProductId": variables.payload.mainProductId,  
        });
        yield call(loadDetail);
        yield put(addDetailSuccess(data));
      }
    } 

    
    if (variables.payload.status==="assign") {
      const { data } = yield call(api.put, `/detail/assignWelders`, {
        "productId": variables.payload.productId,
        "welderIds": variables.payload.welderIds
      });  
    }

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
      "number": `${variables.payload.number}`, 
      "isControlSubject": true,
      "productionAreaId": variables.payload.productionAreaId,
      "workplaceId": variables.payload.workplaceId,
      "technologicalProcessId": variables.payload.technologicalProcessId, 
      "mainProductId": variables.payload.mainProductId,  
    });
    yield put(editDetailSuccess(data));
    yield call(loadDetail);
  } catch (error) {
    yield put(editDetailFailure(error));
    yield put(setError(error.message));
  }
}

///Сварные швы
function* loadSeam() {
  try {
    // const { data } = yield call(api.get, `/seam/byStatus/1`);
    const { data } = yield call(api.get, `/seam`);
    yield put(loadSeamSuccess(data));
  } catch (error) {
    yield put(loadSeamFailure(error));
    yield put(setError(error.message));
  }
}
function* addSeam(variables) {
  try { 
    if (variables.payload.valEx === 1) {
      const { data } = yield call(api.put, `/seam/assignWelder`, {
        "seamId": variables.payload.seamId,
        "welderId": variables.payload.masterId
      });
    }
    if (variables.payload.valEx === 2) {
      const { data } = yield call(api.put, `/seam/assignInspector`, {
        "seamId": variables.payload.seamId,
        "inspectorId": variables.payload.inspectorId
      });
    }

    if (variables.payload.valEx === undefined) { 
      const { data } = yield call(api.post, `/seam`, {
        "number": variables.payload.number,
        "isControlSubject": true,
        "isPerformed": true,
        "length": 0,
        "productionAreaId": variables.payload.productionAreaId,
        "technologicalInstructionId": variables.payload.technologicalProcessId,
        "productId": variables.payload.productId, 
      });
      yield call(loadSeam);
      yield put(addSeamSuccess(data));
    }
    
  } catch (error) {
    yield put(addSeamFailure(error));
    yield put(setError(error.message));
  }
}
function* editSeam(variables) {
  try { 
    const { data } = yield call(api.put, `/seam`, { 
      "id": variables.payload.id,
      "number": variables.payload.number,
      "isControlSubject": true,
      "isPerformed": true,
      "length": 0,
      "productionAreaId": variables.payload.productionAreaId,
      "technologicalInstructionId": variables.payload.technologicalProcessId,
      "productId": variables.payload.productId 
    });
    yield put(editSeamSuccess(data));
    yield call(loadSeam);
  } catch (error) {
    yield put(editSeamFailure(error));
    yield put(setError(error.message));
  }
}  

const deleteEndpoints = {
  0: { endpoint: '/Workshop', loadFunction: loadWorkshop },
  1: { endpoint: '/ProductionArea', loadFunction: loadArea },
  2: { endpoint: '/post', loadFunction: loadPosts },
  3: { endpoint: '/Workplace', loadFunction: loadWorkplace },
  4: { endpoint: '/product', loadFunction: loadProduct },
  5: { endpoint: '/knot', loadFunction: loadKnot },
  6: { endpoint: '/detail', loadFunction: loadDetail },
  7: { endpoint: '/seam', loadFunction: loadSeam },
};

function* deleteProduct({ payload }) {
  try {
    const { endpoint, loadFunction } = deleteEndpoints[payload.index];
    const { data } = yield call(api.remove, `${endpoint}/${payload.id}`);
    yield put(deleteProductSuccess(data));
    yield call(loadFunction);
  } catch (error) {
    yield put(deleteProductFailure(error));
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
  yield takeLatest(LOAD_DETAILBYINSPECTOR_REQUEST, getDetailByInspector);


   ///Технологические процессы  
   yield takeLatest(LOAD_WELDINGTASK_REQUEST, loadWeldingTask);
 
   yield takeLatest(DELETE_PRODUCT_REQUEST, deleteProduct);
}

