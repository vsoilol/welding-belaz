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

///Производство
import workplace from "./workplace/reducers";
///Технологические процессы
import texprocwelding from "./texprocwelding/reducers";
import calendar from "./calendar/calendar.reducer";

const reducers = {
  router: connectRouter(history),
  equipment,
  executors,
  tasks,
  instructions,
  error,
  auth,
  records,

  ///Производство
  workplace,
  ///Технологические процессы
  texprocwelding,
  calendar,
};

export default combineReducers(reducers);
