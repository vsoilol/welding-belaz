import { userRoles, isMaster, isInspector } from 'core/constants';
import * as yup from 'yup';

export const createValidationSchema = (
  startTaskDate,
  manufacturedAmountValue,
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

      manufacturedAmount: yup
        .number()
        .min(0, `Количество должно быть больше 0`)
        .required('Это поле обязательно для заполнения'),
    });
  }

  if (isInspector(userRole)) {
    validationSchema = validationSchema.shape({
      inspectorId: yup.string().required('Это поле обязательно для заполнения'),
      defectiveAmount: yup
        .number()
        .min(0, `Количество должно быть больше 0`)
        .required('Это поле обязательно для заполнения')
        .test(
          'is-less-than-manufacturedAmount',
          'Должно быть меньше, чем количество изготовленной продукции',
          function (value) {
            const { manufacturedAmount } = this.parent;

            if (manufacturedAmount) {
              return value <= manufacturedAmount;
            }

            return value <= manufacturedAmountValue;
          }
        ),
    });
  }

  return validationSchema;
  // sequenceNumbers: yup
  //   .array()
  //   .of(yup.string().required('Это поле обязательно для заполнения'))
  //   .required('Это поле обязательно для заполнения'),
  // amountFromPlan: yup
  //   .number()
  //   .min(0, 'Количество должно быть больше 0')
  //   .required('Это поле обязательно для заполнения'),
};
