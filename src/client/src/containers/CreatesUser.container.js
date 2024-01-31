import { connect } from 'react-redux';
import { CreatesUserPage } from 'pages/CreatesUserPage';
const mapStateToProps = state => {
  return {
    userRole: state.auth.user.role,
  };
};

const mapDispatchToProps = {};

export default connect(mapStateToProps, mapDispatchToProps)(CreatesUserPage);
