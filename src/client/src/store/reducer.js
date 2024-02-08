import { combineReducers } from 'redux';
import { createRouterReducer } from '@lagunovsky/redux-react-router';
import auth from './auth/reducers';
import equipment from './equipment/reducers';
import executors from 'store/executors/reducers';
import error from './error/reducers';
import tasks from 'store/tasks/reducers';
import records from 'store/records/reducers';
import instructions from 'store/instructions/reducers';
import history from './history';

///Производство
import workplace from './workplace/reducers';
///Технологические процессы
import texprocwelding from './texprocwelding/reducers';
import calendar from './calendar/calendar.reducer';
import welder from './welder/welder.reducer';
import { weldingEquipmentReducer } from './welding-equipment';
import { taskReducer } from './task';
import { masterReducer } from './master';
import { productAccountReducer } from './product-account';
import { modalReducer } from './modal';
import { productAccountTaskReducer } from './product-account-task';
import { inspectorReducer } from './inspector';

const reducers = {
  router: createRouterReducer(history),
  equipment,
  executors,
  // tasks,
  instructions,
  error,
  auth,
  records,

  // Производство
  workplace,

  // Технологические процессы
  texprocwelding,
  calendar,
  welder,
  weldingEquipment: weldingEquipmentReducer,
  task: taskReducer,
  master: masterReducer,
  productAccount: productAccountReducer,
  modal: modalReducer,
  productAccountTask: productAccountTaskReducer,
  inspector: inspectorReducer,
};

export default combineReducers(reducers);
