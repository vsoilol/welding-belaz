import * as yup from 'yup';

export const createValidationSchema = currentDate => {
  return yup.object().shape({
    sequenceNumbers: yup
      .array()
      .of(yup.string().required('Это поле обязательно для заполнения'))
      .required('Это поле обязательно для заполнения'),

    amountFromPlan: yup
      .number()
      .min(0, 'Количество должно быть больше 0')
      .required('Это поле обязательно для заполнения'),
  });
};
