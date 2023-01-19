import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({

  ///calendar 
  loadCalendarRequest: ["payload"],
  loadCalendarSuccess: ["calendar"],
  loadCalendarFailure: ["error"],
 

  
  loadExecutorsRequest: ["payload"],
  loadExecutorsSuccess: ["executors"],
  loadExecutorsFailure: ["error"],



  loadEquipmentRequest: ["payload"],
  loadEquipmentSuccess: ["equipment"],
  loadEquipmentFailure: ["error"],

});

const workplaceActions = {
  Types,
  Creators
};

export default workplaceActions;
