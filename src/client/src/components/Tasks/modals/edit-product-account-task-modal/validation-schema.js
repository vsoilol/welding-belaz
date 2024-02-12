import { isMaster, isInspector } from 'core/constants';
import * as yup from 'yup';

export const createValidationSchema = (
  startTaskDate,
  isManufacturedValue,
  userRole
) => {
  let validationSchema = yup.object();

  if (isMaster(userRole)) {
    validationSchema = validationSchema.shape({
      weldingEndDate: yup
        .date()
        .min(
          startTaskDate,
          `Дата должна быть не раньше ${startTaskDate.toLocaleDateString()}`
        ),

      isManufactured: yup
        .array()
        .length(1, 'Это поле обязательно для заполнения')
        .required('Это поле обязательно для заполнения'),
    });
  }

  if (isInspector(userRole)) {
    validationSchema = validationSchema.shape({
      inspectorId: yup.string().required('Это поле обязательно для заполнения'),

      isDefective: yup
        .array()
        .length(1, 'Это поле обязательно для заполнения')
        .required('Это поле обязательно для заполнения')
        .test(
          'is-less-than-manufacturedAmount',
          'Изделие ещё не изготовлено',
          function (value) {
            const { isManufactured } = this.parent;

            // Check if isManufactured is truthy and non-empty
            if (Array.isArray(isManufactured) && isManufactured.length > 0) {
              // Return true if isManufactured[0] is true
              // or if both isManufactured[0] and value[0] are false
              return (
                isManufactured[0] === true ||
                (isManufactured[0] === false && value[0] === false)
              );
            }

            // When isManufactured is not used, return true if isManufacturedValue is true
            // or if value[0] is false (assuming false should also be considered as a valid condition)
            return isManufacturedValue || value[0] === false;
          }
        ),
    });
  }

  return validationSchema;
};
