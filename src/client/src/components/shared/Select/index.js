import React from 'react';
import PropTypes from 'prop-types';
import Select, { components } from 'react-select';
import { ReactComponent as Arrow } from 'assets/icons/chevronDownGreen.svg';
import selectStyles from './selectStyles';
import customOptionsStyles from './customOptionStyles';

const DropdownIndicator = ({ selectProps }) => {
  const { menuIsOpen } = selectProps;
  if (menuIsOpen)
    return (
      <Arrow
        style={{
          width: '12px',
          marginRight: '20px',
          transform: 'rotate(180deg)',
          pointerEvents: 'none',
        }}
      />
    );
  return (
    <Arrow
      style={{ width: '12px', marginRight: '20px', pointerEvents: 'none' }}
    />
  );
};

DropdownIndicator.propTypes = {
  selectProps: PropTypes.object.isRequired,
};

const CustomOption = props => {
  const { isSelected, label, innerProps } = props;
  return isSelected ? (
    <div {...innerProps} style={customOptionsStyles}>
      {label}
      {/* <CheckMark
        style={{
          width: '16px',
          marginRight: '20px',
          pointerEvents: 'none',
        }} */}
    </div>
  ) : (
    <components.Option {...props} />
  );
};

CustomOption.propTypes = {
  innerProps: PropTypes.object.isRequired,
  isSelected: PropTypes.bool.isRequired,
  label: PropTypes.string.isRequired,
};

const ReactSelect = ({
  options,
  value,
  name,
  defaultValue,
  width,
  height,
  isSearchable,
  onChange,
  placeholder,
  isDisabled,
}) => {
  const getValue = Array.isArray(options)
    ? options.filter(option => {
        if (value instanceof Array) {
          return value.includes(option.value);
        }
        return option.value === value;
      })
    : [];

  return (
    <Select
      styles={{
        ...selectStyles,
        container: base => ({
          ...base,
          borderRadius: '20px',
          paddingLeft: '12px',
          width: width || '260px',
          height: height || '40px',
          border: '1px solid #E1E1E1',
          '&:focus': {
            outline: 'none',
          },
          '&:active': {
            outline: 'none',
          },
        }),
        placeholder: base => ({
          ...base,
          color: '#a6a6a6',
        }),
        menuPortal: base => ({ ...base, zIndex: 9999 }),
      }}
      components={{
        DropdownIndicator,
        Option: CustomOption,
        IndicatorSeparator: () => null,
      }}
      options={options}
      value={(getValue.length !== 0 ? getValue : options[defaultValue]) || null}
      name={name}
      placeholder={placeholder}
      isSearchable={isSearchable}
      onChange={onChange}
      style={{ width, height }}
      isDisabled={isDisabled}
      menuPortalTarget={document.body}
    />
  );
};

ReactSelect.propTypes = {
  options: PropTypes.arrayOf(PropTypes.object),
  value: PropTypes.string,
  name: PropTypes.string,
  defaultValue: PropTypes.string,
  placeholder: PropTypes.string,
  width: PropTypes.string,
  height: PropTypes.string,
  isSearchable: PropTypes.bool,
  onChange: PropTypes.func,
  isDisabled: PropTypes.bool,
};
ReactSelect.defaultProps = {
  options: [],
  value: '',
  name: 'select',
  defaultValue: '',
  placeholder: '',
  width: '260px',
  height: '40px',
  isSearchable: false,
  onChange: () => {},
  isDisabled: false,
};
export default ReactSelect;
