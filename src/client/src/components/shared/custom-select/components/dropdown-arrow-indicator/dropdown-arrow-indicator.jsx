import React from 'react';
import PropTypes from 'prop-types';
import { ReactComponent as ChevronDownIcon } from 'assets/icons/chevronDownGreen.svg';

const DropdownArrowIndicator = ({ selectProps }) => {
  const { menuIsOpen } = selectProps;

  const arrowStyle = {
    width: '12px',
    marginRight: '20px',
    transform: menuIsOpen ? 'rotate(180deg)' : 'none',
    pointerEvents: 'none',
  };

  return <ChevronDownIcon style={arrowStyle} />;
};

DropdownArrowIndicator.propTypes = {
  selectProps: PropTypes.object.isRequired,
};

export default DropdownArrowIndicator;
