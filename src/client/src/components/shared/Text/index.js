import React from 'react';
import PropTypes from 'prop-types';
import styles from './style.module.css';

const Text = ({ children, className, type, tag }) => {
  const classNames = `${styles.default} ${type && styles[type]} ${className}`;

  switch (tag) {
    case 'h2':
      return <h2 className={classNames}>{children}</h2>;
    case 'p':
      return <p className={classNames}>{children}</p>;
    default:
      return <span className={classNames}>{children}</span>;
  }
};

Text.propTypes = {
  children: PropTypes.string.isRequired,
  className: PropTypes.string,
  type: PropTypes.string,
  tag: PropTypes.string,
};

Text.defaultProps = {
  type: '',
  tag: '',
  className: '',
};

export default Text;
