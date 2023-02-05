import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({
  loadExecutorsRequest: ["payload"],
  loadExecutorsSuccess: ["executors"],
  loadExecutorsFailure: ["error"],

  editExecutorRequest: ["payload", "userId"],
  editExecutorSuccess: ["executor", "userId"],
  editExecutorFailure: ["error"],

  addExecutorRequest: ["payload"],
  addExecutorSuccess: ["executor"],
  addExecutorFailure: ["error"],

  deleteExecutorRequest: ["payload"],
  deleteExecutorSuccess: ["id"],
  deleteExecutorFailure: ["error"],

  loadMastersRequest: ["payload"],
  loadMastersSuccess: ["masters"],
  loadMastersFailure: ["error"],

  editMasterRequest: ["payload", "userId"],
  editMasterSuccess: ["master", "userId"],
  editMasterFailure: ["error"],

  addMasterRequest: ["payload"],
  addMasterSuccess: ["master"],
  addMasterFailure: ["error"],

  deleteMasterRequest: ["payload"],
  deleteMasterSuccess: ["id"],
  deleteMasterFailure: ["error"],

  loadTechsRequest: ["payload"],
  loadTechsSuccess: ["techs"],
  loadTechsFailure: ["error"],

  editTechRequest: ["payload", "userId"],
  editTechSuccess: ["tech", "userId"],
  editTechFailure: ["error"],

  addTechRequest: ["payload"],
  addTechSuccess: ["tech"],
  addTechFailure: ["error"],

  deleteTechRequest: ["payload"],
  deleteTechSuccess: ["id"],
  deleteTechFailure: ["error"],


  ///Оборудование
  loadEquipmentRequest: ["payload"],
  loadEquipmentSuccess: ["equipment"],
  loadEquipmentFailure: ["error"],
   ///Производственные участки 
   loadAreaRequest: ["payload"],
   loadAreaSuccess: ["productionArea"],
   loadAreaFailure: ["error"],
  ///Цеха 
  loadWorkshopRequest: ["payload"],
  loadWorkshopSuccess: ["workshop"],
  loadWorkshopFailure: ["error"],
});

const executorsActions = {
  Types,
  Creators,
};

export default executorsActions;
