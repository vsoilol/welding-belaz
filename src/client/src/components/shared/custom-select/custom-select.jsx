import React from "react";
import PropTypes from "prop-types";
import Select from "react-select";
import { CustomSelectOption, DropdownArrowIndicator } from "./components";
import selectStyles from "./select-styles";

export const CustomSelect = ({
  options,
  width,
  defaultValue,
  height,
  onChange,
  value,
  ...restProps
}) => {
  const customStyles = {
    ...selectStyles,
    container: (base) => ({
      ...base,
      borderRadius: "20px",
      paddingLeft: "12px",
      width: width || "260px",
      border: "1px solid #E1E1E1",
      "&:focus": { outline: "none" },
      "&:active": { outline: "none" },
    }),
    placeholder: (base) => ({
      ...base,
      color: "#a6a6a6",
    }),
    menuPortal: (base) => ({ ...base, zIndex: 9999 }),
  };

  return (
    <Select
      {...restProps}
      styles={customStyles}
      components={{
        DropdownIndicator: DropdownArrowIndicator,
        Option: CustomSelectOption,
        IndicatorSeparator: () => null,
      }}
      options={options}
      value={value}
      style={{ width, height }}
      menuPortalTarget={document.body}
      onChange={onChange}
    />
  );
};

CustomSelect.propTypes = {
  options: PropTypes.arrayOf(PropTypes.object),
  name: PropTypes.string,
  defaultValue: PropTypes.string,
  placeholder: PropTypes.string,
  width: PropTypes.string,
  height: PropTypes.string,
  isSearchable: PropTypes.bool,
  onChange: PropTypes.func,
  isDisabled: PropTypes.bool,
};

CustomSelect.defaultProps = {
  options: [],
  // value: "",
  name: "select",
  defaultValue: "",
  placeholder: "",
  width: "260px",
  height: "40px",
  isSearchable: false,
  onChange: () => {},
  isDisabled: false,
};
