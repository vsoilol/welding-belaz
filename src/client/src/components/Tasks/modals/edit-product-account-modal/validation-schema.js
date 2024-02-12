import * as yup from 'yup';

export const createValidationSchema = currentDate => {
  return yup.object().shape({
    sequenceNumbers: yup
      .array()
      .of(yup.string().required('Это поле обязательно для заполнения'))
      .required('Это поле обязательно для заполнения'),
  });
};
