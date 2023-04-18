import { connect } from "react-redux";
import { RecordsPage } from "pages/RecordsPage";
import Actions from "store/records/actions";

const mapStateToProps = (state) => {
  return {
    records: state.records.records,
    isRequesting: state.records.isRequesting,
  };
};

const mapDispatchToProps = {
  loadRecords: Actions.Creators.loadRecordsRequest,
  deleteRecords:Actions.Creators.deleteRecordsRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(RecordsPage);
