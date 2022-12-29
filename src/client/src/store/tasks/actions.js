import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({
  loadTasksRequest: ["payload"],
  loadTasksSuccess: ["tasks"],
  loadTasksFailure: ["error"],

  editTaskRequest: ["payload"],
  editTaskSuccess: ["task"],
  editTaskFailure: ["error"],

  addTaskRequest: ["payload"],
  addTaskSuccess: ["task"],
  addTaskFailure: ["error"],

  deleteTaskRequest: ["payload"],
  deleteTaskSuccess: ["id"],
  deleteTaskFailure: ["error"],
});

const tasksActions = {
  Types,
  Creators
};

export default tasksActions;
