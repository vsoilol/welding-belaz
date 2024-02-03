import * as yup from 'yup';

export const validationSchema = yup.object().shape({
  sequenceNumber: yup.string(),
});
