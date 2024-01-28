import React from "react";
import PropTypes from "prop-types";
import Input from "components/shared/Input";

import styles from "./style.module.scss";

const Field = ({ type, invalid, error, noError, ...props }) => {
  const inputProps = {
    ...props,
    type,
    error,
  };

  const renderInput = () => {
    return <Input type={type} invalid={invalid} {...inputProps} />;
  };

  return (
    <div className={`${styles.field}`}>
      {renderInput()}
      {!noError && (
        <p className={`${styles.error}`}>{invalid && error && error}</p>
      )}
    </div>
  );
};

Field.propTypes = {
  type: PropTypes.string,
  invalid: PropTypes.bool,
  error: PropTypes.string,
};

Field.defaultProps = {
  type: "text",
  invalid: false,
  error: "",
};

export default Field;
