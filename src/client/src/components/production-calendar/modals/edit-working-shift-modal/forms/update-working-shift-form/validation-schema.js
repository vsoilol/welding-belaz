import * as yup from "yup";

const timeRegExp = /^(0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])$/;

export const validationSchema = yup.object().shape({
  workingShiftId: yup.string().required("Это поле обязательно для заполнения"),

  number: yup
    .number()
    .min(1, "Номер должен быть больше 1")
    .max(10, "Номер должен быть меньше 10")
    .required("Это поле обязательно для заполнения"),

  shiftStart: yup
    .string()
    .required("Это поле обязательно для заполнения")
    .matches(timeRegExp, "Время должно быть в формате HH:MM"),
  shiftEnd: yup
    .string()
    .required("Это поле обязательно для заполнения")
    .matches(timeRegExp, "Время должно быть в формате HH:MM"),
  breakStart: yup
    .string()
    .required("Это поле обязательно для заполнения")
    .matches(timeRegExp, "Время должно быть в формате HH:MM"),
  breakEnd: yup
    .string()
    .required("Это поле обязательно для заполнения")
    .matches(timeRegExp, "Время должно быть в формате HH:MM"),
});
