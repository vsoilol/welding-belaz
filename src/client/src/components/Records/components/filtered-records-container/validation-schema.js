import * as yup from 'yup';

export const createValidationSchema = () => {
  let validationSchema = yup
    .object({
      dateStart: yup
        .date()
        .nullable()
        .test(
          'start-end-date',
          'Дата начала должна быть раньше даты конца',
          function (value) {
            const { dateEnd } = this.parent;
            // Check if both dates are not null, then compare
            return !value || !dateEnd || new Date(value) <= new Date(dateEnd);
          }
        ),
      dateEnd: yup
        .date()
        .nullable()
        .test(
          'end-start-date',
          'Дата конца должна быть позже даты начала.',
          function (value) {
            const { dateStart } = this.parent;
            // Check if both dates are not null, then compare
            return (
              !value || !dateStart || new Date(value) >= new Date(dateStart)
            );
          }
        ),
    })
    .test(
      'both-or-none',
      'Обе даты должны быть заполнены или обе должны быть пусты',
      function (value) {
        const { dateStart, dateEnd } = value;
        // Check if both are null or both are not null
        if ((dateStart && dateEnd) || (!dateStart && !dateEnd)) {
          return true;
        } else {
          // Assigning the error to a custom key
          return this.createError({
            path: 'formError',
            message: 'Обе даты должны быть заполнены или обе должны быть пусты',
          });
        }
      }
    );

  return validationSchema;
};
