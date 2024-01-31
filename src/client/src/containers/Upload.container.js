import { connect } from 'react-redux';
import { UploadPage } from 'pages/Upload';
import Actions from 'store/equipment/actions';
import MasterActions from 'store/executors/actions';

const mapStateToProps = state => {
  return {
    records: state.records.records,
    isRequesting: state.records.isRequesting,
  };
};
const mapDispatchToProps = {
  loadRecords: Actions.Creators.loadRecordsRequest,
};
export default connect(mapStateToProps, mapDispatchToProps)(UploadPage);
