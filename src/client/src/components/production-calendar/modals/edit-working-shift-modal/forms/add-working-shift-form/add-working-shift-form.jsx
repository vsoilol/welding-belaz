import React from "react";
import { Formik, Form } from "formik";
import {
  Button,
  CustomFormikTextInput,
  CustomFormikField,
} from "components/shared";
import { validationSchema } from "./validation-schema";
import styles from "../../../modal-style.module.scss";

export const AddWorkingShiftForm = ({
  currentYear,
  toggleModal,
  createWorkingShift,
}) => {
  const initialFormValues = {
    number: 1,
    shiftStart: "",
    shiftEnd: "",
    breakStart: "",
    breakEnd: "",
  };

  const handleFormSubmit = async (values, { setSubmitting }) => {
    try {
      const workingShift = {
        ...values,
        year: currentYear,
        dayId: null,
      };

      createWorkingShift(workingShift);
      toggleModal(false);
    } catch (error) {
      console.error("Error submitting form:", error);
    }

    setSubmitting(false);
  };

  return (
    <Formik
      initialValues={initialFormValues}
      enableReinitialize
      onSubmit={handleFormSubmit}
      validationSchema={validationSchema}
    >
      {({ isSubmitting, isValid }) => (
        <Form>
          <div className={styles.rowWithoutMargin}>
            <CustomFormikField name="number">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px", width: 380 }}
                placeholder="Номер смены"
                type="number"
              />
            </CustomFormikField>
          </div>

          <div className={styles.rowWithoutMargin}>
            <CustomFormikField name="shiftStart">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                placeholder="Начало работы"
              />
            </CustomFormikField>

            <CustomFormikField name="shiftEnd">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                placeholder="Конец работы"
              />
            </CustomFormikField>
          </div>

          <div className={styles.rowWithoutMargin}>
            <CustomFormikField name="breakStart">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                placeholder="Начало перерыва"
              />
            </CustomFormikField>

            <CustomFormikField name="breakEnd">
              <CustomFormikTextInput
                width="200"
                style={{ height: 40, padding: "0 20px 0 30px" }}
                placeholder="Конец перерыва"
              />
            </CustomFormikField>
          </div>

          <div className={styles.rowWithoutMargin}>
            <Button disabled={!isValid || isSubmitting} type="submit">
              Добавить
            </Button>
          </div>
        </Form>
      )}
    </Formik>
  );
};
