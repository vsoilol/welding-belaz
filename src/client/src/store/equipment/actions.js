import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({
  loadEquipmentRequest: ["payload"],
  loadEquipmentSuccess: ["equipment"],
  loadEquipmentFailure: ["error"],

  editEquipmentRequest: ["payload"],
  editEquipmentSuccess: ["equipment"],
  editEquipmentFailure: ["error"],

  addEquipmentRequest: ["payload"],
  addEquipmentSuccess: ["equipment"],
  addEquipmentFailure: ["error"],

  deleteEquipmentRequest: ["payload"],
  deleteEquipmentSuccess: ["id"],
  deleteEquipmentFailure: ["error"],
});

const equipmentActions = {
  Types,
  Creators
};

export default equipmentActions;
