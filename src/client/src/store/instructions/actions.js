import { createActions } from 'reduxsauce';

const { Types, Creators } = createActions({
  loadInstructionsRequest: ['payload'],
  loadInstructionsSuccess: ['instructions'],
  loadInstructionsFailure: ['error'],

  editInstructionRequest: ['payload'],
  editInstructionSuccess: ['instruction', 'id'],
  editInstructionFailure: ['error'],

  addInstructionRequest: ['payload'],
  addInstructionSuccess: ['instruction'],
  addInstructionFailure: ['error'],

  deleteInstructionRequest: ['payload'],
  deleteInstructionSuccess: ['id'],
  deleteInstructionFailure: ['error'],

  loadWpsInstructionsRequest: ['payload'],
  loadWpsInstructionsSuccess: ['wpsInstructions'],
  loadWpsInstructionsFailure: ['error'],

  editWpsInstructionRequest: ['payload'],
  editWpsInstructionSuccess: ['instruction'],
  editWpsInstructionFailure: ['error'],

  addWpsInstructionRequest: ['payload'],
  addWpsInstructionSuccess: ['instruction'],
  addWpsInstructionFailure: ['error'],

  deleteWpsInstructionRequest: ['payload'],
  deleteWpsInstructionSuccess: ['id'],
  deleteWpsInstructionFailure: ['error'],
});

const instructionsActions = {
  Types,
  Creators,
};

export default instructionsActions;
