import React from 'react';
import { useField, useFormikContext } from 'formik';

export const CustomFormikCheckbox = ({ name, value, exclusive, ...props }) => {
  const { setFieldValue, values } = useFormikContext();
  const [field] = useField({ name, type: 'checkbox', value });

  const toggleSelection = () => {
    const selectedValues = values[name];
    let updatedValues = [];

    if (exclusive) {
      // Toggle selection for exclusive (radio-like) behavior:
      // Select the current item if not already selected, otherwise clear selection.
      updatedValues = selectedValues.includes(value) ? [] : [value];
    } else {
      // Toggle selection for non-exclusive (checkbox-like) behavior:
      // Add item to selection if not present, remove it if it is.
      const isCurrentlySelected = selectedValues.includes(value);
      updatedValues = isCurrentlySelected
        ? selectedValues.filter(item => item !== value) // Remove item
        : [...selectedValues, value]; // Add item
    }

    setFieldValue(name, updatedValues);
  };

  const isInputSelected = () => {
    const isSelected = values[name].includes(value);

    return isSelected;
  };

  return (
    <input
      type="checkbox"
      {...field}
      {...props}
      checked={isInputSelected()}
      onChange={toggleSelection}
    />
  );
};
