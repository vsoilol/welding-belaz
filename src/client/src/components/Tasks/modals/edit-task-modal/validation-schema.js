import * as yup from 'yup';

export const createValidationSchema = currentDate => {
  return yup.object().shape({
    date: yup
      .date()
      .min(
        currentDate,
        `Дата должна быть не раньше ${currentDate.toLocaleDateString()}`
      )
      .required('Это поле обязательно для заполнения'),
    status: yup
      .array()
      .min(1, 'Это поле обязательно для заполнения')
      .required('Это поле обязательно для заполнения'),
  });
};
