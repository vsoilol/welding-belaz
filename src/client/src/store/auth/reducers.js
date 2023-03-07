import { createReducer } from "reduxsauce";
import auth from "services/auth";
import actions from "./actions";

const { Types } = actions;
const INITIAL_STATE = {
  isRequesting: false,
  isAuth: false,
  user: {},
  error: null,
};

const request = (state = INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    error: null,
  };
};
const logInSuccess = (state = INITIAL_STATE, { data }) => { 
 
  return {
    ...state,
    user: { ...auth.decodeToken(data.token) },
    isRequesting: false,
    isAuth: true,
  };
};

const logOutSuccess = (state = INITIAL_STATE, { data }) => {
  return {
    ...state,
    isAuth: false,
    isRequesting: false,
  };
};

const failure = (state = INITIAL_STATE, { error }) => {
  return {
    ...state,
    isRequesting: false,
    isAuth: false,
    error,
  };
};

export const HANDLERS = {
  [Types.LOG_IN_REQUEST]: request,
  [Types.LOG_IN_SUCCESS]: logInSuccess,
  [Types.LOG_IN_FAILURE]: failure,

  [Types.LOG_OUT_REQUEST]: request,
  [Types.LOG_OUT_SUCCESS]: logOutSuccess,
  [Types.LOG_OUT_FAILURE]: failure,
};

export default createReducer(INITIAL_STATE, HANDLERS);
