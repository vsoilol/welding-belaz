import React from 'react';
// import PropTypes from 'prop-types';
import { ReactComponent as UserIcon } from 'assets/icons/login.svg';
import DefaultInput from '../DefaultInput';

import styles from './style.module.css';

const UserInput = props => {
  return (
    <div className={styles.wrapper}>
      <UserIcon
        style={{ width: '15px', pointerEvents: 'none' }}
        className={styles.icon}
      />

      <DefaultInput type="email" {...props} />
    </div>
  );
};

UserInput.propTypes = {};

UserInput.defaultProps = {};

export default UserInput;
