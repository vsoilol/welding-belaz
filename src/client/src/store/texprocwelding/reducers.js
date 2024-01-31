import { createReducer } from 'reduxsauce';
import actions from './actions';

const { Types } = actions;
const INITIAL_STATE = {
  isRequesting: false,
  texprocwelding: [],
  error: null,
};

const request = (state = INITIAL_STATE) => {
  return {
    ...state,
    isRequesting: true,
    error: null,
  };
};
///Технологические процессы
const loadTexprocweldingSuccess = (
  state = INITIAL_STATE,
  { texprocwelding }
) => {
  return {
    ...state,
    isRequesting: false,
    texprocwelding,
  };
};
///Технологические инструкции
const loadInstructionsSuccess = (state = INITIAL_STATE, { instructions }) => {
  return {
    ...state,
    isRequesting: false,
    instructions,
  };
};

const addInstSuccess = (state = INITIAL_STATE, { instructions }) => {
  return {
    ...state,
    isRequesting: false,
    instructions: [...state.instructions, instructions],
  };
};

const editInstSuccess = (state = INITIAL_STATE, { instructions }) => {
  return {
    ...state,
    isRequesting: false,
    instructions: state.instructions.map((item, index) =>
      item.id === instructions.id
        ? (state.instructions[index] = instructions)
        : item
    ),
  };
};

const failure = (state = INITIAL_STATE, { error }) => {
  return {
    ...state,
    isRequesting: false,
    error,
  };
};

///Сварные швы
const loadSeamSuccess = (state = INITIAL_STATE, { seam }) => {
  return {
    ...state,
    isRequesting: false,
    seam,
  };
};

export const HANDLERS = {
  ///Технологические процессы
  [Types.LOAD_TEXPROCWELDING_REQUEST]: request,
  [Types.LOAD_TEXPROCWELDING_SUCCESS]: loadTexprocweldingSuccess,
  [Types.LOAD_TEXPROCWELDING_FAILURE]: failure,
  ///Технологические инструкции
  [Types.LOAD_INSTRUCTIONS_REQUEST]: request,
  [Types.LOAD_INSTRUCTIONS_SUCCESS]: loadInstructionsSuccess,
  [Types.LOAD_INSTRUCTIONS_FAILURE]: failure,

  [Types.ADD_INST_REQUEST]: request,
  [Types.ADD_INST_SUCCESS]: addInstSuccess,
  [Types.ADD_INST_FAILURE]: failure,

  [Types.EDIT_INST_REQUEST]: request,
  [Types.EDIT_INST_SUCCESS]: editInstSuccess,
  [Types.EDIT_INST_FAILURE]: failure,

  ///Сварные швы
  [Types.LOAD_SEAM_REQUEST]: request,
  [Types.LOAD_SEAM_SUCCESS]: loadSeamSuccess,
  [Types.LOAD_SEAM_FAILURE]: failure,
};

export default createReducer(INITIAL_STATE, HANDLERS);
