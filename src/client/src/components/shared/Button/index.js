/* eslint-disable react/button-has-type */
import { GLOBALS } from "config/GLOBALS";
import PropTypes from "prop-types";
import React from "react";
import styles from "./style.module.css";

const styleTypes = {
  text: styles.text,
  tertiary: styles.tertiary,
};

const Button = ({
  type,
  styleType,
  color,
  children,
  width,
  className,
  isRequesting,
  ...props
}) => {
  const classNames = `${styles.base} ${styleTypes[styleType]} ${styles[color]} ${className}`;

  return (
    <button
      type={type}
      className={classNames}
      style={{ width, backgroundColor: GLOBALS.COLORS.PRIMARY_COLOR }}
      {...props}
    >
      <div className={styles.content}>
        {isRequesting && (
          <div className={styles.ldsRing}>
            <div />
            <div />
            <div />
            <div />
          </div>
        )}
        <div>{children}</div>
      </div>
    </button>
  );
};

Button.propTypes = {
  styleType: PropTypes.string,
  color: PropTypes.string,
  type: PropTypes.string,
  width: PropTypes.string,
  children: PropTypes.oneOfType([PropTypes.object, PropTypes.string]),
  className: PropTypes.string,
  isRequesting: PropTypes.bool,
};

Button.defaultProps = {
  styleType: "",
  color: "",
  children: "",
  type: "button",
  width: "",
  className: "",
  isRequesting: false,
};

export default Button;
