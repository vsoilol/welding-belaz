import * as yup from 'yup';

const timeRegExp = /^(0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])$/;

export const validationSchema = yup.object().shape({
  shiftStart: yup
    .string()
    .required('Это поле обязательно для заполнения')
    .matches(timeRegExp, 'Время должно быть в формате HH:MM'),
  shiftEnd: yup
    .string()
    .required('Это поле обязательно для заполнения')
    .matches(timeRegExp, 'Время должно быть в формате HH:MM'),
  breakStart: yup
    .string()
    .required('Это поле обязательно для заполнения')
    .matches(timeRegExp, 'Время должно быть в формате HH:MM'),
  breakEnd: yup
    .string()
    .required('Это поле обязательно для заполнения')
    .matches(timeRegExp, 'Время должно быть в формате HH:MM'),
});
