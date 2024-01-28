import * as yup from "yup";

export const createValidationSchema = (currentYear) => {
  const startOfYear = new Date(currentYear, 0, 1); // January 1st of the current year
  const endOfYear = new Date(currentYear, 11, 31); // December 31st of the current year

  return yup.object().shape({
    dayDate: yup
      .date()
      .min(
        startOfYear,
        `Дата должна быть не раньше ${startOfYear.toLocaleDateString()}`
      )
      .max(
        endOfYear,
        `Дата должна быть не позднее ${endOfYear.toLocaleDateString()}`
      )
      .required("Это поле обязательно для заполнения"),
  });
};
