import { createActions } from "reduxsauce";

const { Types, Creators } = createActions({

  ///Технологические процессы 
  loadTexprocweldingRequest: ["payload"],
  loadTexprocweldingSuccess: ["texprocwelding"],
  loadTexprocweldingFailure: ["error"],


  ///Технологические инструкции 
  loadInstructionsRequest: ["payload"],
  loadInstructionsSuccess: ["instructions"],
  loadInstructionsFailure: ["error"],

  addInstRequest: ["payload"],
  addInstSuccess: ["instructions"],
  addInstFailure: ["error"],

  editInstRequest: ["payload"],
  editInstSuccess: ["instructions"],
  editInstFailure: ["error"],

  ///Сварные швы
  loadSeamRequest: ["payload"],
  loadSeamSuccess: ["seam"],
  loadSeamFailure: ["error"],

});

const texprocweldingActions = {
  Types,
  Creators
};

export default texprocweldingActions;
