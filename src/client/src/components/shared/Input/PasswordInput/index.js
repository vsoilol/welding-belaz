import React, { useState } from "react";
import PropTypes from "prop-types";
import { ReactComponent as LockIcon } from "assets/icons/password.svg";
import { ReactComponent as ShowIcon } from "assets/icons/hide.svg";
import { ReactComponent as HideIcon } from "assets/icons/show.svg";
import DefaultInput from "../DefaultInput";

import styles from "./style.module.scss";

const PasswordInput = ({ width, ...props }) => {
  const [showPassword, setShowPassword] = useState(false);

  return (
    <div className={styles.wrapper} style={{ width }}>
      <LockIcon
        style={{ width: "15px", pointerEvents: "none" }}
        className={styles.icon}
      />

      <DefaultInput
        width={width}
        {...props}
        className={styles.padding}
        type={showPassword ? "text" : "password"}
      />

      <div
        className={styles.eyeIcon}
        onClick={() => setShowPassword(!showPassword)}
      >
        {showPassword ? (
          <HideIcon
            style={{
              pointerEvents: "none",
            }}
          />
        ) : (
          <ShowIcon
            style={{
              pointerEvents: "none",
            }}
          />
        )}
      </div>
    </div>
  );
};

PasswordInput.propTypes = {
  width: PropTypes.string,
};

PasswordInput.defaultProps = {
  width: "350px",
};

export default PasswordInput;
