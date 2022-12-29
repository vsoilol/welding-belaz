import React from 'react';
import PropTypes from 'prop-types';
import styles from './style.module.css';

const DefaultInput = ({ width, height, invalid, className, ...props }) => {
  return (
    <input
      style={{ width, height }}
      className={`${styles.input} ${invalid && styles.invalid} ${className}`}
      {...props}
    />
  );
};

DefaultInput.propTypes = {
  width: PropTypes.string,
  height: PropTypes.string,
  invalid: PropTypes.bool,
  className: PropTypes.string,
};

DefaultInput.defaultProps = {
  width: '350px',
  height: '50px',
  invalid: false,
  className: '',
};

export default DefaultInput;
