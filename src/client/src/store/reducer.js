import { combineReducers } from "redux";
import { connectRouter } from "connected-react-router";
import auth from "./auth/reducers";
import equipment from "./equipment/reducers";
import executors from "store/executors/reducers";
import error from "./error/reducers";
import tasks from "store/tasks/reducers";
import records from "store/records/reducers";
import instructions from "store/instructions/reducers";
import history from "./history";

const reducers = {
  router: connectRouter(history),
  equipment,
  executors,
  tasks,
  instructions,
  error,
  auth,
  records,
};

export default combineReducers(reducers);
