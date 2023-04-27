import { connect } from "react-redux";
import { RegPage } from "pages/RegPage";
import Actions from "store/auth/actions";

const mapStateToProps = (state) => {
  return {
    isAuth: state.auth.isAuth,
    isRequesting: state.auth.isRequesting,
  };
};
const mapDispatchToProps = {
  logIn: Actions.Creators.logInRequest,
  logOut: Actions.Creators.logOutRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(RegPage);
