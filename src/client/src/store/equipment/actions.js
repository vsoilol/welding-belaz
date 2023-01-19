import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({
  loadEquipmentRequest: ["payload"],
  loadEquipmentSuccess: ["equipment"],
  loadEquipmentFailure: ["error"],

  ///Посты
  loadPostsRequest: ["payload"],
  loadPostsSuccess: ["posts"],
  loadPostsFailure: ["error"],
 

  editEquipmentRequest: ["payload"],
  editEquipmentSuccess: ["equipment"],
  editEquipmentFailure: ["error"],

  addEquipmentRequest: ["payload"],
  addEquipmentSuccess: ["equipment"],
  addEquipmentFailure: ["error"],

  deleteEquipmentRequest: ["payload"],
  deleteEquipmentSuccess: ["id"],
  deleteEquipmentFailure: ["error"],


  ////Downtime
  editDowntimeRequest: ["payload"],
  editDowntimeSuccess: ["downtime"],
  editDowntimeFailure: ["error"],

  addDowntimeRequest: ["payload"],
  addDowntimeSuccess: ["downtime"],
  addDowntimeFailure: ["error"],



  //loaddowntime
  loadReasonRequest: ["payload"],
  loadReasonSuccess: ["reason"],
  loadReasonFailure: ["error"],

});

const equipmentActions = {
  Types,
  Creators
};

export default equipmentActions;
