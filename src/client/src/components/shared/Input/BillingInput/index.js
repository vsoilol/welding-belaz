import React from 'react';
import PropTypes from 'prop-types';
import DefaultInput from '../DefaultInput';
import styles from './style.module.scss';

const BillingInput = ({ width, height, label, ...props }) => {
  return (
    <div className={styles.wrapper} style={{ width, height }}>
      <label className={styles.label}>{label}</label>
      <DefaultInput
        width={width}
        height={height}
        {...props}
        className={styles.defaultInput}
      />
    </div>
  );
};

BillingInput.propTypes = {
  label: PropTypes.string,
  width: PropTypes.string,
  height: PropTypes.string,
};

BillingInput.defaultProps = {
  label: '',
  width: '350px',
  height: '40px',
};

export default BillingInput;
