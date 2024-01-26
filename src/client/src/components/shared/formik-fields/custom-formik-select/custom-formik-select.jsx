import React, { useEffect } from "react";
import PropTypes from "prop-types";
import Select from "react-select";
import { useField, useFormikContext } from "formik";
import { CustomSelectOption, DropdownArrowIndicator } from "./components";
import selectStyles from "./select-styles";
import styles from "./custom-formik-select.module.scss";

const CustomFormikSelect = ({
  options,
  width,
  defaultValue,
  height,
  field,
  meta,
  name,
  ...restProps
}) => {
  const { setFieldValue } = useFormikContext();

  useEffect(() => {
    // console.log("Field:", field);
    // console.log("Meta:", meta);
    // console.log("restProps:", restProps);
  }, [field, meta, restProps]);

  const value = options?.filter((o) => {
    const isArrayValue = Array.isArray(field.value);

    if (isArrayValue) {
      const values = field.value;
      return values.includes(o.value);
    } else {
      return field.value === o.value;
    }
  });

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
      onChange={(val) => {
        const _val = val;
        const isArray = Array.isArray(_val);
        if (isArray) {
          const values = _val.map((o) => o.value);
          setFieldValue(name, values);
        } else {
          setFieldValue(name, _val.value);
        }
      }}
    />
  );
};

CustomFormikSelect.propTypes = {
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

CustomFormikSelect.defaultProps = {
  options: [],
  value: "",
  name: "select",
  defaultValue: "",
  placeholder: "",
  width: "260px",
  height: "40px",
  isSearchable: false,
  onChange: () => {},
  isDisabled: false,
};

export default CustomFormikSelect;
