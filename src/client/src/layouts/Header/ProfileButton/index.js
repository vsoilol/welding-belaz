import { logout } from "assets/icons";
import React from "react";
import { connect } from "react-redux";
import { NavLink } from "react-router-dom";
import Actions from "store/auth/actions";
import styles from "./styles.module.css";

const ProfileButton = ({ logOut }) => {
  return (
    <NavLink
      onClick={logOut}
      to={"/login"}
      className={styles.profileIconWrapper}
    >
      <img src={logout} className={styles.profileIcon} alt="Profile" />
    </NavLink>
  );
};

const mapStateToProps = (state) => {
  return {
    isAuth: state.auth.isAuth,
    isRequesting: state.auth.isRequesting,
  };
};

const mapDispatchToProps = {
  logOut: Actions.Creators.logOutRequest,
};

export default connect(mapStateToProps, mapDispatchToProps)(ProfileButton);
