import React from 'react';
import PropTypes from 'prop-types';
import DefaultInput from './DefaultInput';
import PasswordInput from './PasswordInput';
import PasswordStrengthInput from './PasswordStrengthInput';
import SearchInput from './SearchInput';
import BillingInput from './BillingInput';
import UserInput from './UserInput';

const Input = ({ type, ...props }) => {
  return (
    <>
      {type === 'search' ? (
        <SearchInput {...props} />
      ) : type === 'user' ? (
        <UserInput {...props} />
      ) : type === 'password' ? (
        <PasswordInput {...props} />
      ) : type === 'passwordStrength' ? (
        <PasswordStrengthInput {...props} />
      ) : type === 'billing' ? (
        <BillingInput {...props} />
      ) : (
        <DefaultInput type={type} {...props} />
      )}
    </>
  );
};

Input.propTypes = {
  type: PropTypes.string,
};

Input.defaultProps = {
  type: 'text',
};

export default Input;
