import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({
  loadTasksRequest: ["payload"],
  loadTasksSuccess: ["tasks"],
  loadTasksFailure: ["error"],


  loadInfoRequest: ["payload"],
  loadInfoSuccess: ["info"],
  loadInfoFailure: ["error"],

  editTaskRequest: ["payload"],
  editTaskSuccess: ["task"],
  editTaskFailure: ["error"],

  addTaskRequest: ["payload"],
  addTaskSuccess: ["task"],
  addTaskFailure: ["error"],

  deleteTaskRequest: ["payload"],
  deleteTaskSuccess: ["id"],
  deleteTaskFailure: ["error"],


  ///Сварные швы
  loadSeamRequest: ["payload"],
  loadSeamSuccess: ["seam"],
  loadSeamFailure: ["error"],

  loadTasktoolsRequest: ["payload"],
  loadTasktoolsSuccess: ["tasktools"], 
  loadTasktoolsFailure: ["error"],


});

const tasksActions = {
  Types,
  Creators
};

export default tasksActions;
