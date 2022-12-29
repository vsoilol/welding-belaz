import { spawn } from "redux-saga/effects";
import { equipmentSaga } from "./equipment/sagas";
import { executorsSaga } from "store/executors/sagas";
import { tasksSaga } from "store/tasks/sagas";
import { recordsSaga } from "store/records/sagas";
import { authSaga } from "store/auth/sagas";
import { instructionsSaga } from "store/instructions/sagas";

export default function* () {
  yield spawn(equipmentSaga);
  yield spawn(executorsSaga);
  yield spawn(tasksSaga);
  yield spawn(instructionsSaga);
  yield spawn(authSaga);
  yield spawn(recordsSaga);
}
