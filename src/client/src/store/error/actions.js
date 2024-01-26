import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({
  setError: ["message"],
  setMessage: ["message"],
  clearError: [],
});

const Actions = {
  Types,
  Creators,
};

export default Actions;
export { Types as errorTypes, Creators as errorCreators };
