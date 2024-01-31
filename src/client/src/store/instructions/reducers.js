import { createReducer } from 'reduxsauce';
import actions from './actions';

const { Types } = actions;
const INITIAL_STATE = {
  isRequesting: false,
  instructions: [],
  wpsInstructions: [],
  error: null,
};

const request = (state = INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    error: null,
  };
};
const loadInstructionsSuccess = (state = INITIAL_STATE, { instructions }) => {
  return {
    ...state,
    isRequesting: false,
    instructions,
  };
};

const editInstructionSuccess = (state = INITIAL_STATE, { instruction }) => {
  return {
    ...state,
    isRequesting: false,
    instructions: state.instructions?.map(item =>
      item.id === instruction.id ? instruction : item
    ),
  };
};

const deleteInstructionSuccess = (state = INITIAL_STATE, { id }) => {
  return {
    ...state,
    isRequesting: false,
    instructions: state.instructions.filter(item => item.id !== id),
  };
};

const addInstructionSuccess = (state = INITIAL_STATE, { instruction }) => {
  return {
    ...state,
    isRequesting: false,
    instructions: [...state.instructions, instruction],
  };
};

const loadWpsInstructionsSuccess = (
  state = INITIAL_STATE,
  { wpsInstructions }
) => {
  return {
    ...state,
    isRequesting: false,
    wpsInstructions,
  };
};

const editWpsInstructionSuccess = (state = INITIAL_STATE, { instruction }) => {
  return {
    ...state,
    isRequesting: false,
    wpsInstructions: state.wpsInstructions?.map(item =>
      item.id === instruction.id ? instruction : item
    ),
  };
};

const deleteWpsInstructionSuccess = (state = INITIAL_STATE, { id }) => {
  return {
    ...state,
    isRequesting: false,
    wpsInstructions: state.wpsInstructions.filter(item => item.id !== id),
  };
};

const addWpsInstructionSuccess = (state = INITIAL_STATE, { instruction }) => {
  return {
    ...state,
    isRequesting: false,
    wpsInstructions: [...state.wpsInstructions, instruction],
  };
};

const failure = (state = INITIAL_STATE, { error }) => {
  return {
    ...state,
    isRequesting: false,
    error,
  };
};

export const HANDLERS = {
  [Types.LOAD_INSTRUCTIONS_REQUEST]: request,
  [Types.LOAD_INSTRUCTIONS_SUCCESS]: loadInstructionsSuccess,
  [Types.LOAD_INSTRUCTIONS_FAILURE]: failure,

  [Types.EDIT_INSTRUCTION_REQUEST]: request,
  [Types.EDIT_INSTRUCTION_SUCCESS]: editInstructionSuccess,
  [Types.EDIT_INSTRUCTION_FAILURE]: failure,

  [Types.DELETE_INSTRUCTION_REQUEST]: request,
  [Types.DELETE_INSTRUCTION_SUCCESS]: deleteInstructionSuccess,
  [Types.DELETE_INSTRUCTION_FAILURE]: failure,

  [Types.ADD_INSTRUCTION_REQUEST]: request,
  [Types.ADD_INSTRUCTION_SUCCESS]: addInstructionSuccess,
  [Types.ADD_INSTRUCTION_FAILURE]: failure,

  [Types.LOAD_WPS_INSTRUCTIONS_REQUEST]: request,
  [Types.LOAD_WPS_INSTRUCTIONS_SUCCESS]: loadWpsInstructionsSuccess,
  [Types.LOAD_WPS_INSTRUCTIONS_FAILURE]: failure,

  [Types.EDIT_WPS_INSTRUCTION_REQUEST]: request,
  [Types.EDIT_WPS_INSTRUCTION_SUCCESS]: editWpsInstructionSuccess,
  [Types.EDIT_WPS_INSTRUCTION_FAILURE]: failure,

  [Types.DELETE_WPS_INSTRUCTION_REQUEST]: request,
  [Types.DELETE_WPS_INSTRUCTION_SUCCESS]: deleteWpsInstructionSuccess,
  [Types.DELETE_WPS_INSTRUCTION_FAILURE]: failure,

  [Types.ADD_WPS_INSTRUCTION_REQUEST]: request,
  [Types.ADD_WPS_INSTRUCTION_SUCCESS]: addWpsInstructionSuccess,
  [Types.ADD_WPS_INSTRUCTION_FAILURE]: failure,
};

export default createReducer(INITIAL_STATE, HANDLERS);
