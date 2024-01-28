import * as yup from "yup";

export const validationSchema = yup.object().shape({
  workingShiftId: yup.string().required("Это поле обязательно для заполнения"),
});
