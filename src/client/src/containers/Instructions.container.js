import { connect } from "react-redux";
import { InstructionsPage } from "pages/Instructions";
import Actions from "store/instructions/actions";

const mapStateToProps = (state) => {
  return {
    instructions: state.instructions.instructions,
    wpsInstructions: state.instructions.wpsInstructions,
    isRequesting: state.instructions.isRequesting,
    userRole: state.auth.user.role,
  };
};
const mapDispatchToProps = {
  loadInstructions: Actions.Creators.loadInstructionsRequest,
  addInstruction: Actions.Creators.addInstructionRequest,
  deleteInstruction: Actions.Creators.deleteInstructionRequest,
  editInstruction: Actions.Creators.editInstructionRequest,

  loadWpsInstructions: Actions.Creators.loadWpsInstructionsRequest,
  addWpsInstruction: Actions.Creators.addWpsInstructionRequest,
  deleteWpsInstruction: Actions.Creators.deleteWpsInstructionRequest,
  editWpsInstruction: Actions.Creators.editWpsInstructionRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(InstructionsPage);
