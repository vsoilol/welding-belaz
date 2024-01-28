import React from "react";
import PropTypes from "prop-types";
import { useField } from "formik";
import styles from "./custom-formik-field.module.scss";

const CustomFormikField = ({ name, children }) => {
  const [field, meta] = useField(name);

  return (
    <div className={styles.inputField}>
      {React.cloneElement(children, { field, meta, name })}
      {meta.touched && meta.error && (
        <div className={styles.inputError}>{meta.error}</div>
      )}
    </div>
  );
};

CustomFormikField.propTypes = {
  name: PropTypes.string.isRequired,
  children: PropTypes.element.isRequired,
};

export default CustomFormikField;
