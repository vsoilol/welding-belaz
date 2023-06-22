import { connect } from "react-redux";
import { ProductionCalendar } from "pages/ProductionCalendarPage";
import Actions from "store/records/actions";

const mapStateToProps = (state) => {
  return {
    records: state.records.records,
    isRequesting: state.records.isRequesting,
    userRole: state.auth.user.role,
  };
};

const mapDispatchToProps = {
  loadRecords: Actions.Creators.loadRecordsRequest,
  deleteRecords:Actions.Creators.deleteRecordsRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(ProductionCalendar);
