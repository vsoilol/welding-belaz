import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({
  logInRequest: ["payload"],
  logInSuccess: ["data"],
  logInFailure: ["error"],

  logOutRequest: ["payload"],
  logOutSuccess: ["data"],
  logOutFailure: ["error"],
});

const authActions = {
  Types,
  Creators,
};

export default authActions;
