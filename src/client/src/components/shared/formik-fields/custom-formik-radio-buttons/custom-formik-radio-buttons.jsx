import { Field } from 'formik';
import React from 'react';

export const CustomFormikRadioButtons = ({
  name,
  options,
  fieldClassName,
  ...restProps
}) => {
  return (
    <Field name={name} {...restProps}>
      {({ field }) => {
        return options.map(option => (
          <div className={fieldClassName} key={option.key}>
            <input
              type="radio"
              id={option.value}
              {...field}
              value={option.value}
              checked={field.value === option.value}
            />
            <label htmlFor={option.value}>{option.key}</label>
          </div>
        ));
      }}
    </Field>
  );
};
