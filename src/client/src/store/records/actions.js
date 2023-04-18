import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({
  loadRecordsRequest: ["payload"],
  loadRecordsSuccess: ["records"],
  loadRecordsFailure: ["error"],


  deleteRecordsRequest: ["payload"],
  deleteRecordsSuccess: ["id"],
  deleteRecordsFailure: ["error"],
});

const recordsActions = {
  Types,
  Creators,
};

export default recordsActions;
