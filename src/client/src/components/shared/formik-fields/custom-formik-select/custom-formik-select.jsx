import React from "react";
import PropTypes from "prop-types";
import { useFormikContext } from "formik";
import { CustomSelect } from "components/shared/custom-select";

const CustomFormikSelect = ({
  options,
  field,
  meta,
  onChange,
  name,
  ...restProps
}) => {
  const { setFieldValue } = useFormikContext();

  const value = options?.filter((o) => {
    const isArrayValue = Array.isArray(field.value);

    if (isArrayValue) {
      const values = field.value;
      return values.includes(o.value);
    } else {
      return field.value === o.value;
    }
  });

  return (
    <CustomSelect
      {...restProps}
      options={options}
      value={value}
      onChange={(val) => {
        const _val = val;
        const isArray = Array.isArray(_val);
        if (isArray) {
          const values = _val.map((o) => o.value);
          setFieldValue(name, values);
        } else {
          setFieldValue(name, _val.value);
        }

        onChange(val);
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
