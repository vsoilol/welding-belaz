import React from 'react';
import PropTypes from 'prop-types';
import { components } from 'react-select';
import styles from './custom-select-option.module.scss';

const CustomSelectOption = ({
  isSelected,
  label,
  innerProps,
  ...restProps
}) => {
  return (
    <div {...innerProps} className={isSelected ? styles.selectedOption : ''}>
      {isSelected ? label : <components.Option {...restProps} label={label} />}
    </div>
  );
};

CustomSelectOption.propTypes = {
  innerProps: PropTypes.object.isRequired,
  isSelected: PropTypes.bool.isRequired,
  label: PropTypes.string.isRequired,
};

export default CustomSelectOption;
