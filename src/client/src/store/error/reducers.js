import { createReducer } from "reduxsauce";
import actions from "./actions";

const { Types } = actions;
const INITIAL_STATE = {
  type: "",
  message: "",
};

const setMessage = (state = INITIAL_STATE, { message }) => {
  return {
    ...state,
    type: "message",
    message,
  };
};

const setError = (state = INITIAL_STATE, { message }) => {
  return {
    ...state,
    message,
  };
};

const clearError = (state = INITIAL_STATE) => {
  return {
    ...state,
    message: "",
    type: "",
  };
};

export const HANDLERS = {
  [Types.SET_ERROR]: setError,
  [Types.SET_MESSAGE]: setMessage,
  [Types.CLEAR_ERROR]: clearError,
};

export default createReducer(INITIAL_STATE, HANDLERS);
