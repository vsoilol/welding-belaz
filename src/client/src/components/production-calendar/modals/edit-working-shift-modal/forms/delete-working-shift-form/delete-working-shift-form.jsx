import React, { useMemo } from "react";
import { Formik, Form } from "formik";
import {
  Button,
  CustomFormikSelect,
  CustomFormikField,
} from "components/shared";
import { useCalendarStore } from "store/calendar";
import { validationSchema } from "./validation-schema";
import styles from "../../../modal-style.module.scss";

export const DeleteWorkingShiftForm = ({ toggleModal }) => {
  const { mainWorkingShifts, deleteWorkingShift } = useCalendarStore();

  // Memoize working shift options to avoid recalculating on every render
  const workingShiftOptions = useMemo(
    () =>
      mainWorkingShifts.map((shift) => ({
        value: shift.id,
        label: `Смена ${shift.number}`,
      })),
    [mainWorkingShifts]
  );

  const initialFormValues = {
    workingShiftId: "",
  };

  const handleFormSubmit = async (values, { setSubmitting }) => {
    try {
      const { workingShiftId } = values;

      deleteWorkingShift(workingShiftId);
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
            <CustomFormikField name="workingShiftId">
              <CustomFormikSelect
                width="380px"
                placeholder="Смена"
                options={workingShiftOptions}
              />
            </CustomFormikField>
          </div>
          <div className={styles.row}>
            <Button disabled={!isValid || isSubmitting} type="submit">
              Удалить
            </Button>
          </div>
        </Form>
      )}
    </Formik>
  );
};