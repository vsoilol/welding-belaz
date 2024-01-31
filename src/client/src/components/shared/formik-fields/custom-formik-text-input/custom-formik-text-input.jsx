import React from 'react';
import PropTypes from 'prop-types';
import styles from './custom-formik-text-input.module.scss';

const CustomFormikTextInput = ({
  type,
  width,
  height,
  className,
  field,
  meta,
  ...fieldProps
}) => {
  const inputStyle = { width, height };
  const inputClasses = `${styles.input} ${
    meta.touched && meta.error ? styles.invalid : ''
  } ${className}`;

  return (
    <input
      {...field}
      type={type}
      style={inputStyle}
      className={inputClasses}
      {...fieldProps}
    />
  );
};

CustomFormikTextInput.propTypes = {
  type: PropTypes.string,
  width: PropTypes.string,
  height: PropTypes.string,
  className: PropTypes.string,
};

CustomFormikTextInput.defaultProps = {
  type: 'text',
  width: '350px',
  height: '50px',
  className: '',
  autoComplete: 'off',
};

export default CustomFormikTextInput;
