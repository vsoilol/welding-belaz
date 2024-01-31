import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';
import Text from 'components/shared/Text';
import PasswordInput from '../PasswordInput';
import { calculateStrength } from './calculateStrength';

import styles from './style.module.scss';

const strengths = ['Weak', 'Weak', 'Medium', 'Strong!'];

const PasswordStrengthInput = ({ width, value, ...props }) => {
  const [strength, setStrength] = useState(-1);

  useEffect(() => {
    setStrength(calculateStrength(value));
  }, [value]);

  return (
    <div>
      <PasswordInput width={width} value={value} {...props} />

      <div style={{ width }} className={styles.wrapper}>
        <div>
          <Text type="p1">Password strength: </Text>
          {strength >= 0 && (
            <>
              <Text
                type="p2"
                className={
                  strength >= 3
                    ? styles.greenText
                    : strength >= 2
                      ? styles.yellowText
                      : ''
                }>
                {strengths[strength]}
              </Text>
            </>
          )}
        </div>
        <div className={styles.blocksWrapper}>
          <div
            className={`${styles.block} ${styles.left} ${
              strength >= 0 && styles.green
            }`}
          />
          <div className={`${styles.block} ${strength >= 2 && styles.green}`} />
          <div
            className={`${styles.block} ${styles.right} ${
              strength === 3 && styles.green
            }`}
          />
        </div>
      </div>
    </div>
  );
};

PasswordStrengthInput.propTypes = {
  width: PropTypes.string,
  value: PropTypes.string,
};

PasswordStrengthInput.defaultProps = {
  width: '350px',
  value: '',
};

export default PasswordStrengthInput;
