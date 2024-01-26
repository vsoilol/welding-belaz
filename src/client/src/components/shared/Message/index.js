import React from "react";
import PropTypes from "prop-types";
// import { ReactComponent as Close } from 'assets/icons/close.png';

import { GLOBALS } from "config/GLOBALS";
import styles from "./style.module.scss";

const Message = ({ type, text, timeout, onClose, left }) => {
  setTimeout(() => {
    onClose();
  }, timeout);

  return (
    <div
      style={{ backgroundColor: GLOBALS.COLORS.PRIMARY_COLOR }}
      className={[
        styles.container,
        left ? styles.containerLeft : styles.containerRight,
        type === "message" && styles.message,
      ].join(" ")}
    >
      <span className={styles.text}>{text}</span>

      <div
        className={styles.icon}
        style={{ backgroundColor: GLOBALS.COLORS.PRIMARY_COLOR }}
        onClick={onClose}
      >
        <img
          src={require("../../../assets/icons/close.png")}
          style={{ width: 20, height: 20 }}
          alt="close"
        />
      </div>
    </div>
  );
};

Message.propTypes = {
  text: PropTypes.string,
  type: PropTypes.string,
  timeout: PropTypes.number,
  onClose: PropTypes.func,
  left: PropTypes.bool,
};

Message.defaultProps = {
  text: "",
  type: "",
  timeout: 10,
  onClose: () => {},
  left: true,
};

export default Message;
