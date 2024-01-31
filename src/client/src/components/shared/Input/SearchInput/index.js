import React from 'react';
// import PropTypes from 'prop-types';
import { ReactComponent as SearchIcon } from 'assets/icons/search.svg';
import DefaultInput from '../DefaultInput';

import styles from './style.module.scss';

const SearchInput = props => {
  return (
    <div className={styles.wrapper}>
      <SearchIcon
        style={{ width: '15px', pointerEvents: 'none' }}
        className={styles.icon}
      />

      <DefaultInput {...props} />
    </div>
  );
};

SearchInput.propTypes = {};

SearchInput.defaultProps = {};

export default SearchInput;
