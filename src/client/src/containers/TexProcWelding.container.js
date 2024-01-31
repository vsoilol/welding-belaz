import { connect } from 'react-redux';
import { TexProcWeldingPage } from 'pages/TexProcWelding';
import Actions from 'store/texprocwelding/actions';
import MasterActions from 'store/executors/actions';

const mapStateToProps = state => {
  return {
    equipment: state.equipment.equipment,
    masters: state.executors.masters,
    isRequesting:
      state?.equipment?.isRequesting || state?.masters?.isRequesting,
    userRole: state.auth.user.role,

    texprocwelding: state.texprocwelding.texprocwelding,
    instructions: state.texprocwelding.instructions,
    ///Сварные швы
    seam: state.workplace.seam,
  };
};
const mapDispatchToProps = {
  ///Технологические процессы
  loadTexprocwelding: Actions.Creators.loadTexprocweldingRequest,
  ///Технологические инструкции
  loadInstructions: Actions.Creators.loadInstructionsRequest,

  addInst: Actions.Creators.addInstRequest,
  editInst: Actions.Creators.editInstRequest,

  loadSeam: Actions.Creators.loadSeamRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(TexProcWeldingPage);
